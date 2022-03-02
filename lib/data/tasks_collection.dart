import 'dart:collection';

import 'package:flutter/material.dart';

import '../classes/task.dart';
import 'tasks.dart' as data;

class TaskCollection extends ChangeNotifier {
  final _tasks = data.tasks;
  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);

  Task? _currentTask;
  Task? get currentTask => _currentTask;
  set currentTask(Task? task) {
    _currentTask = task;
    notifyListeners();
  }

  void create(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void update() {
    notifyListeners();
  }

  void delete(Task task) {
    _tasks.remove(task);
    currentTask = null;
    notifyListeners();
  }
}
