import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/constants/MyStyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

import 'overview_carousel_slider.dart';

class CustomerReviewWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
    child: Column(
    children:[
      overViewButtonWidget(context),
       SizedBox(height: 20.h,),
       Container(
         // height: 240.h,
        child: BuildOverViewCarouselSlider(currentIndex: 0,)
          )
        ]
    ),
    );
  }

  overViewButtonWidget(BuildContext context){
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 20.w),
      alignment: Alignment.center,
      height: 45.h,
      width: ScreenUtil.defaultSize.width,
      decoration: BoxDecoration(
          color: PrimaryColor,
          borderRadius:
          BorderRadius.circular(ScreenUtil().radius(5))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin:context.locale.toString()=='en'? EdgeInsets.only(left: 2):EdgeInsets.only(right: 2),
            height: 40.h,
            width: 0.4.sw,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color:HomeBackgroundColor,
                borderRadius:
                BorderRadius.circular(ScreenUtil().radius(5))),
            child: Text(
              'Overview', style: TabsTextStyle,).tr(),
          ),
          SizedBox(width:20.w),
          Container(
            width: 0.4.sw,
            alignment: Alignment.center,
            child: Text('CustomerReview',style: WhiteButtonStyle,).tr(),
          )
        ],
      ),

    );
  }
}