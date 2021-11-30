import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/constants/MyStyles.dart';
import 'package:bazarli/models/cart_model/get_orders_response.dart'
    as ordersResponse;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

class OrderListItem extends StatelessWidget {
  ordersResponse.Datum order;
  Function onPressed;

  OrderListItem({this.order});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: ScreenUtil.defaultSize.height.h / 2.7.h,
        margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: ShadowColor,
                // spreadRadius: 5,
                blurRadius: 7.0,
                offset: Offset(0.0, 8)),
          ],
          color: WhiteColor,
          borderRadius: BorderRadius.circular(ScreenUtil().radius(10)),
        ),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),

          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                Container(
                    child: Text(
                  'status:',
                  style: TableTextlStyle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                )),
                SizedBox(
                  width: 5.h,
                ),
                Container(
                    child: Text(
                      order.status,
                      style:ErrorRedTextlStyle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    )),
              ]),
              SizedBox(
                height: 5.h,
              ),
           Row(
          children: [
            Container(
          child: Text(
            'GrandTotal:',
            style: TableTextlStyle,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          )),
           SizedBox(
          width: 5.h,
           ),Container(
                  child: Text(
                    order.formatedGrandTotal,
                    style:SignInTextStyle,
                    overflow: TextOverflow.ellipsis,
                  )),
              ]),
              SizedBox(
                height: 6.h,
              ),
              Container(
                height: ScreenUtil.defaultSize.height.h / 4.2.h,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: order.items.length,
                    itemBuilder: (context, index) {
                      ordersResponse.Item item = order.items[index];

                      return Container(
                          child: Column(children: [
                        if (item.product.images != null)
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            height: 100,
                            width: 100,
                            child: Image.network(
                                item.product.images[0].mediumImageUrl),
                          ),
                        if (item.product.images == null)
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            height: 100,
                            width: 100,
                            child: Image.asset(
                               'assets/images/app_logo.png'),
                          ),
                        if(item.product.name!=null)
                        Container(
                          width: 100,
                          child: Text(
                            item.product.name,
                            maxLines: 1,
                          ),
                        ),
                        Container(
                          width: 100,
                          child:Row(children:[
                            Text(
                              'quantity: ',
                              style: QTYStyle,
                              maxLines: 1,
                            ),
                            Text(
                              item.qtyOrdered.toString(),
                              maxLines: 1,
                            ),
                          ])
                        )
                      ]));
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
