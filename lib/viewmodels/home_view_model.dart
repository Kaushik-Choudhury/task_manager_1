import 'package:flutter/material.dart';
import '../models/task_model.dart';

class HomeViewModel extends ChangeNotifier {
  List<Task> tasks = [];

  void addTask(Task task) {
    tasks.add(task);
    notifyListeners();
  }

  void toggleTaskCompletion(Task task) {
    task.isCompleted = !task.isCompleted;
    notifyListeners();
  }

  void deleteTask(String id) {
    tasks.removeWhere((task) => task.id == id);
    notifyListeners();
  }

  void updateTask(Task updatedTask) {
    final index = tasks.indexWhere((task) => task.id == updatedTask.id);
    if (index != -1) {
      tasks[index] = updatedTask;
      notifyListeners();
    }
  }
}
