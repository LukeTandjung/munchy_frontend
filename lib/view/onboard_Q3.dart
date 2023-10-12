import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:munchy_mvp/controller/User controller.dart';
import 'package:munchy_mvp/model/Onboard_questions.dart';
import 'package:munchy_mvp/widgets/MunchyOnboardDateScreen.dart';
import 'package:munchy_mvp/view/onboard_Q4.dart';

class OnboardQ3 extends StatefulWidget {

  static const String id = 'onboard_Q3';

  const OnboardQ3({Key? key}) : super(key: key);

  @override

  _OnboardQ3State createState() => _OnboardQ3State();
}

class _OnboardQ3State extends State<OnboardQ3> {

  final TextEditingController dateinput = TextEditingController();

  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
  }

  @override

  Widget build(BuildContext context) {

    Map<String, dynamic> variableMap =
    OnboardQuestions.mapFromVariableOption("Q3");

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: MunchyOnboardDateScreen(
        dateinput: dateinput,
        question: "Q3",
        buttonTextFirstOption: "Yes, I need to achieve my target goal by",
        buttonTextSecondOption: "No, I do not have one",
        onPressedFirstOption: () {
          setState(() {
            variableMap["No, I do not have one"] = false;
            variableMap["Yes, I need to achieve my goal by"] = true;
          });
        },
        onPressedSecondOption: () {
          setState(() {
            variableMap["Yes, I need to achieve my goal by"] = false;
            variableMap["No, I do not have one"] = true;
            dateinput.text = "";
          });
        },
        onPressedPushScreen: () {
          Navigator.pushNamed(context, OnboardQ4.id);
        },
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now(), //DateTime.now() - not to allow to choose before today.
            lastDate: DateTime(2100)
          );
          if(pickedDate != null ) {
            String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate); //you can implement different kind of Date Format here according to your requirement
            setState(() {
              dateinput.text = formattedDate;
              Provider.of<User>(context, listen: false).changeDeadline(dateinput.text);//set output date to TextField value.
            });
          }
        },
        sideFirstOption: variableMap["Yes, I need to achieve my goal by"] == true ? BorderSide(color: Color(0xFF655D4F)) : BorderSide.none,
        sideSecondOption: variableMap["No, I do not have one"] == true ? BorderSide(color: Color(0xFF655D4F)) : BorderSide.none,
        progress: 0.3,
        bottomTextOption: "Yes, I need to achieve my goal by",
      ),
    );
  }
}
