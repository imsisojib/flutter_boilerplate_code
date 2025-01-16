import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_code/src/config/custom_typedefs.dart';
import 'package:flutter_boilerplate_code/src/resources/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdvanceTextFormSelection extends StatefulWidget {
  final String? hintText;
  final String? labelText;
  final String? titleText;
  final TextStyle? tittleTextStyle;
  final String? additionalTittleText;
  final bool isMandatoryField;
  final int? maxLength;
  final int? maxLines;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool enabled;
  final bool obscureText;
  final Function? onChanged;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final String? initialValue;
  final Color? backgroundColor;
  final Function? onSelect;
  final OnValidator? validator;
  final AutovalidateMode? autovalidateMode;

  const AdvanceTextFormSelection({
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
    this.onSelect,
    this.autovalidateMode,
    this.suffixIcon,
  });

  @override
  State<AdvanceTextFormSelection> createState() => _AdvanceTextFormSelectionState();
}

class _AdvanceTextFormSelectionState extends State<AdvanceTextFormSelection> {
  bool isFocused = false;
  TextEditingController? _controller;

  @override
  void initState() {
    if(widget.controller!=null){
      _controller = widget.controller;
    }else{
      _controller = TextEditingController();
    }
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    //for dark and light theme

    //to update value only if there is initialValue
    if(widget.controller==null && widget.initialValue!=null){
      _controller?.text = widget.initialValue!;
    }

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
        InkWell(
          onTap: (){
            widget.onSelect?.call();
          },
          child: TextFormField(
            enabled: false,
            //initialValue: widget.initialValue,
            controller: _controller,
            onChanged: (value) {
              widget.onChanged?.call(value);
            },
            onTap: (){
              setState(() {
                isFocused = true;
              });
            },
            onTapOutside: (event){
              FocusScope.of(context).requestFocus(FocusNode());
            },
            onFieldSubmitted: (value){
              setState(() {
                isFocused = value.isEmpty?false : true;
              });
            },
            cursorColor: AppColors.red,
            style: theme.textTheme.bodyMedium,
            obscureText: widget.obscureText,
            keyboardType: widget.keyboardType,
            textInputAction: widget.textInputAction,
            maxLength: widget.maxLength,
            maxLines: widget.maxLines,
            validator: widget.validator,
            autovalidateMode: widget.autovalidateMode,
            decoration: InputDecoration(
              fillColor: const Color(0xff262D40),
              filled: true,
              contentPadding: EdgeInsets.fromLTRB(16.w, 12.h, 10.w, 12.h),
              //prefixIcon: prefixIcon,
              prefixIcon: widget.prefixIcon,
              // prefixIconConstraints: BoxConstraints(
              //   maxHeight: 16.h,
              // ),
              suffixIcon: widget.suffixIcon,
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
            ),
          ),
        ),
      ],
    );
  }
}
