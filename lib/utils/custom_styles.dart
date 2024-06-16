import 'package:flutter/material.dart';

class CustomStyles {
  static const TextStyle appBarTitle = const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static const TextStyle taskTitle = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle taskCompletedTitle = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.lineThrough,
  );

  static const TextStyle taskSubtitle = const TextStyle(
    fontSize: 14,
    color: Colors.grey,
  );
}
