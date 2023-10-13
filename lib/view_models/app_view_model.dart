import 'package:flutter/material.dart';
import 'package:todo_task/models/task_model.dart';
import 'package:todo_task/models/user_model.dart';

class AppViewModel extends ChangeNotifier {
  List<Task> tasks = [];
  User user = User("Esraa");

  Color primary = Colors.grey.shade50;
  Color onPrimary = Colors.grey.shade200;
  Color secondary = Colors.grey.shade800;
  Color onSecondary = Colors.grey.shade900;

  int get numTasks => tasks.length;

  void addTask(Task newTask) {
    tasks.add(newTask);
    notifyListeners();
  }

  String getTaskTitle(int taskIndex) {
    return tasks[taskIndex].title;
  }

  void deleteTask(int taskIndex){
    tasks.removeAt(taskIndex);
  }

  bool getTaskValue(int taskIndex) {
    return tasks[taskIndex].complete;
  }

  void setTaskValue(int taskIndex, bool taskValue) {
    tasks[taskIndex].complete = taskValue;
    notifyListeners();
  }

  void bottomSheetBuilder(Widget bottomSheetView, BuildContext context) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      context: context,
      builder: (context) {
        return bottomSheetView;
      },
    );
  }
}