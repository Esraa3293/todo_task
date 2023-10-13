import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_task/view_models/app_view_model.dart';

class TaskInfoView extends StatelessWidget {
  const TaskInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(
      builder: (context, viewModel, child) {
        return Container(
          decoration: BoxDecoration(
              color: viewModel.onPrimary,
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              Text(
                "${viewModel.numTasks}",
                style: TextStyle(
                    color: viewModel.secondary,
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Total Tasks",
                style: TextStyle(
                    color: viewModel.onSecondary, fontWeight: FontWeight.w600),
              )
            ],
          ),
        );
      },
    );
  }
}
