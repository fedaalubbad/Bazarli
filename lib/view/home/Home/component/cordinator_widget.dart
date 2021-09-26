import 'package:bazarli/constants/MyColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BuildCordinator extends StatelessWidget {
  int currentIndex, index;

  BuildCordinator(this.currentIndex, this.index);

  @override
  Widget build(BuildContext context) {
    return  Container(
            width: 7,
            height: 7,
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: currentIndex == index ? BlueDarkColor : GrayColor,
            ),

        );
  }
}
