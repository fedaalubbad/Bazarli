import 'package:bazarli/constants/MyStyles.dart';
import 'package:bazarli/ui/Authentication/widgets/custom_login_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class LoginBottomWidget extends StatelessWidget{
  LoginBottomWidget();
  @override
  Widget build(BuildContext context) {
   return Container(
     margin: EdgeInsets.only(top:15.h),
     child: Column(
       children: [
         SizedBox(
           height: 20.h,
         ),
         Text('on_continue',
             style: OnContinueStyle).tr(),
        CustomLoginButton(),
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