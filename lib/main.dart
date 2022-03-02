import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_pomme/data/tasks_collection.dart';
import 'package:todo_pomme/screens/task_list.dart';

void main() {
  runApp(const TodoList());
}

class TodoList extends StatelessWidget {
  const TodoList({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TaskCollection>(
        create: (context) => TaskCollection(),
        child: MaterialApp(
          title: 'Todo Pomme',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const TaskList(title: 'Todo List'),
        ));
  }
}
