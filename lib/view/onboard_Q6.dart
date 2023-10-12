import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:munchy_mvp/controller/User controller.dart';
import 'package:munchy_mvp/widgets/MunchyOnboardScreen.dart';
import 'package:munchy_mvp/view/onboard_Q8.dart';

class OnboardQ6 extends StatefulWidget {

  static const String id = 'onboard_Q6';

  const OnboardQ6({Key? key}) : super(key: key);

  @override
  _OnboardQ6State createState() => _OnboardQ6State();
}

class _OnboardQ6State extends State<OnboardQ6> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: MunchyOnboardScreen(
        question: "Q6",
        onPressed: () {
          Navigator.pushNamed(context, OnboardQ8.id);
        },
        progress: 0.6,
        oneoptiononly: true,
        controller: Provider.of<User>(context, listen: false).changeCheatMeals,
        bottomTextOption: "No cheat meals",
      ),
    );
  }
}
