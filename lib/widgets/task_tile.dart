import 'package:flutter/material.dart';
import '../viewmodels/home_view_model.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  final Function onTaskToggle;
  final Function onTaskDelete;

  const TaskTile({
    required this.task,
    required this.onTaskToggle,
    required this.onTaskDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        title: Text(
          task.title,
          style: TextStyle(
            decoration: task.isCompleted ? TextDecoration.lineThrough : TextDecoration.none,
            fontSize: 18,
          ),
        ),
        leading: Checkbox(
          value: task.isCompleted,
          onChanged: (value) => onTaskToggle(),
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          color: Colors.red,
          onPressed: () => onTaskDelete(),
        ),
      ),
    );
  }
}
