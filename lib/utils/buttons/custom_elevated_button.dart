import 'package:flutter/material.dart';

class CustomElevatedButton {
  Widget button;
  bool pressed;

  CustomElevatedButton({required this.button, required this.pressed});

  Widget customElevatedButton(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: pressed == false ? Colors.grey.withOpacity(0.2) : Colors.transparent,
          ),
          gradient:  LinearGradient(
            colors: pressed == true ? [const Color(0xFF42098F), const Color(0xFFB53FFE)] : [const Color(0xFF09001F),const Color(0xFF09001F),],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),),
      child: button,
    );
  }
}
