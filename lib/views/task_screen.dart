import 'package:flutter/material.dart';
import 'package:todo_task/views/add_task_view.dart';
import 'package:todo_task/views/header_view.dart';
import 'package:todo_task/views/task_info_view.dart';
import 'package:todo_task/views/task_list_view.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: HeaderView(),
            ),
            Expanded(
              flex: 1,
              child: TaskInfoView()
            ),
            Expanded(
              flex: 7,
              child: TaskListView()
            ),
          ],
        ),
      ),
      floatingActionButton: AddTaskView(),
    );
  }
}
