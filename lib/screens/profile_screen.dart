import 'package:flutter/material.dart';
import 'package:task_management/screens/start_screen.dart';
import 'package:task_management/widgets/button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
            //Profile Image
            children: [
              const SizedBox(
                height: 20,
              ),
              Center(
                child: ClipOval(
                  child: Image.asset(
                    "assets/images/profile.png",
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              const Text(
                "Alvart Ainstain",
                style: TextStyle(
                    fontSize: 26,
                    color: Color(0xFF002055),
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                "@alvart.ainstain",
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _statusWidget("On Going", Icons.watch_later_outlined, 5),
                  const SizedBox(
                    width: 20,
                  ),
                  _statusWidget("Completed", Icons.check_box, 15)
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              _profileOptions("My Projects"),
              const SizedBox(
                height: 10,
              ),
              _profileOptions("My Tasks"),
              const SizedBox(
                height: 10,
              ),
              _profileOptions("Settings"),
              const SizedBox(
                height: 13,
              ),
              Button(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => StartScreen()));
                  },
                  buttonTitle: "Logout")
            ]),
      ),
    );
  }

  Widget _statusWidget(title, icon, noOfTasks) {
    return (Column(
      children: [
        Icon(icon, color: Color(0xFF002055)),
        Text(
          noOfTasks.toString(),
          style: const TextStyle(
              color: Color(0xFF002055),
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        Text(title,
            style: const TextStyle(
              color: Colors.grey,
            )),
      ],
    ));
  }

  Widget _profileOptions(title) {
    return (Container(
        width: double.infinity,
        height: 55,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Color(0xFF002055)),
                ),
                const Icon(
                  Icons.chevron_right_outlined,
                  color: Color(0xFF002055),
                )
              ]),
        )));
  }
}
