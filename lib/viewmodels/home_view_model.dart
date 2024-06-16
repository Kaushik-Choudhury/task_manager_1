import 'package:flutter/material.dart';
import '../models/task.dart';

class HomeViewModel extends ChangeNotifier {
  List<Task> _tasks = [];
  List<Task> _filteredTasks = [];

  List<Task> get tasks => _filteredTasks.isEmpty ? _tasks : _filteredTasks;

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void toggleTaskCompletion(Task task) {
    task.isCompleted = !task.isCompleted;
    notifyListeners();
  }

  void deleteTask(String id) {
    _tasks.removeWhere((task) => task.id == id);
    notifyListeners();
  }

  void updateTask(Task updatedTask) {
    int index = _tasks.indexWhere((task) => task.id == updatedTask.id);
    if (index != -1) {
      _tasks[index] = updatedTask;
      notifyListeners();
    }
  }

  void filterTasks(String query) {
    if (query.isEmpty) {
      _filteredTasks = [];
    } else {
      _filteredTasks = _tasks.where((task) => task.title.contains(query)).toList();
    }
    notifyListeners();
  }
}
