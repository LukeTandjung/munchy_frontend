import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:munchy_mvp/controller/User controller.dart';
import 'package:munchy_mvp/widgets/MunchyOnboardScreen.dart';
import 'package:munchy_mvp/view/onboard_Q10.dart';


class OnboardQ9 extends StatefulWidget {

  static const String id = 'onboard_Q9';

  const OnboardQ9({Key? key}) : super(key: key);

  @override
  _OnboardQ9State createState() => _OnboardQ9State();
}

class _OnboardQ9State extends State<OnboardQ9> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: MunchyOnboardScreen(
        question: "Q9",
        onPressed: () {
          Navigator.pushNamed(context, OnboardQ10.id);
        },
        progress: 0.9,
        oneoptiononly: true,
        controller: Provider.of<User>(context, listen: false).changeHealthCondition,
        bottomTextOption: "Always show",
      ),
    );
  }
}