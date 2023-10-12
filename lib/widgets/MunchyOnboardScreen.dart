import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:munchy_mvp/constants.dart';
import 'package:munchy_mvp/model/Onboard_questions.dart';
import 'package:munchy_mvp/widgets/MunchyOnboardOptions.dart';
import 'package:munchy_mvp/widgets/MunchyInitiativeButton.dart';

class MunchyOnboardScreen extends StatefulWidget {

  final String question;
  final void Function()? onPressed;
  final double progress;
  final bool oneoptiononly;
  final Function(String) controller;
  final String bottomTextOption;

  const MunchyOnboardScreen({
    Key? key,
    required this.question,
    required this.onPressed,
    required this.progress,
    required this.oneoptiononly,
    required this.controller,
    required this.bottomTextOption,
  }) : super(key: key);

  @override
  _MunchyOnboardScreenState createState() => _MunchyOnboardScreenState();
}

class _MunchyOnboardScreenState extends State<MunchyOnboardScreen> {

  @override
  Widget build(BuildContext context) {

    final Map<String, String?> questionMap =
    OnboardQuestions.mapFromQuestionName(widget.question);

    final Map<String, bool> optionMap =
    OnboardQuestions.mapFromQuestionOption(widget.question);

    return SafeArea(
      top: true,
      bottom: true,
      left: false,
      right: false,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.06.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: Text(
                questionMap["Question"]!,
                textAlign: TextAlign.center,
                style: kMediumTextStyle.copyWith(
                  fontSize: 35,
                ),
              ),
            ),
            Center(
              child: Text(
                questionMap["Description"]!,
                textAlign: TextAlign.center,
                style: kRegularTextStyle.copyWith(
                    fontSize: 22
                ),
              ),
            ),
            for (var entry in optionMap.entries)
            MunchyOnboardOptions(
              buttonText: entry.key,
              onPressed: () {
                setState(() {
                  widget.oneoptiononly == true ? optionMap.updateAll((key, value) => false) : null;
                  optionMap[entry.key] = !optionMap[entry.key]!;
                  widget.controller(entry.key);
                });
              },
              side: optionMap[entry.key] == true ? BorderSide(color: Color(0xFF655D4F)) : BorderSide.none
            ),
            Text(
              questionMap["Bottom text"]!,
              textAlign: TextAlign.center,
              style: kRegularTextStyle.copyWith(
                fontSize: 15,
                color: (questionMap["Bottom text"] == "" || optionMap[widget.bottomTextOption] == false)? Colors.white : Color(0xFF655D4F)
              )
            ),
            MunchyInitiativeButton(
              buttonText: "Next",
              onPressed: widget.onPressed,
            ),
            TweenAnimationBuilder<double>(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeInOut,
              tween: Tween<double>(
                begin: 0,
                end: widget.progress,
              ),
              builder: (context, value, _) =>
                LinearProgressIndicator(
                  value: value,
                  backgroundColor: Color(0x26018786),
                  color: Color(0xFFFE6A00),
                ),
            )
          ],
        ),
      ),
    );
  }
}