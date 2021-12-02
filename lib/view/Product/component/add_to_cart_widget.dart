import 'package:bazarli/ViewModel/Product_provider.dart';
import 'package:bazarli/ViewModel/orders_provider.dart';
import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/constants/MyStyles.dart';
import 'package:bazarli/models/product_model/product_by_id_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

class AddToCartWidet extends StatelessWidget{
  Data product;
  AddToCartWidet(this.product);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil.defaultSize.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            child: Row(
              children: [
                Text(
                  'Quantity',
                  style: TextLabelStyle,
                ).tr(),
                SizedBox(width: 5.w,),
              if(product.variants[Provider.of<ProductProvider>(
                  context,
                ).selectedVarientIndex].quantity!=null)
                Text(
                 product.variants[Provider.of<ProductProvider>(
                   context,
                 ).selectedVarientIndex].quantity.toString(),
                  style: BottomBarTextStyle,
                ),
                SizedBox(width: 5.w,),
                if(product.variants[Provider.of<ProductProvider>(
                  context,
                ).selectedVarientIndex].quantity!=null)
                Text(
                 'Items',
                  style: BottomBarTextStyle,
                ).tr()
              ],
            ),
          ),
          SizedBox(height: 10.h,),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    height: 50.h,
                    width: 70.w,
                    padding: EdgeInsets.all(ScreenUtil().radius(2)),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(ScreenUtil().radius(2)),
                        border: Border.all(color: GrayLiteColor)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(Provider.of<ProductProvider>(
                                      context,
                                      ).quantity.toString()),
                        SizedBox(
                          width: 10.w,
                        ),
                        // Divider(color:GrayLiteColor,height: 31.h),
                        Container(
                          height: 31.h,
                          color: GrayLiteColor,
                          width: 0.5,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),

                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                                    child: Center(child: SvgPicture.asset('assets/svg/arrow_up.svg',fit: BoxFit.fill,)),
                              onTap: () {
                                Provider.of<ProductProvider>(
                                    context,listen: false
                                ).increaseQuantity();
                              },
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            InkWell(
                                  child: Center(child: SvgPicture.asset('assets/svg/arrow_down.svg',fit: BoxFit.fill,)),
                              onTap: () {
                                Provider.of<ProductProvider>(
                                    context,listen: false
                                ).decreaseQuantity();
                              },
                            )
                          ],
                        )
                      ],
                    )
                ),

                Container(
                  child: InkWell(
                      onTap: () {
                        Provider.of<OrdersProvider>(
                            context,listen: false
                        ).addProductToCart(context, product.variants[Provider.of<ProductProvider>(
                            context,listen: false).selectedVarientIndex].id.toString(), Provider.of<ProductProvider>(
                            context,listen: false
                        ).quantity);
                      },
                      child: Container(
                        // margin: EdgeInsets.symmetric(horizontal: 20.w),
                        alignment: Alignment.center,
                        height: 50.h,
                        width: 230.w,
                        decoration: BoxDecoration(
                            color: PrimaryColor,
                            borderRadius:
                            BorderRadius.circular(ScreenUtil().radius(2))),
                        child: Text(
                          'AddToCart',
                          style: SliderNextStyle,
                        ).tr(),
                      )),
                )
              ])
        ],
      ),
    );
  }

}