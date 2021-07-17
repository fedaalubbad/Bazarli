import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/constants/MyStyles.dart';
import 'package:bazarli/constants/heights.dart';
import 'package:bazarli/navigation_service/navigation_service.dart';
import 'package:bazarli/providers/authentication_provider.dart';
import 'package:bazarli/ui/Authentication/compnnent/background_image_clipper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';
import '../loginAndRegister.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
class SignScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HomeBackgroundColor,
      body: Stack(
        children: [
          ClipPath(
          clipper: WaveClipperTwo(),
           child: Container(
             color: WhiteColor,
           height: ScreenUtil.defaultSize.height/1.2,
           ),
          ),

          Container(
            // color: WhiteColor,
            height: double.infinity,
            width:  double.infinity,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin:EdgeInsets.only(top: 36.h,left: 20.w,right: 20.w),
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
                    margin: EdgeInsets.only(top: 37.h),
                    child: Text('Welcome_to_Bagisto',
                      style: SliderTitle1Style,
                    ).tr(),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10.h),
                    child: Text('small_description',
                      style:SliderTitle2Style,
                    ).tr(),
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
                        width:ScreenUtil.defaultSize.width,
                        decoration: BoxDecoration(
                            color: PrimaryColor,
                            borderRadius: BorderRadius.circular(ScreenUtil().radius(5))),
                        child: Text('SignIn',
                          style:  SliderNextStyle,
                        ).tr(),
                      )),
                     InkWell(
                      onTap: () {
                        MaterialPageRoute(builder: (context) =>LoginPage(),
                        );
                      // NavigationService.navigationService.navigateAndReplaceWidget(LoginPage());
                          return LoginPage();

                      },
                      child: Container(
                        margin: EdgeInsets.only(left:kDefaultPaddin,right: kDefaultPaddin,top: 5.h),
                        alignment: Alignment.center,
                        height: 45.h,
                        width: ScreenUtil.defaultSize.width,
                        decoration: BoxDecoration(
                            color: PrimaryColor,
                            borderRadius: BorderRadius.circular(ScreenUtil().radius(5))),
                        child: Text('SignUp',
                          style: SliderNextStyle,
                        ).tr(),
                      )),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text('on_continue',
                      style: OnContinueStyle
                  ).tr(),

                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    width: ScreenUtil.defaultSize.width,
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
        ],
      ),
    );
  }
}
enum lang{en,ar}