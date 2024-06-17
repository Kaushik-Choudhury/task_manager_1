class Task {
  String id;
  String title;
  String description;
  bool isCompleted;
  DateTime dueDate;
  String assignedTo;
  String priority;

  Task({
    required this.id,
    required this.title,
    required this.description,
    this.isCompleted = false,
    required this.dueDate,
    required this.assignedTo,
    required this.priority,
  });
}
