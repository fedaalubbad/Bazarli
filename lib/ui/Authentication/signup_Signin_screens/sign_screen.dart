import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/constants/MyStyles.dart';
import 'package:bazarli/constants/heights.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class SignScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width:  double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin:EdgeInsets.only(top: 35,left: 20,right: 20) ,
                height:50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(width:130,
                        height:36,
                        child:Image.asset("assets/images/app_logo.png")),

                    Container(
                      width:100,
                      height: 45,
                      decoration: BoxDecoration(),
                      child: DropdownButton<String>(
                        underline: SizedBox(),
                        items: <String>['en', 'ar',].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Row(
                              children: [
                                Container(
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(value=='ar'?"assets/svg/ar.svg":"assets/svg/en.svg"),
                                        SizedBox(width: 4,),
                                        Text(value)
                                      ],
                                    )),
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
                margin: EdgeInsets.only(top: 37),
                child: Text(
                  translator.translate('Welcome_to_Bagisto'),
                  style: translator.currentLanguage == 'ar'
                      ? GoogleFonts.tajawal(textStyle: SliderTitle1Style)
                      : GoogleFonts.poppins(textStyle: SliderTitle1Style),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  translator.translate('small_description'),
                  style: translator.currentLanguage == 'ar'
                      ? GoogleFonts.tajawal(textStyle: SliderTitle2Style)
                      : GoogleFonts.poppins(textStyle: SliderTitle2Style),
                ),
              ),

              SvgPicture.asset(
                'assets/svg/SignImage.svg',
                // width: width * 0.6,
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.only(left:kDefaultPaddin,right: kDefaultPaddin,top: 50),
                    alignment: Alignment.center,
                    height: 45,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: PrimaryColor,
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      translator.translate('Next'),
                      style: translator.currentLanguage == 'ar'
                          ? GoogleFonts.tajawal(textStyle: SliderNextStyle)
                          : GoogleFonts.poppins(textStyle: SliderNextStyle),
                    ),
                  )),
                 InkWell(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.only(left:kDefaultPaddin,right: kDefaultPaddin,top: 5),
                    alignment: Alignment.center,
                    height: 45,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: PrimaryColor,
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      translator.translate('Sign up'),
                      style: translator.currentLanguage == 'ar'
                          ? GoogleFonts.tajawal(textStyle: SliderNextStyle)
                          : GoogleFonts.poppins(textStyle: SliderNextStyle),
                    ),
                  )),
              SizedBox(
                height: 5,
              ),
              Text(
                  translator.translate('on_continue'),
                  style: translator.currentLanguage == 'ar'
                      ? GoogleFonts.tajawal(textStyle: OnContinueStyle):GoogleFonts.poppins(textStyle: OnContinueStyle)),


              InkWell(
               onTap: (){},
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(top: 10,bottom: 50),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    SvgPicture.asset('assets/svg/facebook.svg'),
                    SizedBox(width: 20,),
                    SvgPicture.asset('assets/svg/google.svg'),

                    ],
                  ),
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