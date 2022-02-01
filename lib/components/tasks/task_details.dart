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
        child: Column(
          children: [
            Text("Label : " + (task?.content ?? '')),
            Text("Status : " + (task?.completed.toString() ?? '')),
            Text("Creation : " + (task?.createdAt.toString() ?? '')),
            Row(
              children: [
                ElevatedButton(
                    onPressed: () => onDeletePressed(context),
                    child: const Text("Supprimer"))
              ],
            )
          ],
        ));
  }
}
