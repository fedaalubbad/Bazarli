import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/constants/MyStyles.dart';
import 'package:bazarli/constants/heights.dart';
import 'package:bazarli/ui/Authentication/widgets/custom_login_button.dart';
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
         SizedBox(
           height: 20.h,
         ),
         Text(
             translator.translate('on_continue'),
             style: translator.currentLanguage == 'ar'
                 ? GoogleFonts.tajawal(textStyle: OnContinueStyle)
                 : GoogleFonts.poppins(textStyle: OnContinueStyle)),
        CustomLoginButton(),
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