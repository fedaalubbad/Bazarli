import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/constants/MyStyles.dart';
import 'package:bazarli/models/product_model/product_response.dart' as productResponse;
import 'package:bazarli/view/home/Home/component/star_rating.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ProductListMenuItem extends StatelessWidget{
  productResponse.Datum product;
  ProductListMenuItem({this.product,});
  @override
  Widget build(BuildContext context) {
   return Container(
     // height: 100.h,
     margin: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
     decoration: BoxDecoration(
       boxShadow: [
         BoxShadow(
             color: ShadowColor,
             // spreadRadius: 5,
             blurRadius: 7.0,
             offset: Offset(0.0, 8)
         ),
       ],
       color: WhiteColor,
       borderRadius: BorderRadius.circular(ScreenUtil().radius(10)),),
     child: Container(
       child: Row(
         // mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.center,
           children:[
         ClipRRect(
         borderRadius: BorderRadius.circular(ScreenUtil().radius(10)),
            child: Container(
              height:118.h,
              width: 70.w,
              decoration: BoxDecoration(
                // borderRadius: BorderRadius.circular(ScreenUtil().radius(10)),
                image: DecorationImage(
                  // colorFilter: ColorFilter.mode(
                  //     MyColors.blackColor.withOpacity(0.3), BlendMode.darken),
                  fit: BoxFit.cover,
                  image: NetworkImage(product.baseImage.mediumImageUrl),
                ),
              ),
             )
         ),

        Row(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(width: 40.w,height: 40.h,
                margin: EdgeInsets.only(left:2.w,),
                child: Image.network(product.baseImage.smallImageUrl)),


            Container(
              margin: EdgeInsets.only(left:5.w,),
              child: Column(
                 // mainAxisAlignment: MainAxisAlignment.center,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Container(width:200.w,
                       child: Text(product.shortDescription==null?'':product.shortDescription,style:TabsTextStyle,maxLines:2,)),
                   SizedBox(width: 10.h,),
                   Text(product.formatedPrice,style:PriceTextStyle,),
                   SizedBox(height: 6.h,),

                   Row(
                     // crossAxisAlignment: CrossAxisAlignment.stretch,
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       StarRating(rating: 3.5,size: ScreenUtil().radius(15),),
                         Container(
                           child: Row(
                             mainAxisSize: MainAxisSize.min,
                             // crossAxisAlignment: CrossAxisAlignment.end,
                             mainAxisAlignment: MainAxisAlignment.end,
                             children: [
                               SizedBox(width: 40.w,),
                               SvgPicture.asset('assets/svg/fav.svg'),
                               SizedBox(width: 10.w,),
                               SvgPicture.asset('assets/svg/fi_shopping-cart.svg',color: PrimaryColor,),
                             ],

                       ),
                         )
                     ],
                   ),
                 ],
               ),
            ),
          ],
        ),


         ]

       ),
     ),
   );
  }

}