import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MunchyInitiativeButton extends StatelessWidget {

  final String buttonText;
  final void Function()? onPressed;

  const MunchyInitiativeButton({Key? key, required this.buttonText, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        buttonText,
        style: TextStyle(fontSize: 20),
      ),
      onPressed: onPressed,
      style: TextButton.styleFrom(
        primary: Colors.white,
        backgroundColor: Colors.deepOrange,
        fixedSize: Size(64.7.w, 6.48.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
      ),
    );
  }
}