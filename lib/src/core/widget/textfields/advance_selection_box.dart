import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_boilerplate_code/src/resources/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdvanceSelectionBox extends StatefulWidget {
  final String? initialValue;
  final String? hintText;
  final String? labelText;
  final String? titleText;
  final TextStyle? tittleTextStyle;
  final Widget? title;
  final CrossAxisAlignment? titleAlignment;
  final Function? onStartSelect;
  final Widget child;
  final Widget? prefix;
  final EdgeInsetsGeometry? padding;
  final double height;

  const AdvanceSelectionBox({
    super.key,
    this.height = 54,
    this.hintText,
    this.initialValue,
    this.titleText,
    this.tittleTextStyle,
    this.title,
    this.labelText,
    this.titleAlignment,
    this.onStartSelect,
    required this.child,
    this.prefix,
    this.padding,
  }) : assert(!(title != null && titleText != null)); //title and titleText both shouldn't be used at a time

  @override
  State<AdvanceSelectionBox> createState() => _AdvanceSelectionBoxState();
}

class _AdvanceSelectionBoxState extends State<AdvanceSelectionBox> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: widget.titleAlignment ?? CrossAxisAlignment.start,
      children: [
        if (widget.titleText != null || widget.title != null)
          Column(
            children: [
              widget.title ??
                  Text(
                    widget.titleText!,
                    style: widget.tittleTextStyle ??
                        theme.textTheme.labelMedium?.copyWith(
                          color: AppColors.secondaryTextColorDark,
                        ),
                  ),
              SizedBox(
                height: 6.h,
              ),
            ],
          ),
        InkWell(
          onTap: () {
            widget.onStartSelect?.call();
          },
          child: Row(
            children: [
              widget.prefix == null ? const SizedBox() : widget.prefix!,
              Expanded(
                child: Container(
                  height: widget.height.h,
                  width: MediaQuery.of(context).size.width,
                  padding: widget.padding ?? EdgeInsets.symmetric(
                    horizontal: 16.w,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xff262D40),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: widget.child,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
