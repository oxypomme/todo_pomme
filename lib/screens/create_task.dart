import 'package:flutter/material.dart';
import '../components/tasks/task_form.dart';

class CreateTask extends StatelessWidget {
  const CreateTask({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: const TaskFrom());
  }
}
