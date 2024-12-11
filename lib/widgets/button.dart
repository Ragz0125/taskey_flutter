import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  Button({required this.onTap, required this.buttonTitle,super.key});

  Function() onTap;
  final String buttonTitle;

  @override
  Widget build(context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 220,
        height: 50,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            buttonTitle,
            style: const TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
