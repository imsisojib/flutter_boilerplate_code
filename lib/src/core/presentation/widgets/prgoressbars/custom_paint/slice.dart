import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_code/src/core/presentation/widgets/prgoressbars/custom_paint/slice_painter.dart';

class CircleSlice extends StatelessWidget {
  static Path buildSlicePath(double radius, double angle) {
    return Path()
      ..moveTo(0, 0)
      ..lineTo(radius, 0)
      ..arcTo(
          Rect.fromCircle(
            center: const Offset(0, 0),
            radius: radius,
          ),
          0,
          angle,
          false)
      ..close();
  }

  final double radius;
  final double angle;
  final Color fillColor;
  final Color strokeColor;
  final double strokeWidth;

  const CircleSlice({
    super.key,
    required this.radius,
    required this.fillColor,
    required this.strokeColor,
    this.strokeWidth = 1,
    required this.angle,
  })  : assert(radius > 0);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: radius,
      height: radius,
      child: CustomPaint(
        painter: CircleSlicePainter(
          angle: angle,
          fillColor: fillColor,
          strokeColor: strokeColor,
          strokeWidth: strokeWidth,
        ),
      ),
    );
  }
}