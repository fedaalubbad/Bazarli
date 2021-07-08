import 'package:bazarli/constants/MyStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SliderPage extends StatelessWidget {
  String title;
  String description;
  String image;

  SliderPage({this.title, this.description,  this.image});

  @override
  Widget build(BuildContext context) {

    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset(
            image,
            // width: width * 0.6,
          ),
          SizedBox(height: 15.h),
          Text(
            title,
            style: translator.currentLanguage=='ar'?GoogleFonts.tajawal(textStyle: SliderTitle1Style):GoogleFonts.poppins(textStyle: SliderTitle1Style),
          ),
           SizedBox(height: 5.h),
            Text(
              description,
              style: translator.currentLanguage=='ar'?GoogleFonts.tajawal(textStyle: SliderTitle2Style):GoogleFonts.poppins(textStyle: SliderTitle2Style),
              textAlign: TextAlign.center,
            ),

        ],
      ),
    );
  }
}