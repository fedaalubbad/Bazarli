import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/constants/MyStyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

class ClimeItemWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil.defaultSize.width,
      decoration: BoxDecoration(
        color: WhiteColor,
      ),
      child: Column(
        children: [
          Container(
            // height:200.h,
            width: ScreenUtil.defaultSize.width,
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
                      backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBwgu1A5zgPSvfE83nurkuzNEoXs9DMNr8Ww&usqp=CAU')
                  ),
                ),
                SizedBox(width: 5.w,),
                Container(
                  // width: 0.55.sw,
                  child: Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text('Name',style:SliderTitle2Style,).tr(),
                            Text(':',style:SliderTitle2Style,),
                            SizedBox(width: 5.w,),
                            Text('Aisha Bukhamsin',style:TabsTextStyle,),
                          ],
                        ),
                        SizedBox(width: 10.h,),
                        Row(
                          children: [
                            Text('Date',style:SliderTitle2Style,).tr(),
                            Text(':',style:SliderTitle2Style,),
                            SizedBox(width: 5.w,),
                            Text('Wrote a review Mar 2020',style:TabsTextStyle,),
                          ],
                        ),
                        SizedBox(height: 5.h,),
                        Text('Do you have any problem?', style:TabsTextStyle,),
                        SizedBox(height: 15.h,),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Image.asset('assets/images/app_logo.png',width: 40.w,height:10.h,),
                            SizedBox(width: 10.w,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Bagisto's team",style:TitlesInHome,).tr(),
                                SizedBox(height: 10.h,),
                                Container(
                                  width:200.w,
                                  child: Text('Hello, lorem Ipsum is simply dummy text of the printing and typesettimg  industry thanks',
                                    style:TabsTextStyle,),
                                ),


                              ],)
                          ],
                        )

                      ],
                    ),
                  ),
                ),
              ],
            ),

          ),
          Divider()
        ],
      ),


    );
  }
  
}