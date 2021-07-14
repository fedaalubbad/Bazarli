import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/constants/MyStyles.dart';
import 'package:bazarli/ui/home/Home/component/star_rating.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

class CustomerReviewListItem extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Container(
      decoration: BoxDecoration(
        color: WhiteColor,
        borderRadius: BorderRadius.circular(ScreenUtil().radius(10)),
        boxShadow: [
          BoxShadow(
              color: ShadowColor,
              // spreadRadius: 5,
              blurRadius: 7.0,
              offset: Offset(0.0, 8)
          ),
        ],
      ),
      margin: EdgeInsets.symmetric(horizontal: 6.w,vertical: 5),
           child: Container(
              // height:200.h,
              // width: ScreenUtil.defaultSize.width/2,
              margin: context.locale.toString()=='en'?
              EdgeInsets.only(top: 10.h,left: 10.w)
                  : EdgeInsets.only(top: 10.h,right: 10.w)
              ,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 0.15.sw,
                    child: CircleAvatar(
                        radius: ScreenUtil().radius(20),
                        backgroundImage: NetworkImage('https://images.inthestyle.com/c_fit,dpr_1.0,f_auto,q_auto,w_600,h_800/media/product/OBTOTST19895')
                    ),
                  ),
                  SizedBox(width: 5.w,),
                  Container(
                    width: 0.55.sw,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Mona James',style:TabsTextStyle,),
                          SizedBox(width: 10.h,),
                          Text('Accountant',style:SliderTitle2Style,),
                          SizedBox(height: 6.h,),
                          StarRating(rating: 3.5,size: ScreenUtil().radius(25),),
                          SizedBox(height: 10.h,),
                          Text('Short bio “Lorem Ipsum, Here we go!, Shift Career, \nGood Morning, one by one, good night, Good Morning, one by '
                              'oneShift Career, Good Morning, one by one, good night, \nGood Mo.. see Less',
                            style:SliderTitle2Style,),
                          SizedBox(height: 10.h,),

                        ],
                    ),
                  ),
                ],
              ),

            ),


    );
  }

}