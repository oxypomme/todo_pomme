import 'package:flutter/material.dart';
import 'package:todo_pomme/components/tasks/task_menu.dart';
import '../components/tasks/task_details.dart';
import '../components/tasks/task_master.dart';

class TaskList extends StatelessWidget {
  const TaskList({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: const [TaskMenu()],
      ),
      body: Column(children: const [
        TaskDetails(),
        TaskMaster(),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/create_task');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
