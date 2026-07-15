import 'dart:async';

import 'package:flutter/material.dart';
import '../data/database_helper.dart';
import '../models/roadmap_models.dart';
import '../data/roadmap_data.dart';
import '../theme/app_colors.dart';
import '../widgets/progress_panel.dart';

class RoadmapHomePage extends StatefulWidget {
  const RoadmapHomePage({super.key});

  @override
  State<RoadmapHomePage> createState() => _RoadmapHomePageState();
}

class _RoadmapHomePageState extends State<RoadmapHomePage>
    with SingleTickerProviderStateMixin {
  static const double _listCacheExtent = 1200;
  late List<RoadmapSection> sections;
  String selectedFilter = 'all';
  String searchQuery = '';
  late AnimationController _heroController;
  late Animation<double> _heroAnimation;
  final TextEditingController _searchController = TextEditingController();
  Timer? _searchDebounce;
  final ScrollController _scrollController = ScrollController();
  final Map<String, TextEditingController> _noteControllers = {};
  final Map<String, Timer> _noteSaveTimers = {};
  final Set<String> _expandedNotes = <String>{};
  bool _showBackToTop = false;

  late final ValueNotifier<RoadmapProgressState> _progressNotifier;
  List<RoadmapSection> _cachedFilteredSections = [];

  void _updateCache() {
    _progressNotifier.value = RoadmapProgressState(
      totalTopics: sections.totalTopics,
      completedTopics: sections.completedTopics,
      notedTopics: sections.notedTopics,
    );

    _cachedFilteredSections = sections;
    final normalizedQuery = searchQuery.trim().toLowerCase();
    if (selectedFilter != 'all') {
      _cachedFilteredSections = _cachedFilteredSections
          .where((s) => s.level == selectedFilter)
          .toList();
    }

    if (normalizedQuery.isNotEmpty) {
      final filtered = <RoadmapSection>[];
      for (var s in _cachedFilteredSections) {
        bool sectionMatches = s.title.toLowerCase().contains(normalizedQuery);
        final matchedGroups = <TopicGroup>[];

        for (var g in s.groups) {
          bool groupMatches = g.name.toLowerCase().contains(normalizedQuery);
          final matchedTopics = <TopicItem>[];

          for (var t in g.topics) {
            if (sectionMatches ||
                groupMatches ||
                t.name.toLowerCase().contains(normalizedQuery) ||
                t.notes.toLowerCase().contains(normalizedQuery)) {
              matchedTopics.add(t);
            }
          }

          if (matchedTopics.isNotEmpty) {
            // Modify original group so it stays open when search is cleared
            g.isExpanded = true;
            matchedGroups.add(
              TopicGroup(name: g.name, topics: matchedTopics, isExpanded: true),
            );
          }
        }

        if (matchedGroups.isNotEmpty || sectionMatches) {
          s.isExpanded = true;
          filtered.add(
            RoadmapSection(
              id: s.id,
              title: s.title,
              level: s.level,
              icon: s.icon,
              description: s.description,
              groups: sectionMatches && matchedGroups.isEmpty
                  ? s.groups
                  : matchedGroups,
              isExpanded: true,
            ),
          );
        }
      }
      _cachedFilteredSections = filtered;
    }
  }

  @override
  void initState() {
    super.initState();
    sections = getRoadmapData();
    _progressNotifier = ValueNotifier(
      RoadmapProgressState(
        totalTopics: sections.totalTopics,
        completedTopics: sections.completedTopics,
        notedTopics: sections.notedTopics,
      ),
    );
    _updateCache();
    _loadSavedProgress();
    _heroController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _heroAnimation = CurvedAnimation(
      parent: _heroController,
      curve: Curves.easeOutQuart,
    );
    _heroController.forward();

    _scrollController.addListener(() {
      if (_scrollController.offset > 300 && !_showBackToTop) {
        setState(() => _showBackToTop = true);
      } else if (_scrollController.offset <= 300 && _showBackToTop) {
        setState(() => _showBackToTop = false);
      }
    });
  }

  String _topicStorageKey(
    RoadmapSection section,
    TopicGroup group,
    TopicItem topic,
  ) {
    return '${section.id}|${group.name}|${topic.name}';
  }

  TextEditingController _controllerForTopic(String key, String initialText) {
    return _noteControllers.putIfAbsent(
      key,
      () => TextEditingController(text: initialText),
    );
  }

  Future<void> _loadSavedProgress() async {
    final savedTopics = await DatabaseHelper.instance.loadProgress();
    final savedNotes = await DatabaseHelper.instance.loadNotes();

    for (final section in sections) {
      for (final group in section.groups) {
        for (final topic in group.topics) {
          final key = _topicStorageKey(section, group, topic);
          topic.isChecked = savedTopics.contains(key);
          topic.notes = savedNotes[key] ?? '';
          final controller = _noteControllers[key];
          if (controller != null && controller.text != topic.notes) {
            controller.text = topic.notes;
          }
        }
      }
    }

    _updateCache();
    if (mounted) {
      setState(() {});
    }
  }

  Future<void> _saveProgress() async {
    final checkedTopics = <String>{};
    final notesByTopic = <String, String>{};

    for (final section in sections) {
      for (final group in section.groups) {
        for (final topic in group.topics) {
          final key = _topicStorageKey(section, group, topic);
          if (topic.isChecked) {
            checkedTopics.add(key);
          }
          if (topic.notes.trim().isNotEmpty) {
            notesByTopic[key] = topic.notes.trim();
          }
        }
      }
    }

    await DatabaseHelper.instance.saveProgress(checkedTopics);
    await DatabaseHelper.instance.saveNotes(notesByTopic);
  }

  void _setSearchQuery(String value) {
    if (_searchDebounce?.isActive ?? false) _searchDebounce!.cancel();
    _searchDebounce = Timer(const Duration(milliseconds: 300), () {
      setState(() {
        searchQuery = value;
        _updateCache();
      });
      if (_searchController.text != value) {
        _searchController.text = value;
        _searchController.selection = TextSelection.collapsed(
          offset: _searchController.text.length,
        );
      }
    });
  }

  void _toggleTopicChecked(TopicItem topic) {
    setState(() {
      topic.isChecked = !topic.isChecked;
      _updateCache();
    });
    _saveProgress();
  }

  void _toggleTopicNotes(String key) {
    setState(() {
      if (_expandedNotes.contains(key)) {
        _expandedNotes.remove(key);
      } else {
        _expandedNotes.add(key);
      }
    });
  }

  void _updateTopicNote(
    RoadmapSection section,
    TopicGroup group,
    TopicItem topic,
    String value,
  ) {
    final bool wasEmpty = topic.notes.trim().isEmpty;
    topic.notes = value;
    final bool isNowEmpty = topic.notes.trim().isEmpty;

    final key = _topicStorageKey(section, group, topic);
    _noteSaveTimers[key]?.cancel();
    _noteSaveTimers[key] = Timer(
      const Duration(milliseconds: 500),
      _saveProgress,
    );

    if (wasEmpty != isNowEmpty && mounted) {
      setState(() {
        _updateCache();
      });
    }
  }

  @override
  void dispose() {
    _heroController.dispose();
    _searchController.dispose();
    _searchDebounce?.cancel();
    _scrollController.dispose();
    for (final controller in _noteControllers.values) {
      controller.dispose();
    }
    for (final timer in _noteSaveTimers.values) {
      timer.cancel();
    }
    super.dispose();
  }

  List<RoadmapSection> get filteredSections => _cachedFilteredSections;

  void _toggleSectionExpansion(RoadmapSection tappedSection) {
    setState(() {
      final shouldExpand = !tappedSection.isExpanded;
      for (final section in sections) {
        section.isExpanded = identical(section, tappedSection) && shouldExpand;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final visibleSections = filteredSections;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/background_image.png',
              fit: BoxFit.fill,
            ),
          ),
          CustomScrollView(
            controller: _scrollController,
            cacheExtent: _listCacheExtent,
            physics: const ClampingScrollPhysics(),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            slivers: [
              SliverAppBar(
                pinned: true,
                backgroundColor: Colors.transparent,
                surfaceTintColor: Colors.transparent,
                scrolledUnderElevation: 0,
                elevation: 0,
                toolbarHeight: 90, // Increased height to accommodate larger banner
                titleSpacing: 16,
                title: Align(
                  alignment: Alignment.centerLeft,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/flutter_roadmap.png',
                      height: 80, // Increased size for better visibility and quality
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: FadeTransition(
                  opacity: _heroAnimation,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10), // Minimal padding so everything is close
                    child: Center(
                      child: Image.asset(
                        'assets/guide_badge.png',
                        fit: BoxFit.contain,
                        height: 85,
                      ),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: RoadmapProgressPanel(
                  progressNotifier: _progressNotifier,
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildFilterChip('All', 'all'),
                        _buildFilterChip('Beginner', 'beginner'),
                        _buildFilterChip('Intermediate', 'intermediate'),
                        _buildFilterChip('Advanced', 'advanced'),
                        _buildFilterChip('Expert', 'expert'),
                      ],
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.bgSecondary,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: AppColors.border, width: 1.0),
                    ),
                    child: TextField(
                      controller: _searchController,
                      onChanged: _setSearchQuery,
                      textInputAction: TextInputAction.search,
                      style: const TextStyle(
                        color: AppColors.text,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Search topics, sections, or your notes...',
                        hintStyle: TextStyle(
                          color: AppColors.text.withValues(alpha: 0.5),
                        ),
                        prefixIcon: const Icon(
                          Icons.search,
                          color: AppColors.text,
                        ),
                        suffixIcon: searchQuery.isEmpty
                            ? null
                            : IconButton(
                                onPressed: () => _setSearchQuery(''),
                                icon: const Icon(
                                  Icons.close,
                                  color: AppColors.text,
                                ),
                              ),
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        filled: false,
                      ),
                    ),
                  ),
                ),
              ),
              if (visibleSections.isEmpty)
                SliverToBoxAdapter(child: _buildEmptyState())
              else
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final section = visibleSections[index];
                      return _buildSectionCard(section, index);
                    },
                    childCount: visibleSections.length,
                    addAutomaticKeepAlives: true,
                    addRepaintBoundaries: true,
                    addSemanticIndexes: false,
                  ),
                ),

            ],
          ),
          if (_showBackToTop)
            Positioned(
              bottom: 20,
              right: 20,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.bgSecondary,
                  border: Border.all(color: AppColors.border, width: 1.0),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: FloatingActionButton.small(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  highlightElevation: 0,
                  onPressed: () {
                    _scrollController.animateTo(
                      0,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeOut,
                    );
                  },
                  child: const Icon(
                    Icons.arrow_upward,
                    color: AppColors.text,
                    size: 20,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.bgSecondary,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.border, width: 1.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Stack(
          children: [
            // Removed missing section_banner.png asset
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  const Icon(
                    Icons.search_off_rounded,
                    size: 46,
                    color: AppColors.text,
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'NO MATCHING ROADMAP SECTIONS',
                    style: TextStyle(
                      color: AppColors.text,
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Try another keyword or clear the level filter to see more topics.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.text,
                      height: 1.5,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.accent,
                      foregroundColor: AppColors.bgPrimary,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        selectedFilter = 'all';
                      });
                      _setSearchQuery('');
                    },
                    child: const Text(
                      'CLEAR SEARCH',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 11,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterChip(String label, String value) {
    final isSelected = selectedFilter == value;
    final chipColor = AppColors.getFilterColor(value);

    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedFilter = value;
            _updateCache();
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: isSelected
                ? chipColor.withOpacity(0.15)
                : AppColors.bgTertiary,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isSelected ? chipColor.withOpacity(0.5) : AppColors.border,
              width: 1.0,
            ),
          ),
          child: Text(
            label.toUpperCase(),
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w700,
              color: isSelected
                  ? AppColors.textLight
                  : AppColors.textLight.withValues(alpha: 0.7),
              letterSpacing: 0.5,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionCard(RoadmapSection section, int index) {
    final stepColor = AppColors.getSectionColor(index);
    final levelColor = AppColors.getFilterColor(section.level);
    final levelTextColor = AppColors.getFilterTextColor(section.level);
    final progress = section.totalTopics > 0
        ? section.completedTopics / section.totalTopics
        : 0.0;

    return RepaintBoundary(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: AppColors.bgSecondary,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.border, width: 1.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Stack(
            children: [
              // Removed missing section_banner.png asset
              Column(
                children: [
                  InkWell(
                    borderRadius: BorderRadius.zero,
                    onTap: () => _toggleSectionExpansion(section),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 48,
                                height: 48,
                                decoration: BoxDecoration(
                                  color: stepColor.withOpacity(0.1),
                                  border: Border.all(
                                    color: stepColor.withOpacity(0.3),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                child: Center(
                                  child: Text(
                                    section.id.toString().padLeft(2, '0'),
                                    style: TextStyle(
                                      fontFamily: 'Courier New',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                      color: stepColor,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 14),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _buildHighlightedText(
                                      section.title.toUpperCase(),
                                      const TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.text,
                                        letterSpacing: 0.5,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Row(
                                      children: [
                                        Text(
                                          '${section.totalTopics} TOPICS  •  ${section.groups.length} GROUPS',
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.text.withValues(
                                              alpha: 0.6,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 3,
                                    ),
                                    decoration: BoxDecoration(
                                      color: levelColor.withOpacity(0.15),
                                      border: Border.all(
                                        color: levelColor.withOpacity(0.5),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      section.level.toUpperCase(),
                                      style: TextStyle(
                                        fontSize: 8,
                                        fontWeight: FontWeight.w900,
                                        color: levelTextColor,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    '${section.completedTopics}/${section.totalTopics}',
                                    style: const TextStyle(
                                      fontFamily: 'Courier New',
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.text,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 8),
                              AnimatedRotation(
                                turns: section.isExpanded ? 0.5 : 0,
                                duration: const Duration(milliseconds: 300),
                                child: const Icon(
                                  Icons.keyboard_arrow_down,
                                  color: AppColors.text,
                                  size: 22,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Container(
                            height: 4,
                            decoration: BoxDecoration(
                              color: AppColors.bgPrimary,
                              borderRadius: BorderRadius.circular(2),
                              border: Border.all(
                                color: AppColors.border,
                                width: 0.5,
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(2),
                              child: LinearProgressIndicator(
                                value: progress,
                                backgroundColor: Colors.transparent,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  stepColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  AnimatedSize(
                    duration: const Duration(milliseconds: 220),
                    curve: Curves.easeOut,
                    alignment: Alignment.topCenter,
                    child: section.isExpanded
                        ? _buildExpandedContent(section)
                        : const SizedBox.shrink(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExpandedContent(RoadmapSection section) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: AppColors.bgPrimary,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.border, width: 1.0),
            ),
            child: Text(
              section.description,
              style: const TextStyle(
                fontSize: 12,
                color: AppColors.text,
                height: 1.5,
              ),
            ),
          ),
          const SizedBox(height: 16),
          ...section.groups.map((group) => _buildTopicGroup(section, group)),
        ],
      ),
    );
  }

  Widget _buildTopicGroup(RoadmapSection section, TopicGroup group) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              group.isExpanded = !group.isExpanded;
            });
          },
          child: Container(
            margin: const EdgeInsets.only(bottom: 8, top: 8),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            decoration: BoxDecoration(
              color: group.isExpanded
                  ? AppColors.bgTertiary
                  : AppColors.bgPrimary,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: group.isExpanded
                    ? AppColors.borderStrong
                    : AppColors.border,
                width: 1.0,
              ),
            ),
            child: Row(
              children: [
                Text(
                  group.isExpanded ? '📂 ' : '📁 ',
                  style: const TextStyle(fontSize: 16),
                ),
                Expanded(
                  child: _buildHighlightedText(
                    group.name.toUpperCase(),
                    const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textLight,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
                Text(
                  '${group.completedCount}/${group.totalCount}',
                  style: TextStyle(
                    fontFamily: 'Courier New',
                    fontWeight: FontWeight.bold,
                    color: AppColors.text.withOpacity(0.6),
                    fontSize: 12,
                  ),
                ),
                const SizedBox(width: 8),
                Icon(
                  group.isExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: AppColors.textMuted,
                  size: 20,
                ),
              ],
            ),
          ),
        ),
        if (group.isExpanded) ...[
          const SizedBox(height: 8),
          ...group.topics.map(
            (topic) => _buildTopicItem(section, group, topic),
          ),
          const SizedBox(height: 8),
        ],
      ],
    );
  }

  Widget _buildHighlightedText(String text, TextStyle style) {
    if (searchQuery.isEmpty) return Text(text, style: style);

    final query = searchQuery.toLowerCase();
    final lowerText = text.toLowerCase();

    if (!lowerText.contains(query)) return Text(text, style: style);

    List<TextSpan> spans = [];
    int start = 0;

    while (true) {
      final index = lowerText.indexOf(query, start);
      if (index < 0) {
        if (start < text.length) {
          spans.add(TextSpan(text: text.substring(start), style: style));
        }
        break;
      }

      if (index > start) {
        spans.add(TextSpan(text: text.substring(start, index), style: style));
      }

      spans.add(
        TextSpan(
          text: text.substring(index, index + query.length),
          style: style.copyWith(
            backgroundColor: AppColors.text,
            color: Colors.black, // Ensure contrast
          ),
        ),
      );

      start = index + query.length;
    }

    return RichText(text: TextSpan(children: spans));
  }

  Widget _buildTopicItem(
    RoadmapSection section,
    TopicGroup group,
    TopicItem topic,
  ) {
    final badgeColor = AppColors.getFilterColor(topic.badge);
    final badgeTextColor = AppColors.getFilterTextColor(topic.badge);
    final topicKey = _topicStorageKey(section, group, topic);
    final noteController = _controllerForTopic(topicKey, topic.notes);
    final notePreview = topic.notes.trim();
    final hasNote = notePreview.isNotEmpty;
    final isNoteOpen = _expandedNotes.contains(topicKey);

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: topic.isChecked
            ? AppColors.accent.withOpacity(0.1)
            : AppColors.bgTertiary,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: topic.isChecked
              ? AppColors.accent.withOpacity(0.3)
              : AppColors.border,
          width: 1.0,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () => _toggleTopicChecked(topic),
            borderRadius: BorderRadius.zero,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Row(
                children: [
                  Container(
                    width: 22,
                    height: 22,
                    decoration: BoxDecoration(
                      color: topic.isChecked
                          ? AppColors.accent
                          : AppColors.bgPrimary,
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                        color: topic.isChecked
                            ? AppColors.accent
                            : AppColors.borderStrong,
                        width: 1.5,
                      ),
                    ),
                    child: topic.isChecked
                        ? const Icon(
                            Icons.check,
                            size: 14,
                            color: AppColors.bgPrimary,
                            weight: 3.0,
                          )
                        : null,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildHighlightedText(
                      topic.name,
                      TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: AppColors.text,
                        decoration: topic.isChecked
                            ? TextDecoration.lineThrough
                            : null,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: badgeColor.withOpacity(0.1),
                      border: Border.all(
                        color: badgeColor.withOpacity(0.3),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      topic.badge.toUpperCase(),
                      style: TextStyle(
                        fontSize: 8,
                        fontWeight: FontWeight.w900,
                        color: badgeTextColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              OutlinedButton.icon(
                onPressed: () => _toggleTopicNotes(topicKey),
                icon: Icon(
                  isNoteOpen ? Icons.notes_rounded : Icons.note_add_outlined,
                  size: 14,
                  color: AppColors.text,
                ),
                label: Text(
                  (hasNote ? 'Edit note' : 'Add note').toUpperCase(),
                  style: const TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.5,
                    color: AppColors.text,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    color: isNoteOpen
                        ? AppColors.accent
                        : AppColors.borderStrong,
                    width: 1.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  backgroundColor: isNoteOpen
                      ? AppColors.accent.withOpacity(0.1)
                      : Colors.transparent,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  hasNote
                      ? notePreview.length > 50
                            ? '${notePreview.substring(0, 50)}...'
                            : notePreview
                      : 'No notes yet for this topic',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.normal,
                    color: AppColors.textMuted,
                  ),
                ),
              ),
            ],
          ),
          AnimatedSize(
            duration: const Duration(milliseconds: 180),
            curve: Curves.easeOut,
            child: isNoteOpen
                ? Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: AppColors.bgPrimary,
                            border: Border.all(
                              color: AppColors.border,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 12,
                              right: 12,
                              top: 4,
                              bottom: 4,
                            ),
                            child: TextField(
                              controller: noteController,
                              minLines: 3,
                              maxLines: 5,
                              style: const TextStyle(
                                fontFamily: 'Courier New',
                                fontSize: 13,
                                color: AppColors.text,
                                height: 1.69,
                              ),
                              onChanged: (value) => _updateTopicNote(
                                section,
                                group,
                                topic,
                                value,
                              ),
                              decoration: const InputDecoration(
                                hintText:
                                    'Write your notes, links, commands, or revision points here...',
                                hintStyle: TextStyle(
                                  fontFamily: 'Courier New',
                                  fontSize: 13,
                                  color: Colors.black38,
                                ),
                                border: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                filled: false,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Text(
                              hasNote
                                  ? '📝 Saved locally'
                                  : '✍️ Start typing to save',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: AppColors.text.withOpacity(0.6),
                              ),
                            ),
                            const Spacer(),
                            if (hasNote)
                              TextButton.icon(
                                onPressed: () {
                                  noteController.clear();
                                  _updateTopicNote(section, group, topic, '');
                                },
                                icon: const Icon(
                                  Icons.delete_outline,
                                  size: 16,
                                  color: AppColors.text,
                                ),
                                label: const Text(
                                  'CLEAR',
                                  style: TextStyle(
                                    color: AppColors.text,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
