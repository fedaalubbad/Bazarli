import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/constants/MyStyles.dart';
import 'package:bazarli/constants/heights.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../loginAndRegister.dart';

class SignScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: WhiteColor,
        height: double.infinity,
        width:  double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin:EdgeInsets.only(top: 36.h,left: 20.w,right: 20.w) ,
                height:50.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(width:130.w,
                        height:36.h,
                        child:Image.asset("assets/images/app_logo.png")),

                    Container(
                      // width:80.w,
                      height: 45.h,
                      decoration: BoxDecoration(
                        border: Border.all(color:BorderColor, width: 1.w),
                        borderRadius: BorderRadius.all(Radius.circular(ScreenUtil().radius(5))),
                      ),
                      child: DropdownButton<String>(
                        icon: Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.h,horizontal: 5.w),
                          child: SvgPicture.asset("assets/svg/arrow_down.svg"),
                        ),
                        underline: SizedBox(),
                        items: <String>['en', 'ar',].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Row(
                              children: [
                                Container(
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(vertical: 8.h,horizontal: 5.w),
                                          child: SvgPicture.asset(value=='ar'?"assets/svg/ar.svg":"assets/svg/en.svg"),
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
                        value: 'en',
                        onChanged: (lang) {
                          translator.setNewLanguage(
                            context,
                            newLanguage:lang,
                            remember: true,
                            // restart: true,
                          );

                        },
                      ),
                    )

                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 37.h),
                child: Text(
                  translator.translate('Welcome_to_Bagisto'),
                  style: translator.currentLanguage == 'ar'
                      ? GoogleFonts.tajawal(textStyle: SliderTitle1Style)
                      : GoogleFonts.poppins(textStyle: SliderTitle1Style),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10.h),
                child: Text(
                  translator.translate('small_description'),
                  style: translator.currentLanguage == 'ar'
                      ? GoogleFonts.tajawal(textStyle: SliderTitle2Style)
                      : GoogleFonts.poppins(textStyle: SliderTitle2Style),
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
              SvgPicture.asset(
                'assets/svg/SignImage.svg',
                // width: width * 0.6,
              ),
              SizedBox(
                height: 20.h,
              ),
              InkWell(
                  onTap: () {
                    Navigator.push(context,MaterialPageRoute(builder: (context){
                      return LoginPage();
                    }));
                  },
                  child: Container(
                    margin: EdgeInsets.only(left:kDefaultPaddin,right: kDefaultPaddin,top: 50.h),
                    alignment: Alignment.center,
                    height: 45.h,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: PrimaryColor,
                        borderRadius: BorderRadius.circular(ScreenUtil().radius(5))),
                    child: Text(
                      translator.translate('SignIn'),
                      style: translator.currentLanguage == 'ar'
                          ? GoogleFonts.tajawal(textStyle: SliderNextStyle)
                          : GoogleFonts.poppins(textStyle: SliderNextStyle),
                    ),
                  )),
                 InkWell(
                  onTap: () {
                    Navigator.push(context,MaterialPageRoute(builder: (context){
                      return LoginPage();
                    }));
                  },
                  child: Container(
                    margin: EdgeInsets.only(left:kDefaultPaddin,right: kDefaultPaddin,top: 5.h),
                    alignment: Alignment.center,
                    height: 45.h,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: PrimaryColor,
                        borderRadius: BorderRadius.circular(ScreenUtil().radius(5))),
                    child: Text(
                      translator.translate('SignUp'),
                      style: translator.currentLanguage == 'ar'
                          ? GoogleFonts.tajawal(textStyle: SliderNextStyle)
                          : GoogleFonts.poppins(textStyle: SliderNextStyle),
                    ),
                  )),
              SizedBox(
                height: 20.h,
              ),
              Text(
                  translator.translate('on_continue'),
                  style: translator.currentLanguage == 'ar'
                      ? GoogleFonts.tajawal(textStyle: OnContinueStyle):GoogleFonts.poppins(textStyle: OnContinueStyle)),

              SizedBox(
                height: 20.h,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(top: 10.h,bottom: 50.h),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                        onTap: (){

                        },
                        child: SvgPicture.asset('assets/svg/facebook.svg')),
                    SizedBox(width: 20.w,),

                    InkWell(
                        onTap: (){},
                        child: SvgPicture.asset('assets/svg/google.svg')),

                  ],

                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
enum lang{en,ar}