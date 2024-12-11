import 'package:flutter/material.dart';
import 'package:task_management/utils/constants.dart';

class ProjectStatus extends StatelessWidget {
  const ProjectStatus({super.key});

  @override
  Widget build(context) {
    return (Scaffold(
      appBar: AppBar(
        title: Text("Project Status",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            )),
        centerTitle: true,
      ),
      body: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            //Status Bar
            children: [
              SizedBox(
                height: 15,
              ),
              Center(
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                      border: Border.all(width: 14, color: Colors.amber),
                      borderRadius: BorderRadius.circular(1000)),
                  child: Center(
                    child: Text(
                      "50%",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: statusOptions
                    .map((e) => _statusSymbol(e["title"], e["color"]))
                    .toList(),
              ),
              SizedBox(
                height: 30,
              ),
              _statusDescriptionTile("Completed"),
              SizedBox(
                height: 15,
              ),
              _statusDescriptionTile("In Progress"),
              SizedBox(
                height: 15,
              ),
              _statusDescriptionTile("To Do"),
            ],
          )),
    ));
  }

  Widget _statusSymbol(title, color) {
    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(100)),
        ),
        SizedBox(
          width: 6,
        ),
        Text(
          title,
          style: TextStyle(fontSize: 13),
        )
      ],
    );
  }

  Widget _statusDescriptionTile(title) {
    return (Container(
      width: double.infinity,
      height: 70,
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromARGB(255, 190, 190, 190)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                  fontSize: 18,
                  color: Color(0xFF002055),
                  fontWeight: FontWeight.bold),
            ),
            const Text(
              "18 Tasks Completed",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            )
          ],
        ),
      ),
    ));
  }
}
