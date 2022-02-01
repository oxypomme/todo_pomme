class Task {
  final int id;
  final String content;
  bool completed;
  final DateTime createdAt;

  Task(
      {required this.id,
      required this.content,
      this.completed = false,
      DateTime? createdAt})
      : createdAt = createdAt ?? DateTime.now();
}
