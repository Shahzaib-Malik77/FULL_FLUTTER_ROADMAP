/// Data models for the Flutter Roadmap app.
/// These models represent the curriculum structure.
library;

class TopicItem {
  final String name;
  final String badge; // "essential", "important", "optional"
  final String? content; // The actual teaching material
  bool isCompleted;
  bool isChecked;
  String notes;

  TopicItem({
    required this.name,
    required this.badge,
    this.content,
    this.isCompleted = false,
    this.isChecked = false,
    this.notes = '',
  });
}

class TopicGroup {
  final String name;
  final List<TopicItem> topics;
  bool isExpanded;

  TopicGroup({required this.name, required this.topics, this.isExpanded = false});

  int get completedCount => topics.where((t) => t.isCompleted || t.isChecked).length;
  int get totalCount => topics.length;
  double get progress =>
      totalCount == 0 ? 0.0 : completedCount / totalCount;
}

class RoadmapSection {
  final int id;
  final String title;
  final String level; // "beginner", "intermediate", "advanced", "expert"
  final String icon;
  final String description;
  final List<TopicGroup> groups;
  bool isExpanded;

  RoadmapSection({
    required this.id,
    required this.title,
    required this.level,
    required this.icon,
    required this.description,
    required this.groups,
    this.isExpanded = false,
  });

  int get completedCount =>
      groups.fold(0, (sum, g) => sum + g.completedCount);
  int get totalCount =>
      groups.fold(0, (sum, g) => sum + g.totalCount);
      
  int get completedTopics => completedCount;
  int get totalTopics => totalCount;

  double get progress =>
      totalCount == 0 ? 0.0 : completedCount / totalCount;
}

extension RoadmapProgress on List<RoadmapSection> {
  int get totalTopics => fold(0, (sum, section) => sum + section.totalTopics);
  int get completedTopics => fold(0, (sum, section) => sum + section.completedTopics);
  int get leftTopics => totalTopics - completedTopics;
  int get notedTopics => fold(0, (sum, section) => sum + section.groups.fold(0, (gSum, group) => gSum + group.topics.where((t) => t.notes.trim().isNotEmpty).length));
}
class RoadmapProgressState {
  final int totalTopics;
  final int completedTopics;
  final int notedTopics;

  RoadmapProgressState({
    required this.totalTopics,
    required this.completedTopics,
    required this.notedTopics,
  });

  int get leftTopics => totalTopics - completedTopics;
  double get progressPercent => totalTopics == 0 ? 0 : completedTopics / totalTopics;
}
