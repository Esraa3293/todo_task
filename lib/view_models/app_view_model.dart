import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:todo_task/models/TodoList.dart';
import 'package:todo_task/models/task_model.dart';
import 'package:todo_task/models/user_model.dart';
import 'package:http/http.dart' as http;

class AppViewModel extends ChangeNotifier {
  List<Task> tasks = [];
  User user = User("Esraa");
  String language = "en";

  Color primary = Colors.blue.shade50;
  Color onPrimary = Colors.blue.shade200;
  Color secondary = Colors.blue.shade800;
  Color onSecondary = Colors.blue.shade900;

  int get numTasks => tasks.length;

  int get numTasksRemaining => tasks.where((task) => !task.complete).length;

  String get username => user.username;

  void addTask(Task newTask) {
    tasks.add(newTask);
    notifyListeners();
  }

  void updateUsername(String newUsername) {
    user.username = newUsername;
    notifyListeners();
  }

  void deleteAllTasks() {
    tasks.clear();
    notifyListeners();
  }

  void deleteCompletedTasks() {
    tasks = tasks.where((task) => !task.complete).toList();
    notifyListeners();
  }

  String getTaskTitle(int taskIndex) {
    return tasks[taskIndex].title;
  }

  void deleteTask(int taskIndex) {
    tasks.removeAt(taskIndex);
  }

  bool getTaskValue(int taskIndex) {
    return tasks[taskIndex].complete;
  }

  void setTaskValue(int taskIndex, bool taskValue) {
    tasks[taskIndex].complete = taskValue;
    notifyListeners();
  }

  void changeLanguage(String lang) {
    language = lang;
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

  Future<TodoList> getTodoList() async{
    Uri URL = Uri.https("jsonplaceholder.typicode.com", "/todos");
    Response response = await http.get(URL);
    var jsonResponse = jsonDecode(response.body);
    TodoList todoList = TodoList.fromJson(jsonResponse);
    return todoList;
  }
}
