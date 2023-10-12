import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

var kTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 0.97.w, horizontal: 3.39.h),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(20.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide:
    BorderSide(color: Color(0xFF989898), width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(20.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide:
    BorderSide(color: Colors.black54, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(20.0))
  ),
  fillColor: Colors.white
);

const kMediumTextStyle = TextStyle(
  fontFamily: 'Sans Serif',
  color: Color.fromARGB(255, 103, 97, 79),
  fontSize: 30,
  fontWeight: FontWeight.w500,
);

const kRegularTextStyle = TextStyle(
  fontFamily: 'Sans Serif',
  color: Color.fromARGB(255, 103, 97, 79),
  fontSize: 25,
  fontWeight: FontWeight.w400,
);