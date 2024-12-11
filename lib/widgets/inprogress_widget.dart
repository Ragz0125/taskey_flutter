import 'package:flutter/material.dart';
import 'package:task_management/utils/constants.dart';

class InProgressWidget extends StatelessWidget {
  InProgressWidget({super.key});

  List<String> items = [
    'Apple',
    'Banana',
    'Cherry',
    'Date',
    'Elderberry',
    "2",
    "5"
  ];

  @override
  Widget build(context) {
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "In Progress",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Color(0xFF002055),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_outlined,
              color: Color(0xFF002055),
            ),
          ],
        ),
        ListView(
          shrinkWrap: true,
          children: tasksData
              .map((e) => _inProgressTile(
                    e['taskName'],
                    e['projectName'],
                    e['lastUpdated'],
                    e['percentageCompleted'],
                  ))
              .toList(),
        ),
        const SizedBox(
          height: 100,
        )
      ],
    );
  }

  Widget _inProgressTile(taskName, projectName, lastUpdated, percentage) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        height: 80,
        width: double.infinity,
        decoration: BoxDecoration(
            border: Border.all(
              color: const Color.fromARGB(255, 189, 189, 189),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(20)),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    projectName,
                    style: const TextStyle(color: Colors.grey),
                  ),
                  Text(taskName,
                      style: const TextStyle(
                          color: Color(0xFF002055),
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                  Text(lastUpdated, style: TextStyle(color: Colors.grey))
                ],
              ),
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: percentage <= 50
                            ? Colors.redAccent
                            : percentage >= 85
                                ? Colors.lightGreen
                                : Colors.amber,
                        width: 5),
                    borderRadius: BorderRadius.circular(100)),
                child: Center(
                  child: Text(
                    "${percentage.toString()}%",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
