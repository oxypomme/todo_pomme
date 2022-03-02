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
      if (widget.task != null) {
        //BUG: Not updating
        provider.update(widget.task!);
      } else {
        //TEST: Not tested
        provider.create(Task(
            id: 999, content: _contentController.text, completed: _completed));
      }
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Sauvegarde réussie !')),
      );
      Navigator.pop(context);
    }
  }

  void changeStatus(bool? newValue) {
    setState(() {
      _completed = newValue ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.task != null) {
      changeStatus(widget.task!.completed);
      _contentController.text = widget.task!.content;
    }
    return Form(
        key: _formKey,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _contentController,
                decoration: const InputDecoration(labelText: "Nom*"),
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
