import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/constants/MyStyles.dart';
import 'package:bazarli/constants/heights.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class LoginBottomWidget extends StatelessWidget{
  LoginBottomWidget();
  @override
  Widget build(BuildContext context) {
   return Container(
     margin: EdgeInsets.only(top:15),
     child: Column(
       children: [
         InkWell(
             onTap: () {},
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
                 ? GoogleFonts.tajawal(textStyle: OnContinueStyle)
                 : GoogleFonts.poppins(textStyle: OnContinueStyle)),

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
                     onTap: (){},
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
   );
  }

}