import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/home_view_model.dart';
import '../widgets/task_tile.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task Manager'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<HomeViewModel>(
          builder: (context, model, child) {
            if (model.tasks.isEmpty) {
              return Center(child: Text('No tasks available, add a new task.'));
            } else {
              return ListView.builder(
                itemCount: model.tasks.length,
                itemBuilder: (context, index) {
                  final task = model.tasks[index];
                  return TaskTile(
                    task: task,
                    onTaskToggle: () => model.toggleTaskCompletion(task),
                    onTaskDelete: () => model.deleteTask(task.id),
                  );
                },
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddTaskDialog(context),
        child: Icon(Icons.add),
        backgroundColor: Colors.blueAccent,
      ),
    );
  }

  void _showAddTaskDialog(BuildContext context) {
    final TextEditingController taskController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Task'),
          content: TextField(
            controller: taskController,
            decoration: InputDecoration(
              hintText: 'Enter task title',
              border: OutlineInputBorder(),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () => Navigator.pop(context),
            ),
            TextButton(
              child: Text('Add'),
              onPressed: () {
                if (taskController.text.isNotEmpty) {
                  Provider.of<HomeViewModel>(context, listen: false).addTask(taskController.text);
                  Navigator.pop(context);
                }
              },
            ),
          ],
        );
      },
    );
  }
}
