import 'package:flutter/material.dart';
import 'package:todo_pomme/components/tasks/task_details.dart';
import 'package:todo_pomme/components/tasks/task_master.dart';

class TaskList extends StatelessWidget {
  const TaskList({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Column(children: const [
          TaskDetails(),
          TaskMaster(),
        ]));
  }
}
