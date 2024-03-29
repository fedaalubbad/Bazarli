import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/constants/MyStyles.dart';
import 'package:bazarli/ViewModel/authentication_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

class CustomLoginButton extends StatelessWidget {
 bool isResetPassword;
 CustomLoginButton({this.isResetPassword=false});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
          onTap: () {
            if(isResetPassword){
              Provider.of<AuthenticationProvider>(context, listen: false)
                  .forgetPassword(context);
            }else {
              if (Provider
                  .of<AuthenticationProvider>(context, listen: false)
                  .authMode == AuthMode.login) {
                Provider.of<AuthenticationProvider>(context, listen: false)
                    .customerSign(context);
              } else {
                Provider.of<AuthenticationProvider>(context, listen: false)
                    .customerRegister(context);
              }
            }
          },
          child: Container(
            margin: EdgeInsets.only(
                left:20.w, right: 20.h, top: 5.h),
            alignment: Alignment.center,
            height: 45.h,
            width: ScreenUtil.defaultSize.width,
            decoration: BoxDecoration(
                color: PrimaryColor,
                borderRadius: BorderRadius.circular(ScreenUtil().radius(5))),

            child: Text(Provider.of<AuthenticationProvider>(context).authMode==AuthMode.signUp?'SignUp':'SignIn',
              style:SliderNextStyle,
            ).tr(),
          )

      ),
    );
  }
}
