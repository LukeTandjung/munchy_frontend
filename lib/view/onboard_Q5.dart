import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:munchy_mvp/controller/User controller.dart';
import 'package:munchy_mvp/model/Onboard_questions.dart';
import 'package:munchy_mvp/widgets/MunchyOnboardDateScreen.dart';
import 'package:munchy_mvp/view/onboard_Q6.dart';

class OnboardQ5 extends StatefulWidget {

  static const String id = 'onboard_Q5';

  const OnboardQ5({Key? key}) : super(key: key);

  @override
  _OnboardQ5State createState() => _OnboardQ5State();
}

class _OnboardQ5State extends State<OnboardQ5> {

  final TextEditingController dateinput = TextEditingController();

  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final Map<String, dynamic> variableMap =
    OnboardQuestions.mapFromVariableOption("Q5");

    return Scaffold(
      backgroundColor: Colors.white,
      body: MunchyOnboardDateScreen(
        dateinput: dateinput,
        question: "Q5",
        buttonTextFirstOption: "I prepare the same meals for",
        buttonTextSecondOption: "I don't do meal preparation, I cook something different everyday",
        onPressedFirstOption: () {
          setState(() {
            variableMap["I prepare the same meals for"] = true;
            variableMap["I don't do meal preparation, I cook something different everyday"] = false;
          });
        },
        onPressedSecondOption: () {
          setState(() {
            variableMap["I prepare the same meals for"] = false;
            variableMap["I don't do meal preparation, I cook something different everyday"] = true;
            dateinput.text = "";
          });
        },
        onPressedPushScreen: () {
          Navigator.pushNamed(context, OnboardQ6.id);
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
        sideFirstOption: variableMap["I prepare the same meals for"] == true ? BorderSide(color: Color(0xFF655D4F)) : BorderSide.none,
        sideSecondOption: variableMap["I don't do meal preparation, I cook something different everyday"] == true ? BorderSide(color: Color(0xFF655D4F)) : BorderSide.none,
        progress: 0.5,
        bottomTextOption: "",
      ),
    );
  }
}
