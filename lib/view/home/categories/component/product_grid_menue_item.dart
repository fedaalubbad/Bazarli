import 'package:bazarli/ViewModel/Product_provider.dart';
import 'package:bazarli/ViewModel/orders_provider.dart';
import 'package:bazarli/ViewModel/wishlist_provider.dart';
import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/constants/MyStyles.dart';
import 'package:bazarli/models/product_model/product_response.dart' as productResponse;
import 'package:bazarli/view/home/Home/component/star_rating.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';
class ProductGridMenuItem extends StatelessWidget{
  productResponse.Datum product;
  int index;
  ProductGridMenuItem(this.product,this.index);
  @override
  Widget build(BuildContext context) {
    return Container(
      child:Container(
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
        margin: EdgeInsets.symmetric(horizontal: 6.w,vertical: 5.h),
        child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(ScreenUtil().radius(10)),

                child: Container(
                  width: double.infinity,
                  height:(0.40.sh),
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

                ),
              ),

              Container(
                // height:200.h,
                // width: ScreenUtil.defaultSize.width/2,
                margin:
                context.locale.toString()=='en'?
                EdgeInsets.only(top: 10.h,left: 10.w)
                    : EdgeInsets.only(top: 10.h,right: 10.w)
                ,
                child: Row(
                  children: [
                    product.superAttributes.length<3?SizedBox():
                    Container(
                        height: 60.h,
                        width: 0.17.sw,
                        child: Image.network(
                          Provider.of<ProductProvider>(
                            context,).getBrand(product,index),
                          fit: BoxFit.fill,)
                    ),
                    SizedBox(width: 5.w,),
                    Container(
                      width: 0.5.sw,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(product.name==null?'':product.name,style:TabsTextStyle,maxLines: 1,),
                          SizedBox(width: 10.h,),
                          Text(product.formatedPrice,style:PriceTextStyle,),
                          SizedBox(height: 6.h,),
                          StarRating(rating: 4,size: ScreenUtil().radius(20),),
                        ],
                      ),
                    ),
                  ],
                ),

              ),


              Container(
                margin:
                context.locale.toString()=='en'?
                EdgeInsets.only(left: 30.w,top: 30.h,bottom: 15.h)
                    : EdgeInsets.only(right: 30.w,top: 30.h,bottom: 15.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,

                  children: [
                    InkWell(
                        onTap:(){
                          Provider.of<WishListProvider>(context, listen: false).addToWishList(context,product.id);
                        },
                        child: SvgPicture.asset('assets/svg/fav.svg')),

                    SizedBox(width: 20.w,),

                    InkWell(
                        onTap:(){
                          Provider.of<OrdersProvider>(context, listen: false).addProductToCart(context,product.variants[0].id.toString(),1);
                        },
                        child: SvgPicture.asset('assets/svg/fi_shopping-cart.svg',color: PrimaryColor,)),

                  ],
                ),

              )

            ]
        ),

      ),

    );
  }

}