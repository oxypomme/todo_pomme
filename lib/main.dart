import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './data/tasks_collection.dart';
import './screens/create_task.dart';
import './screens/one_task.dart';
import './screens/task_list.dart';

void main() {
  runApp(const TodoList());
}

class TodoList extends StatelessWidget {
  const TodoList({Key? key}) : super(key: key);

  static const title = 'TodoList';

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
            initialRoute: '/all_tasks',
            routes: {
              '/all_tasks': (context) => const TaskList(title: title),
              '/one_task': (context) => const OneTask(title: title),
              '/create_task': (context) => const CreateTask(title: title)
            }));
  }
}
