import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/home_view_model.dart';
import '../widgets/task_tile.dart';
import '../widgets/task_form.dart';
import '../widgets/search_bar.dart';
import '../utils/custom_styles.dart';
import '../models/task.dart';


class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task Manager', style: CustomStyles.appBarTitle),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MySearchBar(),
          ),
          Expanded(
            child: Consumer<HomeViewModel>(
              builder: (context, model, child) {
                return ListView.builder(
                  itemCount: model.tasks.length,
                  itemBuilder: (context, index) {
                    final task = model.tasks[index];
                    return TaskTile(
                      task: task,
                      onTaskToggle: () => model.toggleTaskCompletion(task),
                      onTaskDelete: () => model.deleteTask(task.id),
                      onTaskEdit: () => _showEditTaskDialog(context, task),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddTaskDialog(context),
        child: Icon(Icons.add),
      ),
    );
  }

  void _showAddTaskDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return TaskForm();
      },
    );
  }

  void _showEditTaskDialog(BuildContext context, Task task) {
    showDialog(
      context: context,
      builder: (context) {
        return TaskForm(task: task);
      },
    );
  }
}
