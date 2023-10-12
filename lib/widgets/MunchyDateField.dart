import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:munchy_mvp/constants.dart';

class MunchyDateField extends StatefulWidget {

  final TextEditingController dateinput;
  final void Function()? onTap;

  const MunchyDateField({Key? key, required this.dateinput, required this.onTap}) : super(key: key);

  @override

  _MunchyDateFieldState createState() => _MunchyDateFieldState();
}

class _MunchyDateFieldState extends State<MunchyDateField> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 35.51.w,
      height: 3.99.h,
      child: TextField(
        controller: widget.dateinput,
        keyboardType: TextInputType.datetime,
        cursorColor: Colors.black,
        textAlign: TextAlign.left,
        onTap: widget.onTap,
        decoration: kTextFieldDecoration.copyWith(
          isDense: true,
          hintText: 'Date',
          contentPadding: EdgeInsets.only(
            left: 1.0.w
          ),
          hintStyle: TextStyle(
            color: Color(0x66000000),
            fontSize: 15
          ),
          suffixIcon: Icon(
            Icons.date_range,
            color: Color(0x66000000),
          ),
          fillColor: Colors.white
        ),
      ),
    );
  }
}
