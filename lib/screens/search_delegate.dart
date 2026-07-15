import 'package:flutter/material.dart';
import '../models/roadmap_models.dart';
import '../theme/app_colors.dart';

class TopicSearchDelegate extends SearchDelegate<String> {
  final List<RoadmapSection> sections;
  final Function(String) onSearch;

  TopicSearchDelegate(this.sections, this.onSearch);

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      brightness: Brightness.dark,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.bgPrimary,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.textLight),
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(color: AppColors.textLight.withValues(alpha: 0.4), fontSize: 16),
        border: InputBorder.none,
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          color: AppColors.textLight,
          fontSize: 16,
          fontWeight: FontWeight.bold,
          fontFamily: 'Segoe UI',
        ),
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: AppColors.accentYellow,
      ),
      scaffoldBackgroundColor: AppColors.bgPrimary,
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear, color: AppColors.textLight),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back, color: AppColors.textLight),
      onPressed: () => close(context, ''),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildSearchResults();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _buildSearchResults();
  }

  Widget _buildSearchResults() {
    return Stack(
      children: [
        // Removed missing dark_canvas.png asset
        _buildSearchResultsBody(),
      ],
    );
  }

  Widget _buildSearchResultsBody() {
    if (query.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.search, size: 60, color: AppColors.textLight.withValues(alpha: 0.5)),
            const SizedBox(height: 15),
            Text(
              'Search any Flutter topic...',
              style: TextStyle(color: AppColors.textLight.withValues(alpha: 0.7), fontSize: 15),
            ),
          ],
        ),
      );
    }

    List<Map<String, String>> results = [];
    for (var section in sections) {
      for (var group in section.groups) {
        for (var topic in group.topics) {
          if (topic.name.toLowerCase().contains(query.toLowerCase()) ||
              topic.notes.toLowerCase().contains(query.toLowerCase())) {
            results.add({
              'topic': topic.name,
              'section': section.title,
              'group': group.name,
              'badge': topic.badge,
            });
          }
        }
      }
    }

    if (results.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.search_off, size: 60, color: AppColors.accentPink),
            const SizedBox(height: 15),
            Text(
              'No results found for "$query"',
              style: TextStyle(color: AppColors.textLight.withValues(alpha: 0.7), fontSize: 15),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      itemCount: results.length,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      itemBuilder: (context, index) {
        final r = results[index];
        final badgeColor = AppColors.getFilterColor(r['badge']!);
        return Card(
          margin: const EdgeInsets.only(bottom: 10),
          color: Colors.transparent,
          elevation: 0,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.bgSecondary,
              borderRadius: BorderRadius.zero,
            ),
            child: Stack(
              children: [
                // Removed missing section_banner.png asset
                InkWell(
              onTap: () {
                onSearch(r['topic']!);
                close(context, r['topic']!);
              },
              borderRadius: BorderRadius.zero,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            r['topic']!,
                            style: const TextStyle(
                              color: AppColors.text,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: badgeColor,
                            border: Border.all(color: AppColors.text, width: 4.0),
                            borderRadius: BorderRadius.zero,
                          ),
                          child: Text(
                            r['badge']!.toUpperCase(),
                            style: const TextStyle(
                              fontSize: 8,
                              fontWeight: FontWeight.w900,
                              color: AppColors.textLight,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Text(
                          '📖 ',
                          style: TextStyle(fontSize: 10),
                        ),
                        Expanded(
                          child: Text(
                            '${r['section']}  ›  ${r['group']}',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: AppColors.text.withValues(alpha: 0.6),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
              ],
            ),
          ),
        );
      },
    );
  }
}
