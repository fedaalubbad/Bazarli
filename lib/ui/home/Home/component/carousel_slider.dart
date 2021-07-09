import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/constants/MyStyles.dart';
import 'package:bazarli/models/product_model/product_classes/Data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'cordinator_widget.dart';

class BuildCarouselSlider extends StatelessWidget{
  int currentIndex;
  List<Data> product;
  BuildCarouselSlider({this.product, this.currentIndex});
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: product.length,
      itemBuilder: (_, index, realIdx) {
        return Column(
          children: [
        // ClipRRect(
        // borderRadius: BorderRadius.only(bottomRight: Radius.circular(ScreenUtil().radius(10)),
        // topLeft: Radius.circular(ScreenUtil().radius(10))),
        // child:
            Container(
              // color: Colors.white,
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
              child: Column(
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
                      image: NetworkImage(product[index].baseImage.originalImageUrl),
                    ),

                  ),
                  // margin: EdgeInsets.symmetric(horizontal: 5),
                  width: double.infinity,
                  height:250.h,
                ),
              ),

               Container(
                // height:200.h,
                // width: ScreenUtil.defaultSize.width/2,
                margin: EdgeInsets.only(top: 10.h,left: 10),
                 child: Row(
                   children: [
                     Container(
                     height: 80.h,
                     width: 0.2.sw,
                     child: Image.network(product[index].baseImage.smallImageUrl)
                     ),
                     SizedBox(width: 5.w,),
                     Container(
                       width: 0.5.sw,
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text(product[index].name,style:TabsTextStyle,),
                           SizedBox(width: 10.h,),
                           Text(product[index].formatedPrice,style:PriceTextStyle,),
                              // Text(product[index].sku)

                         ],
                       ),
                     ),
                   ],
                 ),

                ),

              ]
              ),
            ),
            // ),
            Container(
              height: 20,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children:product
                        .map((e) => BuildCordinator(
                        currentIndex, product.indexOf(e)))
                        .toList()),
              ),

            ),
          ],
        );
      },
      options: CarouselOptions(
          height: 400.h,
          initialPage: 0,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 3000),
          autoPlayCurve: Curves.fastOutSlowIn,
          autoPlay: false,
          // aspectRatio: 16/9,
          viewportFraction: 0.9,
          scrollPhysics: AlwaysScrollableScrollPhysics(),
          // enableInfiniteScroll: true,
          scrollDirection: Axis.horizontal,
          enlargeCenterPage: false,
          onPageChanged: (index, _) {
            // setState(() {
              currentIndex = index;
            // });
          }),
    );
  }

}