import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/constants/MyStyles.dart';
import 'package:bazarli/models/cart_model/get_orders_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
class OrderListItem extends StatelessWidget{
  Datum item;
  Function onPressed;
  OrderListItem({this.item});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        child: Stack(
          children: [
            Container(
              height: ScreenUtil.defaultSize.height.h/5.h,
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                          Container(
                            margin: context.locale.toString()=='en'?EdgeInsets.only(top:10.h,left:5.w,):EdgeInsets.only(top:10.h,right:5.w,),
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  child: Container(
                                      width:0.45.sw,
                                      child: Text(item.status,
                                        style:TabsTextStyle,
                                        maxLines:2,overflow: TextOverflow.ellipsis,)
                                  ),
                                ),
                                SizedBox(height: 5.h,),
                                Flexible(
                                  child: Container(
                                      width:0.55.sw,
                                      child: Text(item.grandTotal,
                                        style:PriceTextStyle,
                                        overflow: TextOverflow.ellipsis,
                                      )),
                                ),
                                SizedBox(height: 6.h,),


                              ],
                            ),
                          ),



                    ]

                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}