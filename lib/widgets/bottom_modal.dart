import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management/utils/constants.dart';

class BottomModal extends StatelessWidget {
  const BottomModal({super.key});

  @override
  Widget build(context) {
    return Container(
      height: 200,
      width: double.infinity,
      child: Padding(
        padding:
            const EdgeInsets.only(top: 30, left: 15, right: 25, bottom: 20),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: modalOptions
                .map((e) =>
                    _optionTile(e["title"], e["icon"], e["route"], context))
                .toList(),
          ),
        ),
      ),
    );
  }

  Widget _optionTile(title, icon, route, context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => route),
      ),
      child: Container(
        width: double.infinity,
        height: 55,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(children: [
            icon,
            const SizedBox(
              width: 20,
            ),
            Text(
              title,
              style:const  TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF002055),
                  fontSize: 16),
            )
          ]),
        ),
      ),
    );
  }
}
