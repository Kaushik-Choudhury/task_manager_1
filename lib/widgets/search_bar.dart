import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/home_view_model.dart';

class MySearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Search tasks',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
        prefixIcon: Icon(Icons.search),
      ),
      onChanged: (value) {
        Provider.of<HomeViewModel>(context, listen: false).filterTasks(value);
      },
    );
  }
}
