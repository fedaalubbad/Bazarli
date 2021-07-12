import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/constants/MyStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../tool_bar_widget.dart';
import 'package:easy_localization/easy_localization.dart';
class ReturnsScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HomeBackgroundColor,
        body: Stack(
            children: [
              ToolBar(
                name: 'Returns',
              ),
              Container(
                width:double.infinity,
                margin: EdgeInsets.only(top:127.h),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   SizedBox(height: 10.h,),
                   SvgPicture.asset('assets/svg/returns.svg'),
                   SizedBox(height: 20.h,),
                   Text("We don't see any returns requested",style:TitlesInHome ,),
                   SizedBox(height: 10.h,),
                   Container(alignment: Alignment.center,
                       width: ScreenUtil.defaultSize.width/1.2,
                       child: Text("Need to submit a request? Just click on the button below!",
                         style:SliderTitle2Style ,textAlign: TextAlign.center,)
                   ),
                   SizedBox(height: 10.h,),
                   requestBtnWidget(),

                 ],
               ),
              )
            ]
        )
    );
  }
  requestBtnWidget(){
    return Positioned(
      bottom:10,
      left: 20,
      right: 20,
      child: InkWell(
        onTap: (){
        },
        child: Container(
          // margin: EdgeInsets.symmetric(horizontal: 20.w),
          alignment: Alignment.center,
          height: 45.h,
          width:ScreenUtil.defaultSize.width,
          decoration: BoxDecoration(
              color: PrimaryColor,
              borderRadius:
              BorderRadius.circular(ScreenUtil().radius(5))),
          child: Text(
            'File a new return request',
            style: SliderNextStyle,
          ).tr(),
        ),
      ),
    );
  }
}