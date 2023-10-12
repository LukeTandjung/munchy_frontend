import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:munchy_mvp/constants.dart';

class MunchyTextField extends StatefulWidget {

  final String hintText;
  final void Function(String) onChanged;
  final Widget optionalButton;
  final bool obscureText;

  const MunchyTextField({Key? key, required this.hintText, required this.onChanged, required this.optionalButton, required this.obscureText}) : super(key: key);

  @override
  _MunchyTextFieldState createState() => _MunchyTextFieldState();
}

class _MunchyTextFieldState extends State<MunchyTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 5.h,
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        obscureText: widget.obscureText,
        cursorColor: Colors.black,
        textAlign: TextAlign.left,
        onChanged: widget.onChanged,
        decoration: kTextFieldDecoration.copyWith(
          isDense: true,
          hintText: widget.hintText,
          contentPadding: EdgeInsets.symmetric(horizontal: 4.0.w, vertical: 0.97.h),
          hintStyle: TextStyle(
              color: Color(0x66000000),
              fontFamily: 'Sans Serif',
              fontSize: 15,
              fontWeight: FontWeight.w400
          ),
          suffixIcon: widget.optionalButton,
        ),
      ),
    );
  }
}