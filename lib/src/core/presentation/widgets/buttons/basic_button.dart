import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_code/src/resources/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BasicButton extends StatelessWidget {
  final double? width;
  final double? height;
  final double elevation;
  final Color? backgroundColor;
  final Function? onPressed;
  final Widget? suffix;
  final Widget? prefix;
  final String buttonText;
  final TextStyle? buttonTextStyle;
  final double borderRadius;
  final TextAlign? textAlign;
  final MainAxisAlignment? mainAxisAlignment;

  const BasicButton({
    super.key,
    this.width,
    this.height = 50,
    this.backgroundColor = AppColors.primaryColorDark,
    this.onPressed,
    this.suffix,
    this.prefix,
    required this.buttonText,
    this.buttonTextStyle,
    this.elevation = 1,
    this.borderRadius = 6,
    this.textAlign,
    this.mainAxisAlignment = MainAxisAlignment.spaceAround,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: width,
      child: MaterialButton(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: EdgeInsets.zero,
        height: height!.h,
        color: backgroundColor,
        elevation: elevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius.h),
        ),
        onPressed: () {
          onPressed?.call();
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: mainAxisAlignment!,
          children: [
            prefix ?? const SizedBox(),
            Text(
              buttonText,
              style: buttonTextStyle ??
                  theme.textTheme.titleMedium,
              textAlign: textAlign,
            ),
            suffix ?? const SizedBox(),
          ],
        ),
      ),
    );
  }
}
