import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MunchyCheckBox extends StatefulWidget {

  bool initialState;
  final String text;
  void Function(bool?)? onChanged;

  MunchyCheckBox({Key? key, this.initialState = false, required this.text, required this.onChanged}) : super(key: key);

  @override

  _MunchyCheckBoxState createState() => _MunchyCheckBoxState();
}

class _MunchyCheckBoxState extends State<MunchyCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 2.16.h,
          width: 4.67.w,
          child: Checkbox(
            value: widget.initialState,
            activeColor: Color.fromARGB(255, 254, 106, 0),
            onChanged: widget.onChanged,
          ),
        ),
        SizedBox(
          height: 2.16.h,
          width: 3.5.w,
        ),
        Text(
          widget.text,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}