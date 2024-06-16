import 'package:flutter/material.dart';

class Task {
  String id;
  String title;
  bool isCompleted;

  Task({required this.id, required this.title, this.isCompleted = false});
}

class HomeViewModel extends ChangeNotifier {
  List<Task> tasks = [];

  void addTask(String title) {
    final newTask = Task(id: DateTime.now().toString(), title: title);
    tasks.add(newTask);
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
}
