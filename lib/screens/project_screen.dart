import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:task_management/utils/constants.dart';
import 'package:task_management/widgets/bottom_modal.dart';
import 'package:task_management/widgets/project_tile.dart';
import 'package:http/http.dart' as http;

class ProjectScreen extends StatefulWidget {
  const ProjectScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProjectScreen();
  }
}

class _ProjectScreen extends State<ProjectScreen> {
  var projects = [];
  String _inputSearch = "";
  int? _selectedFilter = 0;

  void _onFilterChange(int index) {
    setState(() {
      _selectedFilter = index;
    });
  }

  void _onOpenModal() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (ctx) => BottomModal());
  }

  @override
  void initState() {
    super.initState();
    fetchProjectData();
  }

  Future<void> fetchProjectData() async {
    try {
      final response = await http.get(Uri.parse(
          "https://taskmanagement-d05cc-default-rtdb.asia-southeast1.firebasedatabase.app/projects.json"));

      final Map<String, dynamic> data = json.decode(response.body);

      final List<Map<dynamic, dynamic>> fetchedProjects =
          data.entries.map((entry) {
        return {
          "id": entry.key,
          ...entry.value, // Spread operator to merge dynamic fields
        };
      }).toList();

      print(fetchedProjects);

      if (projects != fetchedProjects) {
        setState(() {
          projects = fetchedProjects;
        });
      }
    } catch (e) {}
  }

  @override
  Widget build(context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(12),
          child: Column(
            children: [
              //Search Bar and Icon Row
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search Project",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),

                  //Add Project/Task Modal
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Color(0xFF002055),
                        borderRadius: BorderRadius.circular(100)),
                    child: IconButton(
                        onPressed: _onOpenModal,
                        icon: Icon(
                          Icons.add,
                          color: Color(0xFFFFFFFF),
                        )),
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              //Filter Tabs
              Padding(
                padding: EdgeInsets.only(right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: projectFilterTabs
                      .asMap()
                      .entries
                      .map((e) => ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: e.key == _selectedFilter
                                  ? Color(0xFF002055)
                                  : Colors.white),
                          onPressed: () => _onFilterChange(e.key),
                          child: Text(
                            e.value["title"]!,
                            style: TextStyle(
                                color: e.key == _selectedFilter
                                    ? Colors.white
                                    : Color(0xFF002055)),
                          )))
                      .toList(),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ListView(
                shrinkWrap: true,
                children: [
                  for (var i = 0; i < projects.length; i++) ProjectTile(projectDomain: projects[i]['projectDomain'],projectName: projects[i]['projectName'])
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
