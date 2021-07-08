import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/constants/MyStyles.dart';
import 'package:bazarli/constants/heights.dart';
import 'package:bazarli/navigation_service/navigation_service.dart';
import 'package:bazarli/ui/home/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CustomLoginButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          NavigationService.navigationService.navigateToWidget(HomeScreen());
        },
        child: Container(
          margin: EdgeInsets.only(
              left: kDefaultPaddin, right: kDefaultPaddin, top: 5.h),
          alignment: Alignment.center,
          height: 45.h,
          width: MediaQuery
              .of(context)
              .size
              .width,
          decoration: BoxDecoration(
              color: PrimaryColor,
              borderRadius: BorderRadius.circular(ScreenUtil().radius(5))),

          child: Text(
            translator.translate('SignUp'),
            style: translator.currentLanguage == 'ar'
                ? GoogleFonts.tajawal(textStyle: SliderNextStyle)
                : GoogleFonts.poppins(textStyle: SliderNextStyle),
          ),
        )

    );
  }
}
