import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/constants/MyStyles.dart';
import 'package:bazarli/constants/heights.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class SignScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset('assets/svg/applogo.svg'),
              // DropdownButton(items: items)

            ],
          ),
          Text(
            translator.translate('Welcome_to_Bagisto'),
            style: translator.currentLanguage == 'ar'
                ? GoogleFonts.tajawal(textStyle: SliderTitle1Style)
                : GoogleFonts.poppins(textStyle: SliderTitle1Style),
          ),
          Text(
            translator.translate('small_description'),
            style: translator.currentLanguage == 'ar'
                ? GoogleFonts.tajawal(textStyle: SliderTitle1Style)
                : GoogleFonts.poppins(textStyle: SliderTitle1Style),
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
                margin: EdgeInsets.symmetric(horizontal: kDefaultPaddin),
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
          SizedBox(
            height: 5,
          ),
          InkWell(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: kDefaultPaddin),
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

          Row(
            children: [

            SvgPicture.asset('assets/svg/facebook.svg'),
            SvgPicture.asset('assets/svg/google.svg'),

            ],
          )
        ],
      ),
    );
  }
}
enum lang{en,ar}