import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'views/home_views.dart';
import 'viewmodels/home_view_model.dart';
import 'utils/custom_styles.dart';
import 'utils/custom_colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
      ],
      child: MaterialApp(
        title: 'Task Manager',
        theme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.deepPurple,
          colorScheme: ColorScheme.dark(
            secondary: CustomColors.accentPurple,
          ),
          textTheme: TextTheme(
            headlineLarge: CustomStyles.appBarTitle,
            bodyLarge: CustomStyles.bodyText,
          ),
        ),
        home: HomeView(),
      ),
    );
  }
}
