import 'package:flutter/material.dart';
import '../utils/custom_styles.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  final Function onTaskToggle;
  final Function onTaskDelete;
  final Function onTaskEdit;

  TaskTile({
    required this.task,
    required this.onTaskToggle,
    required this.onTaskDelete,
    required this.onTaskEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: CustomColors.darkCard,
      child: ListTile(
        title: Text(task.title, style: CustomStyles.taskTitle),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(task.description, style: CustomStyles.taskSubtitle),
            Text('Due: ${task.dueDate.toString().split(' ')[0]}', style: CustomStyles.taskSubtitle),
            Text('Assigned to: ${task.assignedTo}', style: CustomStyles.taskSubtitle),
            Text('Priority: ${task.priority}', style: CustomStyles.taskSubtitle),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.edit, color: Colors.grey),
              onPressed: () => onTaskEdit(),
            ),
            IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () => onTaskDelete(),
            ),
          ],
        ),
        leading: Checkbox(
          value: task.isCompleted,
          onChanged: (bool? value) {
            onTaskToggle();
          },
        ),
      ),
    );
  }
}
