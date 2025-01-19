import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_code/src/resources/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math' as math;

import 'custom_paint/circle_slice_layout.dart';
import 'custom_paint/slice.dart';

class ClockLoader2 extends StatefulWidget {
  final Color borderColor;
  final Color colorDone;
  final double doneRatio;
  final double size;
  final double borderWidth;

  ///doneRatio should be between 0 to 1

  const ClockLoader2({
    super.key,
    this.borderColor = AppColors.primaryColorLight,
    this.doneRatio = 1.0,
    this.colorDone = AppColors.primaryColorDark,
    this.size = 28,
    this.borderWidth = 2,
  }) : assert(doneRatio>=0 && doneRatio<=1);

  @override
  State<ClockLoader2> createState() => _ClockLoader2State();
}

class _ClockLoader2State extends State<ClockLoader2> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: widget.size.h,
          width: widget.size.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: widget.colorDone,
              width: widget.borderWidth.w,
              strokeAlign: BorderSide.strokeAlignOutside,
            ),
          ),
        ),
        makeSlice(
          radius: (widget.size.h+widget.borderWidth.w) / 2,
          fillColor: widget.colorDone,
          doneRatio: widget.doneRatio,
        ),
      ],
    );
  }

  Widget makeSlice({
    required double radius,
    required Color fillColor,
    required double doneRatio,
  }) {
    return Transform.translate(
      offset: Offset(radius / 2, radius / 2),
      child: Transform.rotate(
        alignment: Alignment.topLeft,
        angle: -math.pi / 2,
        child: CircleSliceLayout(
          slice: CircleSlice(
            radius: radius,
            angle: (2 * math.pi) * doneRatio,
            fillColor: fillColor,
            strokeColor: Colors.transparent,
            strokeWidth: 0,
          ),
          child: const SizedBox(),
        ),
      ),
    );
  }
}
