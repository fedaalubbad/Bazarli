import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/constants/MyStyles.dart';
import 'package:bazarli/navigation_service/navigation_service.dart';
import 'package:bazarli/view/about_us/about_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:easy_localization/easy_localization.dart';

class ExtraWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return Container(
     child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         Text("WeAlwaysHere",style: TextLabelStyle,).tr(),
         SizedBox(height:5.h,),
         Container(
             width: ScreenUtil.defaultSize.width.w/1.2.w,
             child: Text("ReachSupportChannels",style: DescriptionStyle,
             ).tr()
         ),
         SizedBox(height:20.h,),
         Row(
           // mainAxisAlignment: MainAxisAlignment.spaceBetween,
           // crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text("EmailSupport",style:TitlesInHome,).tr(),
                 SizedBox(height:5.h,),
                 Text("Bagisto@gmail.com",style:SliderTitle2Style,),

               ],
             ),
             SizedBox(width: 30.w,),
             Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text("PhoneSupport",style:TitlesInHome,).tr(),
                 SizedBox(height:5.h,),
                 Text("0123456789",style:SliderTitle2Style,),

               ],

             ),
           ],
         ),
         SizedBox(height: 56.h,),
//////////////////////////////////////////////////

         Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Container(
               width: ScreenUtil.defaultSize.width/2-40.w,

               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text("ShoppingCategories",style:TitlesInHome,).tr(),
                   SizedBox(height:15.h,),
                   Text("Women",style:SliderTitle2Style,).tr(),
                   SizedBox(height:15.h,),
                   Text("Men",style:SliderTitle2Style,).tr(),
                   SizedBox(height:15.h,),
                   Text("Baby",style:SliderTitle2Style,).tr(),
                   SizedBox(height:15.h,),
                   Text("Home&Living",style:SliderTitle2Style,).tr(),
                   SizedBox(height:15.h,),
                   Text("Electronics",style:SliderTitle2Style,).tr(),
                   SizedBox(height:15.h,),
                   Text("Sports",style:SliderTitle2Style,).tr(),
                   SizedBox(height:15.h,),
                   Text("GetToKnowUs",style:SliderTitle2Style,).tr(),

                 ],
               ),
             ),
             // SizedBox(width: 30.w,),

             Container(
               // width: ScreenUtil.defaultSize.width/2.w-40.w,
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text("GetToKnowUs",style:TitlesInHome,).tr(),
                   SizedBox(height:15.h,),
                   InkWell(onTap: (){
                     NavigationService.navigationService.navigateToWidget(AboutUsScreen());
                   },
                       child: Text("About Us",style:SliderTitle2Style,)),
                   SizedBox(height:15.h,),
                   Text("HowToOrder",style:SliderTitle2Style,).tr(),
                   SizedBox(height:15.h,),
                   Text("FAQ",style:SliderTitle2Style,).tr(),
                   SizedBox(height:15.h,),
                   Text("Careers",style:SliderTitle2Style,).tr(),
                   SizedBox(height:15.h,),
                   Row(
                     children: [
                       CircleAvatar(backgroundColor: WhiteColor,child: SvgPicture.asset('assets/svg/fi_instagram.svg'),),
                       SizedBox(width:5.w,),
                       CircleAvatar(backgroundColor: WhiteColor,child: SvgPicture.asset('assets/svg/fi_twitter.svg'),),
                       SizedBox(width:5.w,),
                       CircleAvatar(backgroundColor: WhiteColor,child: SvgPicture.asset('assets/svg/fi_facebook.svg'),),
                       SizedBox(width:5.w,),

                     ],
                   )
                 ],
               ),
             ),
           ],
         ),
         SizedBox(height:15.h,),
         Row(
           mainAxisAlignment: MainAxisAlignment.end,
           children: [
             SvgPicture.asset('assets/svg/bot_face.svg'),
           ],
         ),

         SizedBox(height:15.h,),

         Text("PrivacyPolicy",style:SliderTitle2Style,).tr(),
         SizedBox(height:15.h,),
         Text("PaymentPolicy",style:SliderTitle2Style,).tr(),
         SizedBox(height:15.h,),

         Row(
           children: [
             SvgPicture.asset('assets/svg/k_net.svg'),
             SizedBox(width:15.w,),
             SvgPicture.asset('assets/svg/visa2.svg'),
             SizedBox(width:15.w,),
             SvgPicture.asset('assets/svg/visa.svg'),
             SizedBox(width:15.w,),

           ],
         ),
         SizedBox(height:15.h,),
         Text("AllRightsReserved",style:SliderTitle2Style,).tr(),
         SizedBox(height:15.h,),

       ],
     ),
   );
  }

}