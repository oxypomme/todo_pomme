import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data/tasks_collection.dart';

class TaskDetails extends StatelessWidget {
  const TaskDetails({Key? key}) : super(key: key);

  void onDeletePressed(BuildContext context) {
    final task =
        Provider.of<TaskCollection>(context, listen: false).currentTask;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content:
          Text('Confirmer la supression de "' + (task?.content ?? '') + '"'),
      action: SnackBarAction(
        label: 'OK',
        onPressed: () {
          Provider.of<TaskCollection>(context, listen: false).delete(task!);
        },
      ),
    ));
  }

  void onEditPressed(BuildContext context) {
    final task =
        Provider.of<TaskCollection>(context, listen: false).currentTask;
    Navigator.pushNamed(context, '/one_task', arguments: task);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskCollection>(
      builder: (context, collection, child) => Visibility(
          visible: collection.currentTask != null,
          child: Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Column(
              children: [
                Text((collection.currentTask?.content ?? '')),
                Text((collection.currentTask?.completed == true
                    ? 'Fait'
                    : 'A faire')),
                Text("Creation : " +
                    (collection.currentTask?.createdAt.toString() ?? '')),
                ButtonBar(
                  alignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () => onDeletePressed(context),
                      child: const Text("Supprimer"),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.red)),
                    ),
                    ElevatedButton(
                        onPressed: () => onEditPressed(context),
                        child: const Text("Editer")),
                  ],
                ),
                const Divider(),
              ],
            ),
          )),
    );
  }
}
