import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/constants/MyStyles.dart';
import 'package:bazarli/shared_preference/sp_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_svg/svg.dart';

class ProfileToolBar extends StatelessWidget {

  bool isProfile = false;

  ProfileToolBar({this.isProfile = false});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      height: ScreenUtil.defaultSize.height/4,
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
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            isProfile?
            Container(
                height: 20.h,
                width: 65.w,
                child: Image.asset("assets/images/app_logo.png"))
             :  context.locale.toString()=='en'?
            InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: SvgPicture.asset('assets/svg/back.svg'))
                :InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: SvgPicture.asset('assets/svg/ar_back.svg')),

             SizedBox(height: 7.h,),
            Row(
              children: [
                Text('Hello',style: SliderTitle1Style,).tr(),
                if(SPHelper.spHelper.getUSer()!=null)
                  SizedBox(width: 5.w,),
                if(SPHelper.spHelper.getUSer()!=null)
                Text(SPHelper.spHelper.getUSer().firstName,style: SliderTitle1Style,),

                Text('!',style: SliderTitle1Style,),
              ],
            ),
            SizedBox(height: 5.h,),

            Text(SPHelper.spHelper.getUSer()!=null?SPHelper.spHelper.getUSer().email:'The region’s favourite online marketplace',style: SliderTitle2Style,).tr(),

          ],
        ),
      ),
      // ),
    );
  }
}
