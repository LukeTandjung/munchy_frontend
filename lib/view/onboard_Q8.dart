import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:munchy_mvp/controller/User controller.dart';
import 'package:munchy_mvp/widgets/MunchyOnboardScreen.dart';
import 'package:munchy_mvp/view/onboard_Q9.dart';

class OnboardQ8 extends StatefulWidget {

  static const String id = 'onboard_Q8';

  const OnboardQ8({Key? key}) : super(key: key);

  @override
  _OnboardQ8State createState() => _OnboardQ8State();
}

class _OnboardQ8State extends State<OnboardQ8> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: MunchyOnboardScreen(
        question: "Q8",
        onPressed: () {
          Navigator.pushNamed(context, OnboardQ9.id);
        },
        progress: 0.8,
        oneoptiononly: true,
        controller: Provider.of<User>(context, listen: false).changeDisorder,
        bottomTextOption: "Yes",
      ),
    );
  }
}