import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/constants/MyStyles.dart';
import 'package:bazarli/models/Categories_model/categories_with_brands_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircleTopCategoryItem extends StatelessWidget{
  Category category;
  CircleTopCategoryItem(this.category);
  @override
  Widget build(BuildContext context) {
   return Container(
     width:70.w,
     child: Column(
       crossAxisAlignment: CrossAxisAlignment.center,
       mainAxisAlignment: MainAxisAlignment.center,
       children: [
         CircleAvatar(backgroundColor: GrayColor,
           radius: ScreenUtil().radius(20),
            backgroundImage:NetworkImage('https://test.bazarli.com/storage/'+category.image),),
            Container(
            child: Text(category.name,style:BottomBarTextStyle,maxLines: 1,)),
       ],
     ),
   ) ;
  }
  
}