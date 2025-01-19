import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomProgressBar extends StatelessWidget{
  final double level;
  final EdgeInsetsGeometry? margin;
  final Color progressColor;
  const CustomProgressBar({super.key, this.level=.1, this.margin, required this.progressColor,});

  ///TOTAL VALUE = 1.0

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: margin,
        height: 6.h,
        padding: EdgeInsets.zero,
        decoration: const BoxDecoration(
          //border: Border.all(color: theme.colorScheme.primary,),
          color: Colors.white,
          borderRadius: BorderRadius.horizontal(left: Radius.circular(60),right: Radius.circular(60)),
        ),
        child: LayoutBuilder(
          builder: (_,BoxConstraints boxConstraints){
            return Align(
              alignment: Alignment.centerLeft,
              child: Container(
                height: 6.h,
                width: boxConstraints.maxWidth*level<40?40:boxConstraints.maxWidth*level,
                decoration: BoxDecoration(
                  color: progressColor,
                  borderRadius: const BorderRadius.horizontal(left: Radius.circular(60),right: Radius.circular(60)),
                ),
              ),
            );
          },
        )
    );
  }
}