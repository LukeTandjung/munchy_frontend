import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:munchy_mvp/constants.dart';
import 'package:munchy_mvp/controller/User controller.dart';
import 'package:provider/provider.dart';
import 'package:munchy_mvp/widgets/MunchyInitiativeButton.dart';
import 'package:munchy_mvp/view/onboard_Q1.dart';

class OnboardWelcome extends StatefulWidget {

  const OnboardWelcome({Key? key}) : super(key: key);

  static const String id = 'onboard_welcome';

  @override
  _OnboardWelcomeState createState() => _OnboardWelcomeState();
}

class _OnboardWelcomeState extends State<OnboardWelcome> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 9.8.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text(
                'Welcome to Munchy, ${Provider.of<User>(context).name}.',
                style: kMediumTextStyle.copyWith(
                  fontSize: 40,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 4.32.h,
            ),
            Center(
              child: Text(
                'Before we get started, we want to know more about you.',
                style: kRegularTextStyle.copyWith(
                  fontSize: 25
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 6.59.h,
            ),
            MunchyInitiativeButton(
              buttonText: 'Sure!',
              onPressed: () {
                Navigator.pushNamed(context, OnboardQ1.id);
              },
            )
          ],
        ),
      ),
    );
  }
}

