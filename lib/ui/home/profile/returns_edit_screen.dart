import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/constants/MyStyles.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../tool_bar_widget.dart';
import 'component/return_edit_widget.dart';

class ReturnsEditScreen extends StatelessWidget{
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
    child: SingleChildScrollView(
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
      SizedBox(height: 20.h,),
      Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        child: Text("You have 14 days to make a refund request after your order has been delivered.",
          style:ErrorRedTextlStyle ,),
      ),
       ListView.builder(
           physics: NeverScrollableScrollPhysics(), // <-- this will disable scroll
           shrinkWrap: true,
         itemCount: 2,
           itemBuilder: (context,index){
          return ReturnEditWidget();
       }),

      ]
      ),
    )
    )]
    ));
  }

}