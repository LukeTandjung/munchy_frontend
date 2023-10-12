import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:munchy_mvp/controller/User controller.dart';
import 'package:munchy_mvp/widgets/MunchyOnboardScreen.dart';


class OnboardQ10 extends StatefulWidget {

  static const String id = 'onboard_Q10';

  const OnboardQ10({Key? key}) : super(key: key);

  @override
  _OnboardQ10State createState() => _OnboardQ10State();
}

class _OnboardQ10State extends State<OnboardQ10> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: MunchyOnboardScreen(
        question: "Q10",
        onPressed: () {
          Navigator.pushNamed(context, OnboardQ10.id);
        },
        progress: 1.0,
        oneoptiononly: true,
        controller: Provider.of<User>(context, listen: false).changeAllergies,
        bottomTextOption: "Always show",
      ),
    );
  }
}