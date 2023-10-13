import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_task/view_models/app_view_model.dart';
import 'package:todo_task/views/bottom_sheets/add_task_bottom_sheet.dart';

class AddTaskView extends StatelessWidget {
  const AddTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewModel>(builder: (context, viewModel, child) {
      return SizedBox(
        height: 60,
        child: ElevatedButton(
          onPressed: () {
            viewModel.bottomSheetBuilder(const AddTaskBottomSheetView(), context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: viewModel.secondary,
            foregroundColor: viewModel.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
            ),
          ),
          child: const Icon(
            Icons.add,
            size: 30,
          ),
        ),
      );
    });
  }
}
