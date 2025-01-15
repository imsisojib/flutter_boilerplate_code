import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_code/src/core/presentation/widgets/keyboard/pin_keyboard_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

typedef OnPress = Function(String);

class PinKeyboard extends StatefulWidget {
  final double itemHeight;
  final double itemWidth;
  final int? length;
  final double maxWidth;
  final void Function(String)? onChange;
  final void Function(String)? onConfirm;
  final VoidCallback? onBiometric;
  final bool enableBiometric;
  final Widget? iconBiometric;
  final Widget? iconBackspace;
  final Color? iconBackspaceColor;
  final Color? iconBiometricColor;
  final Color? textColor;
  final double fontSize;
  final FontWeight fontWeight;
  final PinKeyboardController? controller;
  final Function? onPressedDone;
  final TextEditingController textEditingController;

  const PinKeyboard({
    super.key,
    this.itemHeight = 60,
    this.itemWidth = 72,
    this.length,
    required this.onChange,
    this.onConfirm,
    this.onBiometric,
    this.enableBiometric = false,
    this.iconBiometric,
    this.maxWidth = 350,
    this.iconBackspaceColor,
    this.iconBiometricColor,
    this.textColor,
    this.fontSize = 32,
    this.fontWeight = FontWeight.normal,
    this.iconBackspace,
    this.controller,
    this.onPressedDone,
    required this.textEditingController,
  });

  @override
  _PinKeyboardState createState() => _PinKeyboardState();
}

class _PinKeyboardState extends State<PinKeyboard> {
  //String _pinCode = '';

  @override
  void initState() {
    _restListener();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(
        horizontal: 45.w,
        vertical: 21.h,
      ),
      decoration: const BoxDecoration(
        color: Color(0xffECEFF0),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _NumberWidget(
                widget: widget,
                number: '1',
                onPress: _handleTabNumber,
              ),
              const Spacer(),
              _NumberWidget(
                widget: widget,
                number: '2',
                subText: "ABC",
                onPress: _handleTabNumber,
              ),
              const Spacer(),
              _NumberWidget(
                widget: widget,
                number: '3',
                subText: "DEF",
                onPress: _handleTabNumber,
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _NumberWidget(
                widget: widget,
                number: '4',
                subText: "GHI",
                onPress: _handleTabNumber,
              ),
              const Spacer(),
              _NumberWidget(
                widget: widget,
                number: '5',
                subText: "JKL",
                onPress: _handleTabNumber,
              ),
              const Spacer(),
              _NumberWidget(
                widget: widget,
                number: '6',
                subText: "MNO",
                onPress: _handleTabNumber,
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _NumberWidget(
                widget: widget,
                number: '7',
                subText: "PQRS",
                onPress: _handleTabNumber,
              ),
              const Spacer(),
              _NumberWidget(
                widget: widget,
                number: '8',
                subText: "TUV",
                onPress: _handleTabNumber,
              ),
              const Spacer(),
              _NumberWidget(
                widget: widget,
                number: '9',
                subText: "WXYZ",
                onPress: _handleTabNumber,
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _BackspaceIconWidget(
                widget: widget,
                onPress: _handleTabBackspace,
              ),
              const Spacer(),
              _NumberWidget(
                widget: widget,
                number: '0',
                onPress: _handleTabNumber,
              ),
              const Spacer(),
              _KeyboardActionWidget(
                widget: widget,
                onPress: (){
                  widget.onPressedDone?.call();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _handleTabNumber(String number) {
    String text = widget.textEditingController.text; //added number here.
    if(widget.length!=null && text.length>widget.length!){
      return;
    }

    widget.textEditingController.text = text+number;

    // if (widget.length == null) {
    //   _pinCode += number;
    //   if (widget.onChange != null) {
    //     widget.onChange!(_pinCode);
    //   }
    //   if (_pinCode.length == widget.length) {
    //     if (widget.onConfirm != null) {
    //       widget.onConfirm!(_pinCode);
    //     }
    //     if (widget.controller == null) {
    //       _pinCode = '';
    //     }
    //   }
    // } else {
    //   if (_pinCode.length < widget.length!) {
    //     _pinCode += number;
    //     if (widget.onChange != null) {
    //       widget.onChange!(_pinCode);
    //     }
    //     if (_pinCode.length == widget.length) {
    //       if (widget.onConfirm != null) {
    //         widget.onConfirm!(_pinCode);
    //       }
    //       if (widget.controller == null) {
    //         _pinCode = '';
    //       }
    //     }
    //   }
    // }
  }

  void _handleTabBiometric() {
    if (widget.onBiometric != null) {
      widget.onBiometric!();
    }
  }

  void _handleTabBackspace() {

    String text = widget.textEditingController.text;
    if(text.isEmpty) return;
    widget.textEditingController.text = text.substring(0, text.length-1);

    // print("----backspace clicked: ");
    // if (_pinCode.isNotEmpty) {
    //   _pinCode = _pinCode.substring(0, _pinCode.length - 1);
    //   if (widget.onChange != null) {
    //     widget.onChange!(_pinCode);
    //   }
    // }
  }

  void _restListener() {
    widget.textEditingController.clear();
    // widget.controller?.addResetListener(() {
    //   _pinCode = '';
    //   if (widget.onChange != null) {
    //     widget.onChange!('');
    //   }
    // });
  }
}

class _BackspaceIconWidget extends StatelessWidget {
  final PinKeyboard widget;
  final VoidCallback onPress;

  const _BackspaceIconWidget({
    required this.widget,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) => _ImageWidget(
        widget: widget,
        icon: widget.iconBackspace ??
            Icon(
              Icons.backspace,
              color: const Color(0xff8B969A),
              size: 24.h,
            ),
        onPress: onPress,
      );
}

class _BiometricIconWidget extends StatelessWidget {
  final PinKeyboard widget;
  final VoidCallback onPress;

  const _BiometricIconWidget({
    required this.widget,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    if (widget.enableBiometric) {
      return _ImageWidget(
        widget: widget,
        icon: widget.iconBiometric ??
            Icon(
              Icons.fingerprint,
              color: const Color(0xff3fc4b0),
              size: 24.h,
            ),
        onPress: onPress,
      );
    } else {
      return SizedBox(
        height: widget.itemHeight.h,
        width: widget.itemWidth.w,
      );
    }
  }
}

class _KeyboardActionWidget extends StatelessWidget {
  final PinKeyboard widget;
  final VoidCallback onPress;

  const _KeyboardActionWidget({
    required this.widget,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: (){
        onPress.call();
      },
      style: const ButtonStyle(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      constraints: BoxConstraints(
        maxHeight: widget.itemHeight.h,
        maxWidth: widget.itemWidth.w,
      ),
      icon: SizedBox(
        height: widget.itemHeight.h,
        width: widget.itemWidth.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 18.h,
              backgroundColor: const Color(0xff009CDE),
              child: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ImageWidget extends StatelessWidget {
  const _ImageWidget({
    required this.widget,
    required this.icon,
    required this.onPress,
  });

  final PinKeyboard widget;
  final Widget icon;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) => IconButton(
        // customBorder: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(16),
        // ),
        style: const ButtonStyle(
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        constraints: BoxConstraints(
          maxHeight: widget.itemHeight.h,
          maxWidth: widget.itemWidth.w,
        ),
        icon: SizedBox(
          height: widget.itemHeight.h,
          width: widget.itemWidth.h,
          child: Center(child: icon),
        ),
        onPressed: () {
          onPress();
        },
      );
}

class _NumberWidget extends StatelessWidget {
  _NumberWidget({
    required this.widget,
    required this.number,
    required this.onPress,
    this.subText,
  });

  PinKeyboard widget;
  String number;
  String? subText;
  OnPress onPress;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return IconButton(
      // customBorder: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.circular(16),
      // ),
      style: const ButtonStyle(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      constraints: BoxConstraints(
        maxHeight: widget.itemHeight.h,
        maxWidth: widget.itemWidth.w,
      ),
      onPressed: () {
        onPress(number);
      },
      icon: SizedBox(
        height: widget.itemHeight.h,
        width: widget.itemWidth.w,
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                number,
                style: GoogleFonts.roboto().copyWith(
                  color: const Color(0xff384951),
                  fontSize: widget.fontSize.sp,
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    subText ?? "",
                    style: GoogleFonts.roboto().copyWith(
                      color: const Color(0xff69747A),
                      fontWeight: FontWeight.bold,
                      fontSize: 10.sp,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      // onTap: () {
      //   onPress(number);
      // },
    );
  }
}
