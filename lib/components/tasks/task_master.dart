import 'package:flutter/material.dart';
import 'package:todo_pomme/classes/task.dart';
import 'package:todo_pomme/components/tasks/task_preview.dart';

class TaskMaster extends StatelessWidget {
  const TaskMaster({Key? key, required this.taskList, this.onItemClick})
      : super(key: key);

  final List<Task> taskList;
  final Function(Task)? onItemClick;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.separated(
      separatorBuilder: (context, i) => const Divider(),
      itemCount: taskList.length,
      itemBuilder: (context, i) => TaskPreview(
        task: taskList[i],
        onItemClick: () => onItemClick!(taskList[i]),
      ),
    ));
  }
}
