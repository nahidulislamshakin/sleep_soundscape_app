import 'package:flutter/material.dart';

class CustomElevatedButton {
  Widget button;
  bool pressed;

  CustomElevatedButton({required this.button, required this.pressed});

  Widget customElevatedButton(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient:  LinearGradient(
            colors: pressed == true ? [Color(0xFF42098F), Color(0xFFB53FFE)] : [Color(0xFF09001F),Color(0xFF09001F),],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )),
      child: button,
    );
  }
}
