import 'package:flutter/material.dart';

class ProjectCard extends StatefulWidget {
  const ProjectCard({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProjectCard();
  }
}

class _ProjectCard extends State<ProjectCard> {
  List<String> temp = ["1", "2"];
  @override
  Widget build(context) {
    return SizedBox(
      height: 150,
      child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          children: temp
              .map((e) => Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Stack(
                      children: [
                        Container(
                          height: 150,
                          width: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                                colors: [
                                  Color(0xFF756EF3),
                                  Theme.of(context).primaryColor
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(13.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Application Design",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                               const  SizedBox(height: 10,),
                                Text(
                                  "UI Design Kit",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Theme.of(context).primaryColorLight,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Image.asset(
                            "assets/images/cardBg.png",
                            width: 200,
                            height: 200,
                            fit: BoxFit.contain,
                          ),
                        )
                      ],
                    ),
                  ))
              .toList()),
    );
  }
}
