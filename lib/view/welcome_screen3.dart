// import 'package:flutter/material.dart';
// import 'package:sizer/sizer.dart';
// import 'package:munchy_mvp/constants.dart';
// import 'package:munchy_mvp/controller/FoodButtonController.dart';
// import 'package:munchy_mvp/view/welcome_screen4.dart';
// import 'package:intl/intl.dart';
// import 'package:provider/provider.dart';
// import 'package:munchy_mvp/controller/User controller.dart';
// import 'package:munchy_mvp/widgets/MunchyCheckBox.dart';
// import 'package:munchy_mvp/widgets/MunchyDateField.dart';
//
// class WelcomeScreenSeqThree extends StatefulWidget {
//
//   const WelcomeScreenSeqThree({Key? key}) : super(key: key);
//
//   static const String id = 'welcome_screen3';
//
//   @override
//   _WelcomeScreenSeqThreeState createState() => _WelcomeScreenSeqThreeState();
// }
//
// class _WelcomeScreenSeqThreeState extends State<WelcomeScreenSeqThree> {
//
//   bool maleinitialState = false;
//   bool femaleinitialState = false;
//   bool nextPage1 = false;
//   bool nextPage2 = false;
//
//   @override
//   void initState() {
//     dateinput.text = ""; //set the initial value of text field
//     super.initState();
//     dateinput.addListener(_updateNextPage1);
//   }
//
//   @override
//   void dispose() {
//     // Clean up the controller when the widget is removed from the widget tree.
//     // This also removes the _printLatestValue listener.
//     dateinput.dispose();
//     super.dispose();
//   }
//
//   void _updateNextPage1() {
//     setState(() {
//       nextPage1 = {dateinput.text}.isNotEmpty;
//     });
//   }
//
//   void checkSexState() {
//     if (maleinitialState == true) {
//       Provider.of<User>(context, listen: false).changeSex('Male');
//     } else if (femaleinitialState == true) {
//       Provider.of<User>(context, listen: false).changeSex('Female');
//     }
//   }
//
//   @override
//
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 9.8.w),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'What is your Birthday?',
//               style: kMediumTextStyle.copyWith(
//                 fontSize: 18.sp,
//               ),
//               textAlign: TextAlign.center,
//             ),
//             SizedBox(
//               height: 2.81.h,
//             ),
//             SizedBox(
//               height: 5.h,
//               width: 62.5.w,
//               child: MunchyDateField(),
//             ),
//             SizedBox(
//               height: 13.28.h,
//             ),
//             Text(
//               'What is your Sex?',
//               style: kMediumTextStyle.copyWith(
//                   fontSize: 18.sp
//               ),
//               textAlign: TextAlign.center,
//             ),
//             SizedBox(
//               height: 4.64.h,
//             ),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 16.w),
//               child: Column(
//                 children: [
//                   MunchyCheckBox(
//                     initialState: maleinitialState,
//                     text: 'Male',
//                     onChanged: (bool? newValue) {
//                       setState(() {
//                         maleinitialState = newValue!;
//                         femaleinitialState = false;
//                         checkSexState();
//                         nextPage2 = true;
//                         nextPage1 == true && nextPage2 == true ? Navigator.pushNamed(context, WelcomeScreenSeqFour.id) : nextPage2 = true;
//                       });
//                     },
//                   ),
//                   SizedBox(
//                     height: 4.43.h,
//                   ),
//                   MunchyCheckBox(
//                     initialState: femaleinitialState,
//                     text: 'Female',
//                     onChanged: (bool? newValue) {
//                       setState(() {
//                         femaleinitialState = newValue!;
//                         maleinitialState = false;
//                         checkSexState();
//                         nextPage2 = true;
//                         nextPage1 == true && nextPage2 == true ? Navigator.pushNamed(context, WelcomeScreenSeqFour.id) : nextPage2 = true;
//                       });
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
