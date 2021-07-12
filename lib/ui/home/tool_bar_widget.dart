import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/constants/MyStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_svg/svg.dart';

class ToolBar extends StatelessWidget {
  String name;
  ToolBar({this.name});
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        height: 117.h,
        decoration: BoxDecoration(
          color: WhiteColor,
          boxShadow: [
          BoxShadow(
              color: ShadowColor,
              // spreadRadius: 5 ,
              blurRadius: 7.0,
              offset: Offset(0.0, 8)
          ),
          ],
        ),
        child: Container(
            margin: EdgeInsets.only(top: 57.h),
            height: 20.h,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  if( context.locale.toString()=='en')
                    InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: SvgPicture.asset('assets/svg/back.svg')),

                  if( context.locale.toString()=='ar')
                    InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: SvgPicture.asset('assets/svg/ar_back.svg')),

                  Container(
                      width: 0.7.sw,
                      // height: 45.h,
                      alignment:context.fallbackLocale.toString()=='en'? Alignment.centerLeft:Alignment.centerRight,
                      child: Text(name,style: ProducttoolbarTitleStyle,maxLines: 2,).tr()
                  ),
                ]))

    );
  }
}
