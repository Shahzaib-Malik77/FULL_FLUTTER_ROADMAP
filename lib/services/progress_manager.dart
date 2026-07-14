import 'package:flutter/foundation.dart';
import '../data/roadmap_data.dart';
import '../models/roadmap_models.dart';

/// In-memory data manager for progress tracking.
/// Uses SharedPreferences-style persistence via simple serialization.
/// For v1, we keep it simple with ChangeNotifier for reactivity.
class ProgressManager extends ChangeNotifier {
  late List<RoadmapSection> _sections;
  int _totalXp = 0;
  int _currentStreak = 0;
  DateTime? _lastActiveDate;
  final Set<String> _completedTopicKeys = {};
  final Map<String, String> _notes = {};
  final Set<String> _bookmarks = {};

  ProgressManager() {
    _sections = getRoadmapData();
  }

  // Getters
  List<RoadmapSection> get sections => _sections;
  int get totalXp => _totalXp;
  int get currentStreak => _currentStreak;
  int get level => (_totalXp / 500).floor() + 1;
  double get levelProgress => (_totalXp % 500) / 500.0;

  int get totalTopics =>
      _sections.fold(0, (sum, s) => sum + s.totalCount);
  int get completedTopics => _completedTopicKeys.length;
  double get overallProgress =>
      totalTopics == 0 ? 0.0 : completedTopics / totalTopics;

  Set<String> get bookmarks => _bookmarks;
  Map<String, String> get notes => _notes;

  String _topicKey(int sectionId, String groupName, String topicName) =>
      '$sectionId|$groupName|$topicName';

  bool isCompleted(int sectionId, String groupName, String topicName) =>
      _completedTopicKeys.contains(_topicKey(sectionId, groupName, topicName));

  void toggleTopic(int sectionId, String groupName, String topicName) {
    final key = _topicKey(sectionId, groupName, topicName);
    // Find the topic in the data
    for (final section in _sections) {
      if (section.id == sectionId) {
        for (final group in section.groups) {
          if (group.name == groupName) {
            for (final topic in group.topics) {
              if (topic.name == topicName) {
                if (_completedTopicKeys.contains(key)) {
                  _completedTopicKeys.remove(key);
                  topic.isCompleted = false;
                  _totalXp = (_totalXp - 25).clamp(0, 999999);
                } else {
                  _completedTopicKeys.add(key);
                  topic.isCompleted = true;
                  _totalXp += 25;
                  _updateStreak();
                }
                notifyListeners();
                return;
              }
            }
          }
        }
      }
    }
  }

  void _updateStreak() {
    final today = DateTime.now();
    if (_lastActiveDate == null) {
      _currentStreak = 1;
    } else {
      final diff = today.difference(_lastActiveDate!).inDays;
      if (diff <= 1) {
        if (diff == 1) _currentStreak++;
      } else {
        _currentStreak = 1;
      }
    }
    _lastActiveDate = today;
  }

  // Notes
  String? getNote(String topicKey) => _notes[topicKey];

  void saveNote(String topicKey, String content) {
    if (content.trim().isEmpty) {
      _notes.remove(topicKey);
    } else {
      _notes[topicKey] = content;
    }
    notifyListeners();
  }

  // Bookmarks
  bool isBookmarked(String topicKey) => _bookmarks.contains(topicKey);

  void toggleBookmark(String topicKey) {
    if (_bookmarks.contains(topicKey)) {
      _bookmarks.remove(topicKey);
    } else {
      _bookmarks.add(topicKey);
    }
    notifyListeners();
  }

  // Section progress
  double sectionProgress(int sectionId) {
    for (final section in _sections) {
      if (section.id == sectionId) {
        return section.progress;
      }
    }
    return 0.0;
  }

  // Stats
  int get sectionsCompleted =>
      _sections.where((s) => s.progress >= 1.0).length;

  Map<String, int> get topicsByLevel {
    final map = <String, int>{};
    for (final section in _sections) {
      map[section.level] = (map[section.level] ?? 0) + section.totalCount;
    }
    return map;
  }

  Map<String, int> get completedByLevel {
    final map = <String, int>{};
    for (final section in _sections) {
      map[section.level] = (map[section.level] ?? 0) + section.completedCount;
    }
    return map;
  }
}
