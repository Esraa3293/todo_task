import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_task/view_models/app_view_model.dart';
import 'package:todo_task/views/task_screen.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => AppViewModel(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TaskScreen(),
    );
  }
}
