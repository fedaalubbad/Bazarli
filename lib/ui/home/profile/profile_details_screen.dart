import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/constants/MyStyles.dart';
import 'package:bazarli/navigation_service/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'change-password_screen.dart';
import 'component/profile_toolbar.dart';
import 'edit_profile_screen.dart';

class ProfileDetailsScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: Stack(
              children: [
                ProfileToolBar(),
                Container(
                  margin: EdgeInsets.only(top:ScreenUtil.defaultSize.height.h/4.h+20.h),
                   child:  Column(
                   children: [
                     buildProfileDetailsWidget(),
                     SizedBox(height: 20.h,),
                     changePasswordBtnWidget()
                   ],
                 ),
                )
              ]
          ),
        )
    );
  }
  buildProfileDetailsWidget(){
    return  Container(
        margin: EdgeInsets.symmetric(horizontal:2.w),
        width:double.infinity,
        padding: EdgeInsets.all(ScreenUtil().radius(25)),
        decoration: BoxDecoration(
          color: WhiteColor,
          borderRadius: BorderRadius.circular(ScreenUtil().radius(5)),
          boxShadow: [
            BoxShadow(
                color: ShadowColor,
                spreadRadius: 5,
                blurRadius: 7.0,
                offset: Offset(0.0, 8)),
          ],
          // border: Border.all(color:PrimaryColor)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Text(
                  'Profile',
                  style: TextLabelStyle,
                ).tr(),
                InkWell(
                  onTap: (){
                    NavigationService.navigationService.navigateToWidget(EditProfileScreen());

                  },
                  child: Text(
                    'Edit',
                    style:SignInTextStyle,
                  ).tr(),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              'ManageProfile',
              style: SliderTitle2Style,
            ).tr(),
            SizedBox(
              height:20.h,
            ),
            Text(
              'GeneralInformation',
              style: TitlesInHome,
            ).tr(),

            SizedBox(
              height:20.h,
            ),
            Row(
              children: [
                Text(
                  'FirstName',
                  style: DescriptionStyle,
                ).tr(),
                SizedBox(
                  width:10.w,
                ),
                Text(
                  'Ahmed ',
                  style:TabsTextStyle,
                ),
              ],
            ),

            SizedBox(
              height:20.h,
            ),

            Row(
              children: [
                Text(
                  'LastName',
                  style: DescriptionStyle,
                ).tr(),
                SizedBox(
                  width:10.w,
                ),
                Text(
                  'Hassun',
                  style:TabsTextStyle,
                ),
              ],
            ),


            SizedBox(
              height:20.h,
            ),
            Text(
              'PreferredLanguage',
              style:DescriptionStyle,
            ).tr(),
            SizedBox(
              height:20.h,
            ),
            Row(
              children: [
                SvgPicture.asset('assets/svg/en.svg',width: 14.w,height: 14.h,),
                SizedBox(
                  width:5.w,
                ),
                Text(
                  'English',
                  style: TabsTextStyle,
                ).tr(),

              ],
            )

          ],
        )
    );
  }
  changePasswordBtnWidget(){
    return InkWell(
        onTap: (){
          NavigationService.navigationService.navigateToWidget(ChangePasswordScreen());
        },
        child: Container(
          // margin: EdgeInsets.symmetric(horizontal: 20.w),
          alignment: Alignment.center,
          height: 45.h,
          width:ScreenUtil.defaultSize.width,
          decoration: BoxDecoration(
              color: PrimaryColor,
              borderRadius:
              BorderRadius.circular(ScreenUtil().radius(5))),
          child: Text(
            'ChangePassword',
            style: SliderNextStyle,
          ).tr(),
        ),
    );
  }
}