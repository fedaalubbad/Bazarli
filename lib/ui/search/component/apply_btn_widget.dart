import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/constants/MyStyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

class ApplyButtonWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
     return Positioned(
       bottom: 5,
       left: 20.w,
       right: 20.w,
       child: InkWell(
           onTap: () {
           },
           child: Container(
             // margin: EdgeInsets.symmetric(horizontal: 20.w),
             alignment: Alignment.center,
             height: 50.h,
             width: ScreenUtil.defaultSize.width,
             decoration: BoxDecoration(
               color: PrimaryColor,
               borderRadius:
               BorderRadius.circular(ScreenUtil().radius(5)),
             ),
             child: Text(
               'Apply',
               style:WhiteButtonStyle,
             ).tr(),
           )),
     );
  }

}