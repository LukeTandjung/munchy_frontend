// import 'package:munchy_mvp/main.dart';
// import 'package:flutter/material.dart';
// import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
// import 'package:sizer/sizer.dart';
// import 'package:provider/provider.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:munchy_mvp/controller/FoodButtonController.dart';
// import 'package:munchy_mvp/food_list.dart';
// import 'package:munchy_mvp/view/diet_screen.dart';
// import 'package:munchy_mvp/controller/networking.dart';
// import 'package:munchy_mvp/widgets/MunchyDietFoodButton.dart';
// import 'package:munchy_mvp/widgets/MunchyInitiativeButton.dart';
// import 'package:munchy_mvp/controller/User controller.dart';
// import 'package:munchy_mvp/model/User.dart';
//
// var diet = <String>[];
//
// class WelcomeScreenSeqFive extends StatelessWidget {
//   const WelcomeScreenSeqFive({Key? key}) : super(key: key);
//
//   static const String id = 'welcome_screen5';
//
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       initialIndex: 1,
//       length: 3,
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//           title: Text('Diet Food'),
//           bottom: TabBar(
//             tabs: const <Widget>[
//               Tab(
//                 text: 'Carbohydrates',
//                 icon: Icon(Icons.bakery_dining),
//               ),
//               Tab(
//                 text: 'Protein',
//                 icon: Icon(Icons.egg),
//               ),
//               Tab(
//                 text: 'Fats',
//                 icon: Icon(Icons.breakfast_dining),
//               ),
//             ],
//           ),
//         ),
//         body: TabBarView(
//           children: const <Widget>[
//             CarbohydrateSelectionButtons(),
//             ProteinSelectionButtons(),
//             FatSelectionButtons(),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class CarbohydrateSelectionButtons extends StatefulWidget {
//   const CarbohydrateSelectionButtons({Key? key}) : super(key: key);
//
//   @override
//   _CarbohydrateSelectionButtonsState createState() => _CarbohydrateSelectionButtonsState();
// }
//
// class _CarbohydrateSelectionButtonsState extends State<CarbohydrateSelectionButtons> {
//
//   final _firestore = FirebaseFirestore.instance;
//   bool showSpinner = false;
//
//   getCarbohydrateFoodItems() {
//     List<Widget> carbohydrateMenu = [];
//     for (int food = 0; food < (foodListCarbohydrates.length); food++) {
//       var newFoodItem = MunchyDietFoodButton(
//         dietfoodImage: ClipRRect(
//           borderRadius: BorderRadius.circular(16),
//           child: Image.asset(
//             'assets/images/${foodListCarbohydrates[food][0].toLowerCase()}${foodListCarbohydrates[food].substring(1)}.jpg')
//         ),
//         dietfoodName: foodListCarbohydrates[food],
//         onPressed: () {
//           if (diet.contains(foodListCarbohydrates[food])) {
//             diet.remove(foodListCarbohydrates[food]);
//           } else {
//             diet.add(foodListCarbohydrates[food]);
//           }
//           setState(() {
//             carbohydrateFoodItemListState[food] = !carbohydrateFoodItemListState[food];
//           });
//         },
//         primary: carbohydrateFoodItemListState[food]
//             ? Color(0xFFFEB987)
//             : Color.fromRGBO(245, 166, 29, 0.33),
//       );
//       carbohydrateMenu.add(newFoodItem);
//     }
//     return carbohydrateMenu;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return ModalProgressHUD(
//       inAsyncCall: showSpinner,
//       child: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 9.8.w, vertical: 4.5.h),
//         child: SingleChildScrollView(
//           scrollDirection: Axis.vertical,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               GridView.count(
//                 shrinkWrap: true,
//                 physics: ScrollPhysics(),
//                 crossAxisCount: 2,
//                 children: getCarbohydrateFoodItems(),
//               ),
//               SizedBox(
//                 height: 9.8.w,
//               ),
//               MunchyInitiativeButton(
//                 buttonText: 'Plan my diet!',
//                 onPressed: () async {
//                   setState(() {
//                     showSpinner = true;
//                   });
//                   Provider.of<Diet>(context, listen: false).changeDiet(diet);
//                   _firestore.collection('users').add({UserData.get(
//                     'Email': Provider.of<User>(context, listen: false).email,
//                     'Password': Provider.of<User>(context, listen: false).password,
//                     'Promotional': Provider.of<User>(context, listen: false).promotion,
//                     'Name': Provider.of<User>(context, listen: false).name,
//                     'Age': Provider.of<User>(context, listen: false).age,
//                     'Sex': Provider.of<User>(context, listen: false).sex,
//                     'Height': Provider.of<User>(context, listen: false).height,
//                     'Weight': Provider.of<User>(context, listen: false).weight,
//                     'Body Fat': Provider.of<User>(context, listen: false).fatpercent,
//                     'Diet': Provider.of<Diet>(context, listen: false).diet,
//                   )});
//                   var jsonDiet = await NetworkHelper(
//                     email: Provider.of<User>(context, listen: false).email,
//                     password: Provider.of<User>(context, listen: false).password,
//                     promotion: Provider.of<User>(context, listen: false).promotion,
//                     name: Provider.of<User>(context, listen: false).name,
//                     age: Provider.of<User>(context, listen: false).age,
//                     sex: Provider.of<User>(context, listen: false).sex,
//                     height: Provider.of<User>(context, listen: false).height,
//                     weight: Provider.of<User>(context, listen: false).weight,
//                     fatpercent: Provider.of<User>(context, listen: false).fatpercent,
//                     diet: Provider.of<Diet>(context, listen: false).diet,
//                   ).getUserData();
//                   Provider.of<JsonDiet>(context, listen: false).changeJsonDiet(jsonDiet);
//                   Navigator.pushNamed(context, DietScreen.id);
//                   setState(() {
//                     showSpinner = false;
//                   });
//                 },
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class ProteinSelectionButtons extends StatefulWidget {
//   const ProteinSelectionButtons({Key? key}) : super(key: key);
//
//   @override
//   _ProteinSelectionButtonsState createState() => _ProteinSelectionButtonsState();
// }
//
// class _ProteinSelectionButtonsState extends State<ProteinSelectionButtons> {
//
//   final _firestore = FirebaseFirestore.instance;
//   bool showSpinner = false;
//
//   getProteinFoodItems() {
//     List<Widget> proteinMenu = [];
//     for (int food = 0; food < (foodListProtein.length); food++) {
//       var newFoodItem = MunchyDietFoodButton(
//         dietfoodImage: ClipRRect(
//           borderRadius: BorderRadius.circular(16),
//           child: Image.asset(
//             'assets/images/${foodListProtein[food][0].toLowerCase()}${foodListProtein[food].substring(1)}.jpg'),
//         ),
//         dietfoodName: foodListProtein[food],
//         onPressed: () {
//           if (diet.contains(foodListProtein[food])) {
//             diet.remove(foodListProtein[food]);
//           } else {
//             diet.add(foodListProtein[food]);
//           }
//           setState(() {
//             proteinFoodItemListState[food] = !proteinFoodItemListState[food];
//           });
//         },
//         primary: proteinFoodItemListState[food]
//             ? Color(0xFFFEB987)
//             : Color.fromRGBO(245, 166, 29, 0.33),
//       );
//       proteinMenu.add(newFoodItem);
//     }
//     return proteinMenu;
//   }
//
//   // replace GridView.count() with GridView.builder() in the future.
//
//   @override
//   Widget build(BuildContext context) {
//     return ModalProgressHUD(
//       inAsyncCall: showSpinner,
//       child: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 9.8.w, vertical: 4.5.h),
//         child: SingleChildScrollView(
//           scrollDirection: Axis.vertical,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               GridView.count(
//                 shrinkWrap: true,
//                 physics: ScrollPhysics(),
//                 crossAxisCount: 2,
//                 children: getProteinFoodItems(),
//               ),
//               SizedBox(
//                 height: 9.8.w,
//               ),
//               MunchyInitiativeButton(
//                 buttonText: 'Plan my diet!',
//                 onPressed: () async {
//                   setState(() {
//                     showSpinner = true;
//                   });
//                   Provider.of<Diet>(context, listen: false).changeDiet(diet);
//                   _firestore.collection('users').add({
//                     'Email': Provider.of<Email>(context, listen: false).email,
//                     'Password': Provider.of<Password>(context, listen: false).password,
//                     'Promotional': Provider.of<PromotionalMaterial>(context, listen: false).promotion,
//                     'Name': Provider.of<Name>(context, listen: false).name,
//                     'Age': Provider.of<Age>(context, listen: false).age,
//                     'Sex': Provider.of<Sex>(context, listen: false).sex,
//                     'Height': Provider.of<Height>(context, listen: false).height,
//                     'Weight': Provider.of<Weight>(context, listen: false).weight,
//                     'Body Fat': Provider.of<FatPercent>(context, listen: false).fatpercent,
//                     'Diet': Provider.of<Diet>(context, listen: false).diet,
//                   });
//                   var jsonDiet = await NetworkHelper(
//                     email: Provider.of<Email>(context, listen: false).email,
//                     password: Provider.of<Password>(context, listen: false).password,
//                     promotion: Provider.of<PromotionalMaterial>(context, listen: false).promotion,
//                     name: Provider.of<Name>(context, listen: false).name,
//                     age: Provider.of<Age>(context, listen: false).age,
//                     sex: Provider.of<Sex>(context, listen: false).sex,
//                     height: Provider.of<Height>(context, listen: false).height,
//                     weight: Provider.of<Weight>(context, listen: false).weight,
//                     fatpercent: Provider.of<FatPercent>(context, listen: false).fatpercent,
//                     diet: Provider.of<Diet>(context, listen: false).diet,
//                   ).getUserData();
//                   Provider.of<JsonDiet>(context, listen: false).changeJsonDiet(jsonDiet);
//                   Navigator.pushNamed(context, DietScreen.id);
//                   setState(() {
//                     showSpinner = false;
//                   });
//                 },
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class FatSelectionButtons extends StatefulWidget {
//   const FatSelectionButtons({Key? key}) : super(key: key);
//
//   @override
//   _FatSelectionButtonsState createState() => _FatSelectionButtonsState();
// }
//
// class _FatSelectionButtonsState extends State<FatSelectionButtons> {
//
//   final _firestore = FirebaseFirestore.instance;
//   bool showSpinner = false;
//
//   getFatFoodItems() {
//     List<Widget> fatMenu = [];
//     for (int food = 0; food < (foodListFats.length); food++) {
//       var newFoodItem = MunchyDietFoodButton(
//         dietfoodImage: ClipRRect(
//             borderRadius: BorderRadius.circular(16),
//             child: Image.asset(
//                 'assets/images/${foodListFats[food][0].toLowerCase()}${foodListFats[food].substring(1)}.jpg')),
//         dietfoodName: foodListFats[food],
//         onPressed: () {
//           if (diet.contains(foodListFats[food])) {
//             diet.remove(foodListFats[food]);
//           } else {
//             diet.add(foodListFats[food]);
//           }
//           setState(() {
//             fatFoodItemListState[food] = !fatFoodItemListState[food];
//           });
//         },
//         primary: fatFoodItemListState[food]
//             ? Color(0xFFFEB987)
//             : Color.fromRGBO(245, 166, 29, 0.33),
//       );
//       fatMenu.add(newFoodItem);
//     }
//     return fatMenu;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return ModalProgressHUD(
//       inAsyncCall: showSpinner,
//       child: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 9.8.w, vertical: 4.5.h),
//         child: SingleChildScrollView(
//           scrollDirection: Axis.vertical,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               GridView.count(
//                 shrinkWrap: true,
//                 physics: ScrollPhysics(),
//                 crossAxisCount: 2,
//                 children: getFatFoodItems(),
//               ),
//               SizedBox(
//                 height: 9.8.w,
//               ),
//               MunchyInitiativeButton(
//                 buttonText: 'Plan my diet!',
//                 onPressed: () async {
//                   setState(() {
//                     showSpinner = true;
//                   });
//                   Provider.of<Diet>(context, listen: false).changeDiet(diet);
//                   _firestore.collection('users').add({
//                     'Email': Provider.of<Email>(context, listen: false).email,
//                     'Password': Provider.of<Password>(context, listen: false).password,
//                     'Promotional': Provider.of<PromotionalMaterial>(context, listen: false).promotion,
//                     'Name': Provider.of<Name>(context, listen: false).name,
//                     'Age': Provider.of<Age>(context, listen: false).age,
//                     'Sex': Provider.of<Sex>(context, listen: false).sex,
//                     'Height': Provider.of<Height>(context, listen: false).height,
//                     'Weight': Provider.of<Weight>(context, listen: false).weight,
//                     'Body Fat': Provider.of<FatPercent>(context, listen: false).fatpercent,
//                     'Diet': Provider.of<Diet>(context, listen: false).diet,
//                   });
//                   var jsonDiet = await NetworkHelper(
//                     email: Provider.of<Email>(context, listen: false).email,
//                     password: Provider.of<Password>(context, listen: false).password,
//                     promotion: Provider.of<PromotionalMaterial>(context, listen: false).promotion,
//                     name: Provider.of<Name>(context, listen: false).name,
//                     age: Provider.of<Age>(context, listen: false).age,
//                     sex: Provider.of<Sex>(context, listen: false).sex,
//                     height: Provider.of<Height>(context, listen: false).height,
//                     weight: Provider.of<Weight>(context, listen: false).weight,
//                     fatpercent: Provider.of<FatPercent>(context, listen: false).fatpercent,
//                     diet: Provider.of<Diet>(context, listen: false).diet,
//                   ).getUserData();
//                   Provider.of<JsonDiet>(context, listen: false).changeJsonDiet(jsonDiet);
//                   Navigator.pushNamed(context, DietScreen.id);
//                   setState(() {
//                     showSpinner = false;
//                   });
//                 },
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }



