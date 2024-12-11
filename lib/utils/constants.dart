import 'package:flutter/material.dart';
import 'package:task_management/screens/add_project.dart';

const projectFilterTabs = [
  {"title": "Favourites"},
  {"title": "Recent"},
  {"title": "All"}
];

const modalOptions = {
  {
    "title": "Create Project",
    "icon": Icon(Icons.folder_copy_outlined, color: Color(0xFF002055)),
    "route": AddProject()
  },
  {
    "title": "Create Task",
    "icon": Icon(Icons.file_copy_outlined, color: Color(0xFF002055)),
    "route": null
  }
};

const statusOptions = [
  {
    "title": "To Do",
    "color": Colors.lightBlue,
  },
  {
    "title": "In Progress",
    "color": Colors.amber,
  },
  {
    "title": "Completed",
    "color": Colors.lightGreen,
  }
];

const tabOptions = [
  {"title": "Home", "icon": Icons.home_filled},
  {"title": "Projects", "icon": Icons.folder},
  {"title": "Profile", "icon": Icons.person},
];

const profileSettingOptions = [
  {"title": "My Projects"},
  {"title": "Settings"}
];

const tasksData = [
  {
    "taskName": "Home Page",
    "projectName": "Digital Gold App",
    "lastUpdated": "5 min ago",
    "percentageCompleted": 40
  },
   {
    "taskName": "Black Box Tickets",
    "projectName": "Security Analysis",
    "lastUpdated": "1 week ago",
    "percentageCompleted": 80
  }
];
