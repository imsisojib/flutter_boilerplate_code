import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_boilerplate_code/src/config/custom_typedefs.dart';
import 'package:flutter_boilerplate_code/src/resources/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdvanceTextFormFieldWithTitle extends StatefulWidget {
  final String? initialValue;
  final String? hintText;
  final String? labelText;
  final String? titleText;
  final TextStyle? tittleTextStyle;
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
  final OnValidator? validator;
  final OnFieldSubmitted? onFieldSubmitted;
  final OnChanged? onChanged;
  final OnTap? onTap;
  final OnEditComplete? onEditComplete;
  final OnSaved? onSaved;
  final OnTapOutside? onTapOutside;
  final AutovalidateMode? autovalidateMode;
  final Widget? suffixIcon;
  final Widget? suffix;
  final List<TextInputFormatter>? inputFormatters;
  final bool readOnly;
  final InputDecoration? decoration;

  const AdvanceTextFormFieldWithTitle({
    super.key,
    this.hintText,
    this.prefixIcon,
    this.enabled = true,
    this.obscureText = false,
    this.onChanged,
    this.keyboardType,
    this.controller,
    this.validator,
    this.initialValue,
    this.backgroundColor,
    this.maxLength,
    this.maxLines = 1,
    this.titleText,
    this.tittleTextStyle,
    this.additionalTittleText,
    this.isMandatoryField = false,
    this.textInputAction,
    this.labelText,
    this.onFieldSubmitted,
    this.focusNode,
    this.onEditComplete,
    this.onSaved,
    this.autovalidateMode,
    this.suffixIcon,
    this.suffix,
    this.onTapOutside,
    this.inputFormatters,
    this.readOnly = false,
    this.onTap,
    this.decoration,
  });

  @override
  State<AdvanceTextFormFieldWithTitle> createState() => _AdvanceTextFormFieldWithTitleState();
}

class _AdvanceTextFormFieldWithTitleState extends State<AdvanceTextFormFieldWithTitle> {

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(widget.titleText!=null) Column(
          children: [
            Text(
              widget.titleText!,
              style: widget.tittleTextStyle?? theme.textTheme.labelMedium?.copyWith(
                color: AppColors.secondaryTextColorDark,
              ),
            ),
            SizedBox(height: 6.h,),
          ],
        ),
        TextFormField(
          autovalidateMode: widget.autovalidateMode,
          key: widget.key,
          initialValue: widget.initialValue,
          controller: widget.controller,
          focusNode: widget.focusNode,
          inputFormatters: widget.inputFormatters,
          readOnly: widget.readOnly,
          onChanged: (value) {
            widget.onChanged?.call(value);
          },
          onTap: (){
            widget.onTap?.call();
          },
          onTapOutside: (event){
            FocusScope.of(context).requestFocus(FocusNode());
            widget.onTapOutside?.call(event);
          },
          onFieldSubmitted: (value){
            widget.onFieldSubmitted?.call(value);
          },
          onSaved: (value){
            widget.onSaved?.call(value);
          },
          cursorColor: AppColors.primaryColorLight,
          style: theme.textTheme.bodyMedium,
          obscureText: widget.obscureText,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          maxLength: widget.maxLength,
          maxLines: widget.maxLines,
          validator: widget.validator,
          decoration: widget.decoration??InputDecoration(
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
      ],
    );

  }
}
