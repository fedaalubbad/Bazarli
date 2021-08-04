import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/constants/MyStyles.dart';
import 'package:bazarli/providers/authentication_provider.dart';
import 'package:bazarli/ui/Authentication/utils/BottomWaveClipper.dart';
import 'package:bazarli/ui/Authentication/widgets/custom_login_button.dart';
import 'package:bazarli/ui/Authentication/widgets/textFormField_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class ForgetPasswordScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CurveColor,
        body: SafeArea(
          child: Stack(
            children: [
              ClipPath(
                clipper: BottomWaveClipper(value: 5),
                child: Container(
                  color: WhiteColor,
                  height: ScreenUtil.defaultSize.height/1.2,
                ),
              ),

              Container(
                padding: EdgeInsets.only(top: 30.h,left: 20.w,right:20.w),
                // color: WhiteColor,
                child: SingleChildScrollView(
                  child: Column(
                    // mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
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
                      child: Text('Forgot_Password',
                        style: SliderTitle1Style,
                      ).tr(),
                    ),
                    Container(
                          child:Text('EnterRegisteredEmail',
                            style: SliderTitle2Style,
                          ).tr(),

                    ),

                  //form/////////////////////////////////
                   Form(
                    key:Provider.of<AuthenticationProvider>(context, listen: false).formStateKey2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 33.h,
                        ),

                        Text('Email',
                          style: TextLabelStyle,
                        ).tr(),
                        SizedBox(
                          height: 10.h,
                        ),

                        CustomTextfieldWidget(
                          linesNo: 1,
                          isObscure: false,
                          isPassword: false,
                          contraller: Provider.of<AuthenticationProvider>(context, listen: false).emailForgetPassContraller,
                          hint: 'Email'.tr(),
                          textInputType:TextInputType.emailAddress,
                          save:Provider.of<AuthenticationProvider>(context, listen: false).saveEmail2,
                          validator:Provider.of<AuthenticationProvider>(context, listen: false).validateEmail2,
                        ),
                      //////////////////////////////////////bottom
                        SizedBox(
                          height: 20.h,
                        ),
                        CustomLoginButton(isResetPassword: true,),
                        SizedBox(
                          height: 20.h,
                        ),

                    ],
                  ),
                ),
                  ]
              ),
                ),
              ),
              if(Provider.of<AuthenticationProvider>(context).isLoading)
                Positioned(top: 0,bottom: 0,left: 0,right: 0,
                    child: Center(child: CircularProgressIndicator(color: PrimaryColor,)))
            ],
          ),
        )
    );
  }

}

