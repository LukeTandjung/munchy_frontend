import 'package:flutter/material.dart';
import 'package:munchy_mvp/constants.dart';
import 'package:sizer/sizer.dart';
import 'package:munchy_mvp/widgets/MunchyTextField.dart';

class MunchyOnboardTextField extends StatelessWidget {

  final String hintText;
  final String buttonText;
  final void Function(String) onChanged;
  final Widget optionalButton;
  final void Function()? onPressed;
  final BorderSide side;

  const MunchyOnboardTextField({
    Key? key,
    required this.hintText,
    required this.buttonText,
    required this.onChanged,
    required this.optionalButton,
    required this.onPressed,
    required this.side
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                buttonText,
                style: kRegularTextStyle.copyWith(
                  fontSize: 20
                ),
              ),
              MunchyTextField(
                obscureText: false,
                onChanged: onChanged,
                optionalButton: optionalButton,
                hintText: hintText,
              ),
            ],
          ),
          onPressed: onPressed,
          style: TextButton.styleFrom(
            backgroundColor: Color(0x21F5A61D),
            minimumSize: Size(71.7.w, 6.0.h),
            fixedSize: Size(71.7.w, 5.5.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
              side: side,
            ),
          ),
        ),
      ],
    );
  }
}