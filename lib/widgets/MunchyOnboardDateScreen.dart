import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:munchy_mvp/constants.dart';
import 'package:munchy_mvp/model/Onboard_questions.dart';
import 'package:munchy_mvp/widgets/MunchyOnboardOptions.dart';
import 'package:munchy_mvp/widgets/MunchyInitiativeButton.dart';
import 'package:munchy_mvp/widgets/MunchyOnboardDateField.dart';

class MunchyOnboardDateScreen extends StatefulWidget {

  final String question;
  final String buttonTextFirstOption;
  final String buttonTextSecondOption;
  final void Function()? onPressedFirstOption;
  final void Function()? onPressedSecondOption;
  final void Function()? onPressedPushScreen;
  final TextEditingController dateinput;
  final void Function()? onTap;
  final double progress;
  final String bottomTextOption;
  final BorderSide sideFirstOption;
  final BorderSide sideSecondOption;

  const MunchyOnboardDateScreen({
    Key? key,
    required this.question,
    required this.buttonTextFirstOption,
    required this.buttonTextSecondOption,
    required this.onPressedFirstOption,
    required this.onPressedSecondOption,
    required this.onPressedPushScreen,
    required this.dateinput,
    required this.onTap,
    required this.progress,
    required this.bottomTextOption,
    required this.sideFirstOption,
    required this.sideSecondOption,
  }) : super(key: key);

  @override
  _MunchyOnboardDateScreenState createState() => _MunchyOnboardDateScreenState();
}

class _MunchyOnboardDateScreenState extends State<MunchyOnboardDateScreen> {

  @override
  Widget build(BuildContext context) {

    final Map<String, String?> questionMap =
    OnboardQuestions.mapFromQuestionName(widget.question);
    final Map<String, dynamic> variableMap =
    OnboardQuestions.mapFromVariableOption(widget.question);

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
            MunchyOnboardDateField(
              dateinput: widget.dateinput,
              buttonText: widget.buttonTextFirstOption,
              onPressed: widget.onPressedFirstOption,
              onTap: widget.onTap,
              side: widget.sideFirstOption,
            ),
            MunchyOnboardOptions(
              buttonText: widget.buttonTextSecondOption,
              onPressed: widget.onPressedSecondOption,
              side: widget.sideSecondOption,
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