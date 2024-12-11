import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:task_management/widgets/button.dart';

var format = DateFormat.yMd();

class AddProject extends StatefulWidget {
  const AddProject({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AddProject();
  }
}

class _AddProject extends State<AddProject> {
  final projectNameController = TextEditingController();
  final projectDomainController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final dataBaseUrl =
      "https://taskmanagement-d05cc-default-rtdb.asia-southeast1.firebasedatabase.app/projects.json";

  String _projectName = "";
  DateTime? _startDate;
  DateTime? _endDate;
  String _projectDomain = "";
  String _projectStatus = "";

  @override
  void dispose() {
    projectDomainController.dispose();
    projectDomainController.dispose();

    super.dispose();
  }

  void _showStartDatePickerModal() async {
    var now = DateTime.now();
    var firstDate = DateTime(now.year - 1, now.month, now.day - 1);
    var lastDate = DateTime(now.year + 1, now.month, now.day);
    var selectedDate = await showDatePicker(
        context: context, firstDate: firstDate, lastDate: lastDate);
    setState(() {
      _startDate = selectedDate;
    });
  }

  void _showEndDatePickerModal() async {
    var now = DateTime.now();
    var firstDate = DateTime(now.year - 1, now.month, now.day - 1);
    var lastDate = DateTime(now.year + 1, now.month, now.day);
    var selectedDate = await showDatePicker(
        context: context, firstDate: firstDate, lastDate: lastDate);
    setState(() {
      _endDate = selectedDate;
    });
  }

  Future<void> _onAddProject() async {
    Navigator.pop(context);
    try {
      final response = await http.post(
        Uri.parse(dataBaseUrl),
        body: json.encode({
          'projectName': _projectName,
          'projectDomain': _projectDomain,
          'startDate': format.format(_startDate!),
          'endDate': format.format(_endDate!)
        }),
      );

      if (response.statusCode == 200) {
        print('Data sent successfully: ${response.body}');
      } else {
        print('Failed to send data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Project"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Container(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    label: const Text("Project Name"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 219, 219, 219),
                      ),
                    ),
                  ),
                  onChanged: (value) => setState(() {
                    _projectName = value;
                  }),
                  controller: projectNameController,
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    label: const Text("Project Domain"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 219, 219, 219),
                      ),
                    ),
                  ),
                  onChanged: (value) => setState(() {
                    _projectDomain = value;
                  }),
                  controller: projectDomainController,
                ),
               const  SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: _showStartDatePickerModal,
                        child: Container(
                          height: 50,
                          width: double.infinity / 2,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 2,
                              color: Color.fromARGB(255, 219, 219, 219),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(_startDate == null
                                ? "DD/MM/YYY"
                                : format.format(_startDate!)),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: _showEndDatePickerModal,
                        child: Container(
                            height: 50,
                            width: double.infinity / 2,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 2,
                                color: Color.fromARGB(255, 219, 219, 219),
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(_endDate == null
                                  ? "DD/MM/YYY"
                                  : format.format(_endDate!)),
                            )),
                      ),
                    ),
                  ],
                ),
               const  SizedBox(
                  height: 30,
                ),
                Button(onTap: _onAddProject, buttonTitle: "Add")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
