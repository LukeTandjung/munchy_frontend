import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:munchy_mvp/controller/User controller.dart';
import 'package:munchy_mvp/widgets/MunchyOnboardScreen.dart';
import 'package:munchy_mvp/view/onboard_Q5.dart';


class OnboardQ4 extends StatefulWidget {

  static const String id = 'onboard_Q4';

  const OnboardQ4({Key? key}) : super(key: key);

  @override
  _OnboardQ4State createState() => _OnboardQ4State();
}

class _OnboardQ4State extends State<OnboardQ4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: MunchyOnboardScreen(
        question: "Q4",
        onPressed: () {
          Navigator.pushNamed(context, OnboardQ5.id);
        },
        progress: 0.4,
        oneoptiononly: true,
        controller: Provider.of<User>(context, listen: false).changeNumMeals,
        bottomTextOption: "Two or less",
      ),
    );
  }
}