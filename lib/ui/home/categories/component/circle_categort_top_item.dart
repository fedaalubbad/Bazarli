import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/constants/MyStyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircleTopCategoryItem extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Container(
     child: Column(
       crossAxisAlignment: CrossAxisAlignment.center,
       mainAxisAlignment: MainAxisAlignment.center,
       children: [
         CircleAvatar(backgroundColor: GrayColor,
           radius: ScreenUtil().radius(18),
            backgroundImage:NetworkImage('https://silkwayshop.com/wp-content/uploads/2020/01/Fashion-Accessories.jpg'),),
            Container(width: 90.w,
            child: Text('accessories',style:TabsTextStyle,)),
       ],
     ),
   ) ;
  }
  
}