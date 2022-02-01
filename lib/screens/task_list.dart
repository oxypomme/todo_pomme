import 'package:flutter/material.dart';
import 'package:todo_pomme/classes/task.dart';
import 'package:todo_pomme/components/tasks/task_details.dart';
import 'package:todo_pomme/components/tasks/task_master.dart';
import 'package:todo_pomme/data/tasks.dart' as data;

class TaskList extends StatefulWidget {
  const TaskList({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  Task? _currentTask;

  void onItemClick(Task task) {
    setState(() {
      _currentTask = task;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(children: [
          TaskDetail(task: _currentTask),
          TaskMaster(
            taskList: data.tasks,
            onItemClick: onItemClick,
          )
        ]));
  }
}
