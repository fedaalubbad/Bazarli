import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/constants/MyStyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginTopWigget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      Container(
        // margin: EdgeInsets.only(top: 36.h, left: 20.w, right: 20.w),
        height: 50.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                width: 130.w,
                height: 36.h,
                child: Image.asset("assets/images/app_logo.png")),
            Container(
              // width:80.w,
              height: 45.h,
              decoration: BoxDecoration(
                border: Border.all(color: BorderColor, width: 1.w),
                borderRadius:
                    BorderRadius.all(Radius.circular(ScreenUtil().radius(5))),
              ),
              child: DropdownButton<String>(
                icon: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 5.w),
                  child: SvgPicture.asset("assets/svg/arrow_down.svg"),
                ),
                underline: SizedBox(),
                items: <String>[
                  'en',
                  'ar',
                ].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Row(
                      children: [
                        Container(
                            child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 8.h, horizontal: 5.w),
                              child: SvgPicture.asset(value == 'ar'
                                  ? "assets/svg/ar.svg"
                                  : "assets/svg/en.svg"),
                            ),
                            // SizedBox(width: 4.w,),
                            // Text(value)
                          ],
                        )),
                      ],
                    ),
                  );
                }).toList(),
                value: 'en',
                onChanged: (lang) {
                context.locale==lang;
                },
              ),
            )
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: 37.h,left: 20.w,right:20.w ),
        child: Text('Get_started',
          style: SliderTitle1Style,
        ).tr(),
      ),
      Container(
        margin: EdgeInsets.only(top: 10.h,left: 20.w,right:20.w),
        child: Row(
          children: [
            Text('have_account',
              style: SliderTitle2Style,
            ).tr(),
            SizedBox(
              width: 10.w,
            ),
            Text('SignIn',
              style: SignInTextStyle,
            ).tr(),
          ],
        ),
      )
    ]);
  }
}
