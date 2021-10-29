import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/constants/MyStyles.dart';
import 'package:bazarli/navigation_service/navigation_service.dart';
import 'package:bazarli/view/Product/all_products_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
class BuildHomeTitle extends StatelessWidget{
  String titleText;
  String buttonText;
  Function onpressed;
  BuildHomeTitle({this.titleText, this.buttonText,this.onpressed});
  @override
  Widget build(BuildContext context) {
   return Container(
     padding: EdgeInsets.symmetric(horizontal: 20.w),
     child: Row(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: [
         Text(titleText,style: TitlesInHome).tr(),

    if(buttonText!=null)
     Container(

           child:  InkWell(
           onTap:onpressed,
             child: Container(
               alignment: Alignment.center,
               width: 158.w,
               height: 45.h,
               decoration: BoxDecoration(
                   color: PrimaryColor,
                   borderRadius: BorderRadius.circular(ScreenUtil().radius(5))),

               child: Text(buttonText, style:SliderNextStyle,
               ).tr(),
             ),
           )

       )

       ],
     ),

   );
  }

}