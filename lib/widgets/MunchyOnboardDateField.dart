import 'package:flutter/material.dart';
import 'package:munchy_mvp/constants.dart';
import 'package:sizer/sizer.dart';
import 'package:munchy_mvp/widgets/MunchyDateField.dart';

class MunchyOnboardDateField extends StatelessWidget {

  final String buttonText;
  final TextEditingController dateinput;
  final void Function()? onPressed;
  final void Function()? onTap;
  final BorderSide side;

  const MunchyOnboardDateField({
    Key? key,
    required this.buttonText,
    required this.dateinput,
    required this.onPressed,
    required this.onTap,
    required this.side,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: 71.72.w,
          height: 17.h,
          child: TextButton(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  buttonText,
                  textAlign: TextAlign.center,
                  style: kRegularTextStyle.copyWith(
                      fontSize: 20
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 1.15.h,
                    bottom: 1.15.h
                  ),
                  child: MunchyDateField(
                    dateinput: dateinput,
                    onTap: onTap,
                  ),
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
        ),
      ],
    );
  }
}