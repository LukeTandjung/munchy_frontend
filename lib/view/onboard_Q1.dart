import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:munchy_mvp/controller/User controller.dart';
import 'package:munchy_mvp/widgets/MunchyOnboardScreen.dart';
import 'package:munchy_mvp/view/onboard_Q3.dart';


class OnboardQ1 extends StatefulWidget {

  static const String id = 'onboard_Q1';

  const OnboardQ1({Key? key}) : super(key: key);

  @override
  _OnboardQ1State createState() => _OnboardQ1State();
}

class _OnboardQ1State extends State<OnboardQ1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: MunchyOnboardScreen(
        question: "Q1",
        onPressed: () {
          Navigator.pushNamed(context, OnboardQ3.id);
        },
        progress: 0.1,
        oneoptiononly: true,
        controller: Provider.of<User>(context, listen: false).changeGoal,
        bottomTextOption: "",
      ),
    );
  }
}


