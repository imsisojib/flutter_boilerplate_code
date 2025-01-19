import 'package:flutter/material.dart';
import 'dart:math' as math;

extension PointX on math.Point<double> {
  /// Rotates a [vector] by [angle] radians around the origin.
  ///
  /// See also:
  ///  * [Mathemical proof](https://matthew-brett.github.io/teaching/rotation_2d.html), for a detailed explanation
  math.Point<double> rotate(double angle) {
    return math.Point(
      math.cos(angle) * x - math.sin(angle) * y,
      math.sin(angle) * x + math.cos(angle) * y,
    );
  }
}

enum SliceSlot {
  slice,
  child,
}

class CircleSliceLayoutDelegate extends MultiChildLayoutDelegate {
  final double angle;

  CircleSliceLayoutDelegate(this.angle);

  @override
  void performLayout(Size size) {
    //late Size sliceSize;
    //Size childSize;

    if (hasChild(SliceSlot.slice)) {
      layoutChild(
        SliceSlot.slice,
        BoxConstraints.tight(size),
      );
      positionChild(SliceSlot.slice, Offset.zero);
    }

    if (hasChild(SliceSlot.child)) {
      layoutChild(
        SliceSlot.child,
        BoxConstraints.tight(size),
      );

      positionChild(
        SliceSlot.child,
        const Offset(
          -6,
          -6,
        ),
      );
    }
  }

  @override
  bool shouldRelayout(CircleSliceLayoutDelegate oldDelegate) {
    return angle != oldDelegate.angle;
  }
}
