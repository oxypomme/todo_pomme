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

  void update(Task task, int index) {
    _tasks[index] = task;
    // Check if edited task is the current one
    if (currentTask?.id == task.id) {
      currentTask = _tasks[index];
    }
    notifyListeners();
  }

  void delete(Task task) {
    _tasks.remove(task);
    // Check if deleted task is the current one
    if (currentTask?.id == task.id) {
      currentTask = null;
    }
    notifyListeners();
  }
}
