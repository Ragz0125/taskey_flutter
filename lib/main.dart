import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management/screens/add_project.dart';
import 'package:task_management/screens/start_screen.dart';
import 'package:task_management/screens/tab_screen.dart';

void main() {
  runApp(TaskManagement());
}

final theme = ThemeData(
  primaryColor:const  Color(0xFF002055),
  backgroundColor:const  Color(0xFFFFFFFF),
);

class TaskManagement extends StatelessWidget {
  Widget build(BuildContext context) {
    return (const GetMaterialApp(
      // home: AddProject()
      home: StartScreen(),
    ));
  }
}
