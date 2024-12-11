import 'package:flutter/material.dart';
import 'package:task_management/screens/project_status.dart';

class ProjectTile extends StatelessWidget {
  const ProjectTile({required this.projectName, required this.projectDomain, super.key});

  final String projectName;
  final String projectDomain;

  @override
  Widget build(context) {
    return InkWell(
      onTap: () => {
        Navigator.push(
            context, MaterialPageRoute(builder: (ctx) => const ProjectStatus()))
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 15 ),
        child: Container(
          height: 80,
          width: double.infinity,
          decoration: BoxDecoration(
              border: Border.all(color: const Color.fromARGB(255, 190, 190, 190)),
              borderRadius: BorderRadius.circular(15)),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      projectName,
                      style: const TextStyle(
                          fontSize: 15,
                          color: Color(0xFF002055),
                          fontWeight: FontWeight.w600),
                    ),
                    const Text(
                      "10/20",
                      style: TextStyle(
                          color: Color(
                            0xFF002055,
                          ),
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      projectDomain,
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.w500),
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(color: Colors.amber, width: 4)),
                      child: Center(
                          child: Text(
                        "50%",
                        style: TextStyle(
                            color: Color(
                              0xFF002055,
                            ),
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      )),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
