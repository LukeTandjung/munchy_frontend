import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:munchy_mvp/constants.dart';

class MunchyOnboardOptions extends StatelessWidget {

  final String buttonText;
  final void Function()? onPressed;
  final BorderSide side;

  const MunchyOnboardOptions({
    Key? key,
    required this.buttonText,
    required this.onPressed,
    required this.side
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(
          child: Text(
            buttonText,
            style: kRegularTextStyle.copyWith(
              fontSize: 20
            )
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