

import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter_boilerplate_code/src/core/presentation/widgets/prgoressbars/custom_paint/slice.dart';


class CircleSliceClipper extends CustomClipper<Path> {
  final double angle;

  const CircleSliceClipper(this.angle);

  @override
  Path getClip(Size size) {
    final diameter = math.min(size.width, size.height);
    return CircleSlice.buildSlicePath(diameter, angle);
  }

  @override
  bool shouldReclip(CircleSliceClipper oldClipper) {
    return angle != oldClipper.angle;
  }
}
