import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management/screens/tab_screen.dart';
import 'package:task_management/widgets/button.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(context) {
    return (Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/bg.png",
            height: MediaQuery.of(context).size.height * 0.6,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                height: MediaQuery.of(context).size.height * 0.5,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(25),
                      topLeft: Radius.circular(25),
                    ),
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ShaderMask(
                            shaderCallback: (bounds) => LinearGradient(
                                  colors: [
                                    Colors.blue,
                                    Theme.of(context).primaryColor
                                  ], // Gradient colors
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ).createShader(bounds),
                            child: Text(
                              'Taskey',
                              style: TextStyle(
                                fontSize: 46,
                                fontWeight: FontWeight.bold,
                                color: Colors
                                    .white, // Must set a color for ShaderMask to work
                              ),
                            )),
                        Text(
                          "Building Better Work",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w600),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "Create a unique emotion story that describes better than words",
                          style: TextStyle(fontSize: 15, color: Colors.grey),textAlign: TextAlign.center,
                        ),
                        Button(
                            onTap: () {
                              Get.to(TabScreen(),
                                  transition: Transition.rightToLeft,
                                  duration: Duration(milliseconds: 750));
                            },
                            buttonTitle: "Get Started")
                      ],
                    ),
                  ),
                )),
          )
        ],
      ),
    ));
  }
}
