import 'dart:ui';
import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/constants/MyStyles.dart';
import 'package:bazarli/models/product_model/product_response.dart' as productResponse;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductShopItem extends StatelessWidget{
  productResponse.Datum product;
  ProductShopItem({this.product});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      // margin: EdgeInsets.all(10),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(ScreenUtil().radius(10)),
            child: Container(
              height: 70.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(ScreenUtil().radius(10)),
                image: DecorationImage(
                  // colorFilter: ColorFilter.mode(
                  //     MyColors.blackColor.withOpacity(0.3), BlendMode.darken),
                  fit: BoxFit.cover,
                  image: NetworkImage('https://cdn.shopify.com/s/files/1/0089/3989/6947/files/header-2.3_2e9bf8b4-a065-4aea-9beb-c6913d0344b9_800x.jpg?v=1618672152'),
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
              padding: EdgeInsets.all(ScreenUtil().radius(5)),
              decoration: BoxDecoration(
                color: PrimaryColor,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(ScreenUtil().radius(10)),
                      bottomLeft:Radius.circular(ScreenUtil().radius(10))),
                  // gradient: LinearGradient(
                  //     begin: Alignment.centerLeft,
                  //     end: Alignment.centerRight,
                  //     colors: GradientColors)
              ),
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(width:0.5.sw,
                      child: Text('Shop Now',style:SliderNextStyle,)),

                ],
              ),
            ),
          )
        ],
      ),
    );
  }

}