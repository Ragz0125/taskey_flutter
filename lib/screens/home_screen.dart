import 'package:flutter/material.dart';
import 'package:task_management/widgets/inprogress_widget.dart';
import 'package:task_management/widgets/project_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeScreen();
  }
}

class _HomeScreen extends State<HomeScreen> {
  @override
  Widget build(context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(12),
        child: Column(
          children: [
            Text(
              "Let's make habits together",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const ProjectCard(),
            const SizedBox(
              height: 15,
            ),
            InProgressWidget()
          ],
        ),
      ),
    );
  }
}
