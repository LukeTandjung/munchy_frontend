import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:munchy_mvp/constants.dart';
import 'package:munchy_mvp/model/Onboard_questions.dart';
import 'package:munchy_mvp/widgets/MunchyOnboardOptions.dart';
import 'package:munchy_mvp/widgets/MunchyInitiativeButton.dart';
import 'package:munchy_mvp/widgets/MunchyOnboardTextField.dart';

class MunchyOnboardTextScreen extends StatefulWidget {

  final String question;
  final String buttonTextFirstOption;
  final String buttonTextSecondOption;
  final void Function()? onPressedFirstOption;
  final void Function()? onPressedSecondOption;
  final void Function()? onPressedPushScreen;
  final double progress;
  final bool oneoptiononly;
  final Function(String) controller;
  final String bottomTextOption;
  final String hintText;
  final void Function(String) onChanged;
  final Widget optionalButton;
  final BorderSide sideFirstOption;
  final BorderSide sideSecondOption;

  const MunchyOnboardTextScreen({
    Key? key,
    required this.question,
    required this.buttonTextFirstOption,
    required this.buttonTextSecondOption,
    required this.onPressedFirstOption,
    required this.onPressedSecondOption,
    required this.onPressedPushScreen,
    required this.progress,
    required this.oneoptiononly,
    required this.controller,
    required this.bottomTextOption,
    required this.hintText,
    required this.onChanged,
    required this.optionalButton,
    required this.sideFirstOption,
    required this.sideSecondOption,
  }) : super(key: key);

  @override
  _MunchyOnboardTextScreenState createState() => _MunchyOnboardTextScreenState();
}

class _MunchyOnboardTextScreenState extends State<MunchyOnboardTextScreen> {

  @override
  Widget build(BuildContext context) {

    final Map<String, String?> questionMap =
    OnboardQuestions.mapFromQuestionName("Q3");
    final Map<String, dynamic> variableMap =
    OnboardQuestions.mapFromVariableOption("Q3");

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
            MunchyOnboardTextField(
              buttonText: widget.buttonTextFirstOption,
              hintText: "",
              onChanged: widget.onChanged,
              onPressed: widget.onPressedFirstOption,
              optionalButton: widget.optionalButton,
              side: widget.sideFirstOption,
            ),
            MunchyOnboardOptions(
                buttonText: widget.buttonTextSecondOption,
                onPressed: widget.onPressedSecondOption,
                //     () {
                //   setState(() {
                //     widget.oneoptiononly == true ? variableMap.updateAll((key, value) => false) : null;
                //     variableMap[entry.key] = !variableMap[entry.key]!;
                //     widget.controller(entry.key);
                //   });
                // },
                side: widget.sideSecondOption,
                // variableMap[entry.key] == true ? BorderSide(color: Color(0xFF655D4F)) : BorderSide.none
            ),
            Text(
                questionMap["Bottom text"]!,
                textAlign: TextAlign.center,
                style: kRegularTextStyle.copyWith(
                    fontSize: 15,
                    color: (questionMap["Bottom text"] == "" || variableMap[widget.bottomTextOption] == false)? Colors.white : Color(0xFF655D4F)
                )
            ),
            MunchyInitiativeButton(
              buttonText: "Next",
              onPressed: widget.onPressedPushScreen,
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