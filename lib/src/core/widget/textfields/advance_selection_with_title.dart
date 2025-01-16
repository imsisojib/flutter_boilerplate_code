import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_boilerplate_code/src/config/custom_typedefs.dart';
import 'package:flutter_boilerplate_code/src/resources/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdvanceSelectionWithTitle extends StatefulWidget {
  final String? initialValue;
  final String? hintText;
  final String? labelText;
  final String? titleText;
  final TextStyle? tittleTextStyle;
  final Widget? title;
  final String? additionalTittleText;
  final bool isMandatoryField;
  final int? maxLength;
  final int? maxLines;
  final Widget? prefixIcon;
  final bool enabled;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final Color? backgroundColor;
  final FocusNode? focusNode;
  final Widget? suffixIcon;
  final Widget? suffix;
  final Function? onStartSelect;
  final OnValidator? validator;
  final CrossAxisAlignment? titleAlignment;

  const AdvanceSelectionWithTitle({
    super.key,
    this.hintText,
    this.prefixIcon,
    this.enabled = false,
    this.obscureText = false,
    this.keyboardType,
    this.controller,
    this.onStartSelect,
    this.initialValue,
    this.backgroundColor,
    this.maxLength,
    this.maxLines = 1,
    this.titleText,
    this.tittleTextStyle,
    this.title,
    this.additionalTittleText,
    this.isMandatoryField = false,
    this.textInputAction,
    this.labelText,
    this.focusNode,
    this.suffixIcon,
    this.suffix,
    this.validator,
    this.titleAlignment,
  }): assert(!(title!=null && titleText!=null)); //title and titleText both shouldn't be used at a time

  @override
  State<AdvanceSelectionWithTitle> createState() => _AdvanceSelectionWithTitleState();
}

class _AdvanceSelectionWithTitleState extends State<AdvanceSelectionWithTitle> {

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: widget.titleAlignment??CrossAxisAlignment.start,
      children: [
        if(widget.titleText!=null || widget.title!=null) Column(
          children: [
            widget.title??Text(
              widget.titleText!,
              style: widget.tittleTextStyle?? theme.textTheme.labelMedium?.copyWith(
                color: AppColors.secondaryTextColorDark,
              ),
            ),
            SizedBox(height: 6.h,),
          ],
        ),
        InkWell(
          onTap: (){
            widget.onStartSelect?.call();
          },
          child: TextFormField(
            key: widget.key,
            initialValue: widget.initialValue,
            controller: widget.controller,
            focusNode: widget.focusNode,
            cursorColor: AppColors.primaryColorLight,
            style: theme.textTheme.bodyMedium,
            obscureText: widget.obscureText,
            keyboardType: widget.keyboardType,
            textInputAction: widget.textInputAction,
            maxLength: widget.maxLength,
            maxLines: widget.maxLines,
            validator: widget.validator,
            decoration: InputDecoration(
              fillColor: const Color(0xff262D40),
              filled: true,
              contentPadding: EdgeInsets.fromLTRB(16.w, 12.h, 10.w, 12.h),
              prefixIcon: widget.prefixIcon,
              suffixIcon: widget.suffixIcon,
              suffix: widget.suffix,
              errorStyle: theme.textTheme.labelMedium?.copyWith(
                color: AppColors.red,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                // borderSide: BorderSide(
                //   color: AppColors.blue.withOpacity(.1),
                // ),
                borderSide: BorderSide.none,
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide(
                  color: AppColors.primaryColorLight.withOpacity(.2),
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(
                    color: Color(0xffF7CAD0)
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide(
                  color: AppColors.primaryColorLight.withOpacity(.2),
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              hintText: widget.hintText,
              labelText: widget.labelText,
              hintStyle: theme.textTheme.labelLarge?.copyWith(
                color: AppColors.secondaryTextColorDark,
              ),
              enabled: widget.enabled,
              counterText: "",
            ),
          ),
        ),
      ],
    );

  }
}
