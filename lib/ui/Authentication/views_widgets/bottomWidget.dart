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
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Checkbox(value: false, onChanged:(val){
                    val=!val;
            }),
            // SizedBox(width:10.w,),
            Container(
              width: ScreenUtil.defaultSize.width/1.25.w,
              child: RichText(
                text:TextSpan(text: 'By_processing'.tr(),
                  style:DescriptionStyle,
                  children: [
                    TextSpan(text: ' '),
                    TextSpan(text:'Terms_of_service'.tr(),
                        style:SignInTextStyle,
                        // recognizer: TapGestureRecognizer()
                        //   ..onTap =provider.switchMode
                    ),
                    TextSpan(text: ' '),
                    TextSpan(text:'And'.tr(),
                        style:DescriptionStyle,

                    ),
                    TextSpan(text: ' '),
                    TextSpan(text:'Privacy_Policy'.tr(),
                        style:SignInTextStyle,

                    ),


                  ],),
                textAlign: TextAlign.center,
              ),
            ),
          ],),
         SizedBox(
           height: 20.h,
         ),
        CustomLoginButton(),
         SizedBox(
           height: 20.h,
         ),
         Text('on_continue',
             style: OnContinueStyle).tr(),

         SizedBox(
           height: 5.h,
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