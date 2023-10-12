import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:munchy_mvp/constants.dart';
import 'package:munchy_mvp/widgets/MunchyTextField.dart';
import 'package:provider/provider.dart';
import 'package:munchy_mvp/controller/User controller.dart';
import 'package:munchy_mvp/widgets/MunchySlideUpButton.dart';
import 'package:munchy_mvp/view/onboard_welcome.dart';

class OnboardName extends StatefulWidget {

  static const String id = 'onboard_name';

  const OnboardName({Key? key}) : super(key: key);

  @override
  _OnboardNameState createState() => _OnboardNameState();
}

class _OnboardNameState extends State<OnboardName> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 5.72.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 9.8.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Text(
                    'Nice to know you!',
                    style: kMediumTextStyle),
                ),
                Center(
                  child: Text(
                    'What is your name?',
                    style: kMediumTextStyle,
                  ),
                ),
                SizedBox(
                  height: 11.12.h,
                ),
                MunchyTextField(
                  hintText: 'My name is...',
                  obscureText: false,
                  onChanged: (value) {
                    Provider.of<User>(context, listen: false).changeName(value);
                  },
                  optionalButton: IconButton(
                    padding: EdgeInsets.symmetric(horizontal: 4.0.w, vertical: 0.97.h),
                    iconSize: 10.sp,
                    icon: Icon(Icons.clear, color: Color(0x66000000)),
                    onPressed: () {
                    },
                  ),
                ),
              ],
            ),
          ),
          MunchySlideUpButton(
            dragAction: (dragUpdateDetails) {
              Navigator.pushNamed(context, OnboardWelcome.id);
            },
          )
        ],
      ),
    );
  }
}
