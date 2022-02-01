class Task {
  int id;
  String content;
  bool completed;
  DateTime createdAt;

  Task(
      {required this.id,
      required this.content,
      this.completed = false,
      DateTime? createdAt})
      : createdAt = createdAt ?? DateTime.now();
}
