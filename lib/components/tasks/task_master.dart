import 'package:flutter/material.dart';
import 'package:todo_pomme/classes/task.dart';
import 'package:todo_pomme/components/tasks/task_preview.dart';

class TaskMaster extends StatelessWidget {
  const TaskMaster({Key? key, required this.taskList}) : super(key: key);

  final List<Task> taskList;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: taskList.map<Widget>((t) => TaskPreview(task: t)).toList(),
    );
  }
}
