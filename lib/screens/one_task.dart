import 'package:flutter/material.dart';
import '../components/tasks/task_form.dart';
import '../classes/task.dart';

class OneTask extends StatelessWidget {
  const OneTask({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final task = ModalRoute.of(context)!.settings.arguments as Task;

    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: TaskFrom(task: task));
  }
}
