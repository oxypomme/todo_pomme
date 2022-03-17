import 'dart:collection';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../classes/task.dart';

final FirebaseDatabase db = FirebaseDatabase.instance;

class TaskCollection extends ChangeNotifier {
  TaskCollection() {
    // fetchTodos().then((value) {
    //   _tasks = value;
    //   notifyListeners();
    // });
    const userId = 'default';
    _tasksRef = db.ref('/tasks/$userId/');

    _tasksRef.onValue.listen((event) {
      _tasks = [];
      for (final task in event.snapshot.children) {
        if (task.exists) {
          _tasks.add(Task.fromFire(task));
        }
      }
      notifyListeners();
    });
  }

  late final DatabaseReference _tasksRef;
  List<Task> _tasks = [];
  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);

  Task? _currentTask;
  Task? get currentTask => _currentTask;
  set currentTask(Task? task) {
    _currentTask = task;
    notifyListeners();
  }

  Future<void> create(Task task) async {
    final ref = _tasksRef.push();
    await ref.set(task.toFire());
  }

  Future<void> update(Task task) async {
    final ref = _tasksRef.child(task.id!);
    await ref.set(task.toFire());
  }

  Future<void> delete(Task task) async {
    final ref = _tasksRef.child(task.id!);
    await ref.remove();

    // Check if deleted task is the current one
    if (currentTask?.id == task.id) {
      currentTask = null;
    }
  }
}
