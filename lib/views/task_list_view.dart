import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_task/view_models/app_view_model.dart';

class TaskListView extends StatelessWidget {
  const TaskListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(builder: (context, viewModel, child) {
      return Container(
        decoration: BoxDecoration(
            color: viewModel.onPrimary,
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(30))),
        child: ListView.separated(
          padding: const EdgeInsets.all(15),
          itemBuilder: (context, index) => Dismissible(
            key: UniqueKey(),
            onDismissed: (direction) {
              viewModel.deleteTask(index);
            },
            background: Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                color: Colors.red.shade300,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Center(child: Icon(Icons.delete, color: Colors.red.shade700,)),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: viewModel.primary,
                borderRadius: BorderRadius.circular(20)
              ),
              child: ListTile(
                title: Text(viewModel.getTaskTitle(index), style: TextStyle(
                  color: viewModel.onSecondary,
                  fontSize: 17,
                  fontWeight: FontWeight.w500
                ),),
                leading: Checkbox(
                  value: viewModel.getTaskValue(index),
                  onChanged: (value) {
                    viewModel.setTaskValue(index, value!);
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: BorderSide(width: 2, color: viewModel.secondary),
                  ),
                  checkColor: viewModel.primary,
                  activeColor: viewModel.secondary,
                ),
              ),
            ),
          ),
          separatorBuilder: (context, index) => const Divider(),
          itemCount: viewModel.numTasks,
        ),
      );
    });
  }
}
