import 'package:bazarli/constants/MyColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class HomeToolBar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      color: WhiteColor,
       height: 117.h,
        // child: Center(
          child: Container(
            margin: EdgeInsets.only(top:70.h ),
            height: 20.h,
            child: Row(
              // mainAxisSize: MainAxisSize.max,
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                   Container(
                     height:20.h ,
                       width:65.w ,
                       child: Image.asset("assets/images/app_logo.png")
                   ),
              ],

      ),
          ),
        // ),
    );
  }

}