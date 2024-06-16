class Task {
  String id;
  String title;
  String description;
  bool isCompleted;

  Task({required this.id, required this.title, this.description = '', this.isCompleted = false});
}
