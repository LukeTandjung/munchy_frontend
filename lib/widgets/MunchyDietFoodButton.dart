import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:munchy_mvp/constants.dart';

class MunchyDietFoodButton extends StatefulWidget {

  final Widget dietfoodImage;
  final String dietfoodName;
  final void Function()? onPressed;
  final Color? primary;

  const MunchyDietFoodButton({Key? key, required this.dietfoodImage, required this.dietfoodName, required this.onPressed, this.primary}) : super(key: key);

  @override
  _MunchyDietFoodButtonState createState() => _MunchyDietFoodButtonState();
}

class _MunchyDietFoodButtonState extends State<MunchyDietFoodButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: ElevatedButton(
            child: widget.dietfoodImage,
            onPressed: widget.onPressed,
            style: ElevatedButton.styleFrom(
              fixedSize: Size(32.7.w, 32.7.w),
              primary: widget.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            widget.dietfoodName,
            style: kMediumTextStyle.copyWith(
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}