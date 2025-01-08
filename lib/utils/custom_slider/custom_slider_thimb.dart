import 'package:flutter/material.dart';

class CustomSliderThumbCircle extends SliderComponentShape {
  final double thumbRadius;
  final IconData thumbIcon;

  CustomSliderThumbCircle({required this.thumbRadius, required this.thumbIcon});

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
        required RenderBox parentBox,
        required SliderThemeData sliderTheme,
        required Animation<double> activationAnimation,
        required Animation<double> enableAnimation,
        required bool isDiscrete,
        required TextPainter labelPainter,
        required TextDirection textDirection,
        required double textScaleFactor,
        required double value,
        required Size sizeWithOverflow,
  }) {
    final Canvas canvas = context.canvas;

    final paint = Paint()
    ..color = sliderTheme.thumbColor!
    ..style = PaintingStyle.fill;

    canvas.drawCircle(center, thumbRadius, paint);

    final iconPainter = TextPainter(
      text:  TextSpan(
        text: String.fromCharCode(thumbIcon.codePoint),
        style: TextStyle(
          fontSize: thumbRadius,
          fontFamily: thumbIcon.fontFamily,
          package: thumbIcon.fontPackage,
          color: Colors.white,
        ),
      ),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    iconPainter.layout();
    iconPainter.paint(
      canvas,
      center - Offset(iconPainter.width / 2, iconPainter.height / 2),
    );


  }


}
