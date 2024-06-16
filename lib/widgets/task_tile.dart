import 'package:flutter/material.dart';
import '../models/task.dart';
import '../utils/custom_styles.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  final Function onTaskToggle;
  final Function onTaskDelete;
  final Function onTaskEdit;

  const TaskTile({
    required this.task,
    required this.onTaskToggle,
    required this.onTaskDelete,
    required this.onTaskEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        title: Text(
          task.title,
          style: task.isCompleted
              ? CustomStyles.taskCompletedTitle
              : CustomStyles.taskTitle,
        ),
        subtitle: Text(
          task.description,
          style: CustomStyles.taskSubtitle,
        ),
        leading: Checkbox(
          value: task.isCompleted,
          onChanged: (value) => onTaskToggle(),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () => onTaskEdit(),
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => onTaskDelete(),
            ),
          ],
        ),
      ),
    );
  }
}
