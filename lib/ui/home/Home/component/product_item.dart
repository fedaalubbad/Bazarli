import 'dart:ui';

import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/constants/MyStyles.dart';
import 'package:bazarli/models/product_model/product_classes/Data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductItem extends StatelessWidget{
  Data product;
  ProductItem({this.product});
  @override
  Widget build(BuildContext context) {
   return Container(
     // margin: EdgeInsets.all(10),
     child: Stack(
       children: [
         ClipRRect(
           borderRadius: BorderRadius.circular(ScreenUtil().radius(10)),
           child: Container(
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(ScreenUtil().radius(10)),
               image: DecorationImage(
                 // colorFilter: ColorFilter.mode(
                 //     MyColors.blackColor.withOpacity(0.3), BlendMode.darken),
                 fit: BoxFit.cover,
                 image: NetworkImage(product.baseImage.originalImageUrl),
               ),
             ),
             // margin: EdgeInsets.symmetric(horizontal: 5),
             width: double.infinity,
           ),
         ),
      Positioned(
        bottom: 0,
        child: Container(
          // height: 77.h,
        padding: EdgeInsets.all(ScreenUtil().radius(10)),
        decoration: BoxDecoration(
          // color: WhiteColor.withOpacity(0.3),
          // borderRadius: BorderRadius.circular(ScreenUtil().radius(10)),
    gradient: LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: GradientColors)
        ),
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(width:0.5.sw,
                  child: Text(product.name,style:TitlesInHome,)),
              Container(width:0.5.sw,
                  child: Text(product.formatedPrice,style:SliderTitle2Style,)),
            ],
          ),
        ),
      )
       ],
     ),
   );
  }

}