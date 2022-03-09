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

  Task.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        content = json['title'],
        completed = json['completed'],
        createdAt = json['created'] ?? DateTime.now();

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': content,
        'completed': completed,
        'created': createdAt
      };
}
