import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:task_management/screens/home_screen.dart';
import 'package:task_management/screens/profile_screen.dart';
import 'package:task_management/screens/project_screen.dart';
import 'package:task_management/utils/constants.dart';
import 'package:task_management/widgets/inprogress_widget.dart';
import 'package:task_management/widgets/project_card.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TabScreen();
  }
}

class _TabScreen extends State<TabScreen> {
  Widget _currentPage = HomeScreen();
  int _selectedIndex = 0;
  String pageTitle = "Friday, 26";

  void _onTabClick(String title, int index) {
    setState(() {
      switch (title) {
        case "Home":
          _currentPage = HomeScreen();
          pageTitle = "Friday, 26";
          _selectedIndex = index;
        case "Projects":
          _currentPage = ProjectScreen();
          pageTitle = "Projects";
          _selectedIndex = index;
          case "Profile":
          _currentPage = ProfileScreen();
          pageTitle = "Projects";
          _selectedIndex = index;
      }
    });
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          pageTitle,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: const Icon(
          Icons.menu,
          color: Color(0xFF002055),
        ),
        actions: const [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(
              Icons.notifications,
              color: Color(0xFF002055),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          _currentPage,
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(40),
                boxShadow: const [
                  BoxShadow(
                      color: Color.fromARGB(153, 94, 94, 94),
                      blurRadius: 5,
                      spreadRadius: 5),
                ],
              ),
              margin: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
              height: 70,
              width: double.infinity,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: tabOptions
                      .asMap()
                      .entries
                      .map((e) =>
                          _tabItem(e.value["icon"], e.value["title"], e.key))
                      .toList()),
            ),
          ),
        ],
      ),
    );
  }

  Widget _tabItem(icon, title, index) {
    return InkWell(
      onTap: () => _onTabClick(title, index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: _selectedIndex == index
                ? Theme.of(context).primaryColorLight
                : Colors.white,
          ),
          Text(
            title,
            style: TextStyle(
                color: _selectedIndex == index
                    ? Theme.of(context).primaryColorLight
                    : Colors.white),
          )
        ],
      ),
    );
  }
}
