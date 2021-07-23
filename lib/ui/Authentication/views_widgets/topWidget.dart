import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/constants/MyStyles.dart';
import 'package:bazarli/providers/authentication_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

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
              child: DropdownButton<Language>(
                icon: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.h,horizontal: 5.w),
                  child: SvgPicture.asset("assets/svg/arrow_down.svg"),
                ),
                underline: SizedBox(),
                items: <Language>[Language.English, Language.Arabic].map((Language value) {
                  return DropdownMenuItem<Language>(
                    value:value,
                    child: Row(
                      children: [
                        Container(
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 8.h,horizontal: 5.w),
                                  child: SvgPicture.asset(value == Language.English?"assets/svg/en.svg":"assets/svg/ar.svg"),
                                ),
                                // SizedBox(width: 4.w,),
                                // Text(value)
                              ],
                            )
                        ),
                      ],
                    ),
                  );
                }).toList(),
                value: Provider.of<AuthenticationProvider>(context).language==Language.English?Language.English:Language.Arabic,
                onChanged: (lang) {
                  Provider.of<AuthenticationProvider>(context, listen: false).switchLanguage(context);

                  // restart: true,

                },
              ),
            )
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: 37.h ),
        child: Text(Provider.of<AuthenticationProvider>(context).authMode==AuthMode.signUp?'Get_started':'SignIn',
          style: SliderTitle1Style,
        ).tr(),
      ),
      Container(
        margin: EdgeInsets.only(top: 10.h),
        child: Row(
          children: [
            Text(Provider.of<AuthenticationProvider>(context).authMode==AuthMode.signUp?'have_account':"Don't_have_account",
              style: SliderTitle2Style,
            ).tr(),
            SizedBox(
              width: 10.w,
            ),
           InkWell(
              onTap: (){
                Provider.of<AuthenticationProvider>(context, listen: false).switchMode();
              },
              child: Text(Provider.of<AuthenticationProvider>(context).authMode==AuthMode.signUp?'SignIn':'SignUp',
                style: SignInTextStyle,
              ).tr(),
            ),
          ],
        ),
      ),
    ]);
  }
}
