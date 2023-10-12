import 'package:munchy_mvp/main.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:munchy_mvp/controller/FoodButtonController.dart';
import 'package:munchy_mvp/constants.dart';
import 'package:provider/provider.dart';
import 'package:munchy_mvp/widgets/MunchyCheckBox.dart';
import 'package:munchy_mvp/controller/User controller.dart';

class DietScreen extends StatefulWidget {
  const DietScreen({Key? key}) : super(key: key);

  static const String id = 'diet_screen';

  @override
  _DietScreenState createState() => _DietScreenState();
}

class _DietScreenState extends State<DietScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 7.94.w, vertical: 9.6.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              'This is your diet, ${Provider.of<User>(context).name}.',
              style: kMediumTextStyle.copyWith(
                fontSize: 25.sp,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 9.6.h,
            ),
            Center(
              child: Container(
                height: 58.h,
                padding: EdgeInsets.all(2.8.w),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(16.0)
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(0.86.h),
                        child: Text(
                          "${Provider.of<User>(context).name}'s Diet",
                          style: kRegularTextStyle.copyWith(
                            fontSize: 16.sp,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      MunchyTrailingMenu(day: 'Monday'),
                      MunchyTrailingMenu(day: 'Tuesday'),
                      MunchyTrailingMenu(day: 'Wednesday'),
                      MunchyTrailingMenu(day: 'Thursday'),
                      MunchyTrailingMenu(day: 'Friday'),
                      MunchyTrailingMenu(day: 'Saturday'),
                      MunchyTrailingMenu(day: 'Sunday')
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MunchyTrailingMenu extends StatefulWidget {

  final String day;

  const MunchyTrailingMenu({Key? key, required this.day}) : super(key: key);

  @override
  _MunchyTrailingMenuState createState() => _MunchyTrailingMenuState();
}

class _MunchyTrailingMenuState extends State<MunchyTrailingMenu> {

  generateFoodList() {
    List<FoodEaten> foodlist = [];
    for(String fooditem in Provider.of<Diet>(context, listen: false).diet) {
      FoodEaten newFood = FoodEaten(
        foodName: fooditem,
        foodQuantity: Provider.of<JsonDiet>(context, listen: false).jsondiet[fooditem].toString(),
      );
      foodlist.add(newFood);
    }
    return foodlist;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(1.94.h),
          child: Container(
            padding: EdgeInsets.all(2.1.w),
            child: Text(
              widget.day,
              style: kMediumTextStyle.copyWith(
                fontSize: 14,
              ),
            ),
            decoration: BoxDecoration(
              color: Color.fromRGBO(245, 166, 29, 0.33),
              borderRadius: BorderRadius.circular(30.0),
            )
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: ScrollPhysics(),
          itemBuilder: (context, index) {
            return ListTile(
              title: MunchyCheckBox(
                initialState: generateFoodList()[index].isEaten,
                text: generateFoodList()[index].foodName,
                onChanged: (bool? newValue) {
                  setState(() {
                    generateFoodList()[index].haveChanged();
                  });
                }
              ),
              trailing: Text(generateFoodList()[index].foodQuantity),
            );
          },
          itemCount: generateFoodList().length,
        ),
      ]
    );
  }
}


