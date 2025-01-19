import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter_boilerplate_code/src/core/presentation/widgets/prgoressbars/custom_paint/slice.dart';


/// Draws a slice of a circle. The slice's arc starts at the right (3 o'clock)
/// and moves clockwise as far as specified by angle.
class CircleSlicePainter extends CustomPainter {
  final Color fillColor;
  final Color? strokeColor;
  final double strokeWidth;
  final double angle;

  const CircleSlicePainter({
    required this.fillColor,
    this.strokeColor,
    this.strokeWidth = 1,
    this.angle = math.pi / 2,
  }) : assert(angle > 0 && angle < 2 * math.pi);

  @override
  void paint(Canvas canvas, Size size) {
    final radius = math.min(size.width, size.height);
    final path = CircleSlice.buildSlicePath(radius, angle);

    // fill slice area
    canvas.drawPath(
      path,
      Paint()
        ..color = fillColor
        ..style = PaintingStyle.fill,
    );

    // draw slice border
    if (strokeWidth > 0) {
      canvas.drawPath(
        path,
        Paint()
          ..color = strokeColor!
          ..strokeWidth = strokeWidth
          ..style = PaintingStyle.stroke,
      );

      canvas.drawPath(
        Path()
          ..arcTo(
              Rect.fromCircle(
                center: const Offset(0, 0),
                radius: radius,
              ),
              0,
              angle,
              false),
        Paint()
          ..color = strokeColor!
          ..strokeWidth = strokeWidth * 2
          ..style = PaintingStyle.stroke,
      );
    }
  }

  @override
  bool shouldRepaint(CircleSlicePainter oldDelegate) {
    return angle != oldDelegate.angle ||
        fillColor != oldDelegate.fillColor ||
        strokeColor != oldDelegate.strokeColor ||
        strokeWidth != oldDelegate.strokeWidth;
  }
}
