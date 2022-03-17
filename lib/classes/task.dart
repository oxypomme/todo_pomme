import 'package:firebase_database/firebase_database.dart';

class Task {
  final String? id;
  final String content;
  bool completed;
  final DateTime createdAt;

  Task(
      {this.id,
      required this.content,
      this.completed = false,
      DateTime? createdAt})
      : createdAt = createdAt ?? DateTime.now();

  factory Task.fromFire(DataSnapshot snapshot) {
    var data = snapshot.value as Map;
    return Task(
        id: snapshot.key,
        content: data['title'],
        completed: data['completed'],
        createdAt: DateTime.parse(data['created']));
  }

  Map<String, dynamic> toFire() => {
        'title': content,
        'completed': completed,
        'created': createdAt.toIso8601String()
      };

  Task.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        content = json['title'],
        completed = json['completed'],
        createdAt = json['created'] ?? DateTime.now();

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': content,
        'completed': completed,
        'created': createdAt.toIso8601String()
      };
}
