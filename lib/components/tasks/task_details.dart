import 'package:flutter/material.dart';
import 'package:todo_pomme/classes/task.dart';

class TaskDetail extends StatelessWidget {
  const TaskDetail({Key? key, required this.task, this.onDelete})
      : super(key: key);

  final Task? task;
  final Function(Task)? onDelete;

  void onDeletePressed(BuildContext context) {
    final snackBar = SnackBar(
      content:
          Text('Confirmer la supression de "' + (task?.content ?? '') + '"'),
      action: SnackBarAction(
        label: 'OK',
        onPressed: () {
          onDelete!(task!);
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
        visible: task != null,
        child: Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Column(
            children: [
              Text((task?.content ?? '')),
              Text((task?.completed == true ? 'Fait' : 'A faire')),
              Text("Creation : " + (task?.createdAt.toString() ?? '')),
              ButtonBar(
                alignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () => onDeletePressed(context),
                      child: const Text("Supprimer")),
                ],
              ),
              const Divider(),
            ],
          ),
        ));
  }
}
