import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:munchy_mvp/constants.dart';

class MunchySlideUpButton extends StatelessWidget {

  final void Function(DragUpdateDetails)? dragAction;

  const MunchySlideUpButton({
    Key? key,
    required this.dragAction
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget> [
        GestureDetector(
          onVerticalDragUpdate: dragAction,
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Container(
                color: Color(0xFFFEB987),
                height: 18.79.h,
              ),
              Positioned(
                bottom: 20,
                child: Column(
                  children: [
                    Icon(Icons.arrow_drop_up, color: Color(0xFF655D4F), size: 24,),
                    Text("Swipe up to continue",
                        style: kMediumTextStyle.copyWith(
                          color: Colors.white,
                          fontSize: 20,
                        )
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 9.39.h,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)
              )
          ),
        ),
      ],
    );
  }
}