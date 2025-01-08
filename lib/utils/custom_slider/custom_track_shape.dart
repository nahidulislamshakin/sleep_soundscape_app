import 'package:flutter/material.dart';

class CustomTrackShape extends RoundedRectSliderTrackShape {
  @override
  void paint(
      PaintingContext context,
      Offset offset, {
        required RenderBox parentBox,
        required SliderThemeData sliderTheme,
        required Animation<double> enableAnimation,
        required TextDirection textDirection,
        required Offset thumbCenter,
        Offset? secondaryOffset,
        bool isDiscrete = false,
        bool isEnabled = false,
        double additionalActiveTrackHeight = 1,
      }) {
    // Retrieve the canvas to draw on
    final Canvas canvas = context.canvas;

    // Set track height
    final double trackHeight = sliderTheme.trackHeight ?? 2.0;
    final double trackRadius = trackHeight / 2;

    // Calculate the bounds of the track
    final Rect trackRect = Rect.fromLTWH(
      offset.dx,
      offset.dy + (parentBox.size.height - trackHeight) / 2,
      parentBox.size.width,
      trackHeight + additionalActiveTrackHeight,
    );

    // Paint for the active segment (before the thumb)
    final Paint activePaint = Paint()
      ..color = sliderTheme.activeTrackColor ?? Colors.blue
      ..style = PaintingStyle.fill;

    // Paint for the inactive segment (after the thumb)
    final Paint inactivePaint = Paint()
      ..color = sliderTheme.inactiveTrackColor ?? Colors.grey
      ..style = PaintingStyle.fill;

    // Active track bounds
    final double activeTrackWidth = thumbCenter.dx - trackRect.left;

    // Draw active segment
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          trackRect.left,
          trackRect.top,
          activeTrackWidth,
          trackRect.height,
        ),
        Radius.circular(trackRadius),
      ),
      activePaint,
    );

    // Draw inactive segment
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(
          trackRect.left + activeTrackWidth,
          trackRect.top,
          trackRect.width - activeTrackWidth,
          trackRect.height,
        ),
        Radius.circular(trackRadius),
      ),
      inactivePaint,
    );

    // Optionally, handle secondaryOffset for a dual-thumb slider
    if (secondaryOffset != null) {
      final Paint secondaryPaint = Paint()
        ..color = sliderTheme.secondaryActiveTrackColor ?? Colors.green
        ..style = PaintingStyle.fill;

      // Draw secondary active segment
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(
            trackRect.left,
            trackRect.top,
            secondaryOffset.dx - trackRect.left,
            trackRect.height,
          ),
          Radius.circular(trackRadius),
        ),
        secondaryPaint,
      );
    }
  }
}
