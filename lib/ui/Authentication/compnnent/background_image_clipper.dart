import 'package:bazarli/constants/MyColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'curve_clipper.dart';

class BackgroundImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // Size size = MediaQuery.of(context).size;

    return ClipPath(
      clipper: CurveClipper(),
      child: Container(
        width: ScreenUtil.defaultSize.width.w,
        height:ScreenUtil.defaultSize.height.h/1.2.h,
        color: WhiteColor,
        // child: Padding(
          // padding: const EdgeInsets.symmetric(
          //     horizontal: 0.0,
          //     vertical: 0.0),
            // child: Image(
            //   image: AssetImage('assets/images/pic2.jpg'),
            //   fit: BoxFit.cover,
          // ),
        // ),
      ),
    );
  }
}