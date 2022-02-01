import 'package:flutter/material.dart';
import 'package:todo_pomme/classes/task.dart';

class TaskDetail extends StatelessWidget {
  const TaskDetail({Key? key, required this.task}) : super(key: key);

  final Task? task;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: task != null
          ? [
              Text("Label : " + (task?.content ?? '')),
              Text("Status : " + (task?.completed.toString() ?? '')),
              Text("Creation : " + (task?.createdAt.toString() ?? '')),
            ]
          : [],
    );
  }
}
