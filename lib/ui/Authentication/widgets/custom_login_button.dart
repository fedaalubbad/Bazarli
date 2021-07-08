import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/constants/MyStyles.dart';
import 'package:bazarli/constants/heights.dart';
import 'package:bazarli/navigation_service/navigation_service.dart';
import 'package:bazarli/ui/home/home_main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
class CustomLoginButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
          onTap: () {
NavigationService.navigationService.navigateToWidget(HomeMainScreen())  ;
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

            child: Text('SignUp',
              style:SliderNextStyle,
            ).tr(),
          )

      ),
    );
  }
}
