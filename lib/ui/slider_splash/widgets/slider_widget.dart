import 'package:bazarli/constants/MyStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

class SliderPage extends StatelessWidget {
  String title;
  String description;
  String image;

  SliderPage({this.title, this.description,  this.image});

  @override
  Widget build(BuildContext context) {

    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset(
            image,
            // width: width * 0.6,
          ),
          SizedBox(height: 15.h),
          Text(
            title,
            style: SliderTitle1Style,
          ).tr(),
           SizedBox(height: 5.h),
            Text(
              description,
              style: SliderTitle2Style,
              textAlign: TextAlign.center,
            ).tr(),

        ],
      ),
    );
  }
}