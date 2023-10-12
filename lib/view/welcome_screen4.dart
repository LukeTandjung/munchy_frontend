import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:munchy_mvp/constants.dart';
import 'package:munchy_mvp/view/welcome_screen5.dart';
import 'package:provider/provider.dart';
import 'package:munchy_mvp/controller/User controller.dart';


class WelcomeScreenSeqFour extends StatefulWidget {
  const WelcomeScreenSeqFour({Key? key}) : super(key: key);

  static const String id = 'welcome_screen4';

  @override
  _WelcomeScreenSeqFourState createState() => _WelcomeScreenSeqFourState();
}

class _WelcomeScreenSeqFourState extends State<WelcomeScreenSeqFour> {

  int weight = 69;
  int height = 175;
  int percentFat = 19;
  bool nextPage1 = false;
  bool nextPage2 = false;
  bool nextPage3 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 9.8.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              'Weight',
              style: kMediumTextStyle.copyWith(
                fontSize: 25.sp,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              '$weight kg',
              style: kRegularTextStyle.copyWith(
                fontSize: 20.sp,
              ),
              textAlign: TextAlign.center,
            ),
            Slider(
              value: weight.toDouble(),
              min: 30,
              max: 150,
              onChanged: (double newValue) {
                setState(() {
                  weight = newValue.round();
                });
              },
              onChangeEnd: (double newValue) {
                setState(() {
                  Provider.of<User>(context, listen: false).changeWeight(newValue.toInt());
                  // nextPage1 = {newValue.toString}.isNotEmpty;
                  // nextPage1 == true && nextPage2 == true && nextPage3 == true? Navigator.pushNamed(context, WelcomeScreenSeqFive.id) : nextPage1 = {newValue.toString}.isNotEmpty;
                });
              },
              activeColor: Color.fromARGB(255, 254, 106, 0),
              inactiveColor: Colors.grey,
            ),
            Text(
              'Height',
              style: kMediumTextStyle.copyWith(
                fontSize: 25.sp,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              '$height cm',
              style: kRegularTextStyle.copyWith(
                fontSize: 20.sp,
              ),
              textAlign: TextAlign.center,
            ),
            Slider(
              value: height.toDouble(),
              min: 100,
              max: 220,
              onChanged: (double newValue) {
                setState(() {
                  height = newValue.round();
                });
              },
              onChangeEnd: (double newValue) {
                setState(() {
                  Provider.of<User>(context, listen: false).changeHeight(newValue.toInt());
                  // nextPage2 = {newValue.toString}.isNotEmpty;
                  // nextPage1 == true && nextPage2 == true && nextPage3 == true? Navigator.pushNamed(context, WelcomeScreenSeqFive.id) : nextPage2 = {newValue.toString}.isNotEmpty;
                });
              },
              activeColor: Color.fromARGB(255, 254, 106, 0),
              inactiveColor: Colors.grey,
            ),
            Text(
              'Fat Percentage',
              style: kMediumTextStyle.copyWith(
                fontSize: 25.sp,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              '$percentFat %',
              style: kRegularTextStyle.copyWith(
                fontSize: 20.sp,
              ),
              textAlign: TextAlign.center,
            ),
            Slider(
              value: percentFat.toDouble(),
              min: 0,
              max: 100,
              onChanged: (double newValue) {
                setState(() {
                  percentFat = newValue.round();
                });
              },
              onChangeEnd: (double newValue) {
                setState(() {
                  Provider.of<User>(context, listen: false).changeFatPercent(newValue.toInt());
                  // nextPage3 = {newValue.toString}.isNotEmpty;
                  // nextPage1 == true && nextPage2 == true && nextPage3 == true? Navigator.pushNamed(context, WelcomeScreenSeqFive.id) : nextPage3 = {newValue.toString}.isNotEmpty;
                });
              },
              activeColor: Color.fromARGB(255, 254, 106, 0),
              inactiveColor: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}

