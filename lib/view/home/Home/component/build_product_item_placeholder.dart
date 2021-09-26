import 'package:bazarli/constants/MyColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_placeholder_textlines/placeholder_lines.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:easy_localization/easy_localization.dart';

class buildProductItemPlaceholder extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      // height:(0.70.sh)-50.h,
      decoration: BoxDecoration(
        color: WhiteColor,
        borderRadius: BorderRadius.circular(
          ScreenUtil().radius(10),
        ),
        boxShadow: [
          BoxShadow(
            color: ShadowColor,
            // spreadRadius: 5,
            blurRadius: 7.0,
            offset: Offset(0.0, 8),
          ),
        ],
      ),
      margin: EdgeInsets.symmetric(
        horizontal: 6.w,
        vertical: 5.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(
              ScreenUtil().radius(10),
            ),
            child: Container(
              width: double.infinity,
              height: (0.40.sh),
              child: SvgPicture.asset(
                'assets/svg/image_placeholder.svg',
                color: CurveColor,
              ),
            ),
          ),
          Container(
            // height:200.h,
            // width: ScreenUtil.defaultSize.width/2,
            margin: context.locale.toString() == 'en'
                ? EdgeInsets.only(top: 10.h, left: 10.w)
                : EdgeInsets.only(top: 10.h, right: 10.w),
            child: Row(
              children: [
                Container(
                  height: 80.h,
                  width: 0.2.sw,
                  child: Center(
                    child: Icon(
                      Icons.photo_rounded,
                      color: CurveColor,
                      size: 50,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Container(
                  width: 0.5.sw,
                  // child:Expanded(
                  child: PlaceholderLines(
                    count: 3,
                    animate: true,
                    color: PrimaryColor.withOpacity(0.3),
                  ),
                  // ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}