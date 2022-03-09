import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../classes/task.dart';
import '../../data/tasks_collection.dart';

class TaskFrom extends StatefulWidget {
  const TaskFrom({Key? key, this.task}) : super(key: key);

  final Task? task;

  @override
  State<TaskFrom> createState() => _TaskFromState();
}

class _TaskFromState extends State<TaskFrom> {
  final _formKey = GlobalKey<FormState>();
  final _contentController = TextEditingController();

  bool _completed = false;

  void onSubmit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      var provider = Provider.of<TaskCollection>(context, listen: false);
      var id = widget.task?.id ?? provider.tasks.length;

      if (_contentController.text.isNotEmpty) {
        var task = Task(
            id: id, content: _contentController.text, completed: _completed);
        if (widget.task != null) {
          provider.update(task, id);
        } else {
          provider.create(task);
        }
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Sauvegarde réussie !')),
        );
        Navigator.pop(context);
      }
    }
  }

  void changeStatus(bool? newValue) {
    setState(() {
      _completed = newValue ?? false;
    });
  }

  @override
  void initState() {
    if (widget.task != null) {
      changeStatus(widget.task!.completed);
      _contentController.text = widget.task!.content;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _contentController,
                decoration: InputDecoration(
                    labelText: "Nom*",
                    errorText: _contentController.text.isEmpty
                        ? "Un nom est requis"
                        : null),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer un nom valide';
                  }
                  return null;
                },
                autofocus: true,
              ),
              CheckboxListTile(
                  title: Text(_completed ? "Fait" : "A faire"),
                  value: _completed,
                  onChanged: changeStatus,
                  controlAffinity: ListTileControlAffinity.leading),
              ButtonBar(
                alignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Annuler")),
                  ElevatedButton(
                      onPressed: () => onSubmit(context),
                      child: const Text("Sauvegarder"))
                ],
              ),
            ],
          ),
        ));
  }
}
