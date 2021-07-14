import 'package:bazarli/constants/MyStyles.dart';
import 'package:bazarli/providers/Product_provider.dart';
import 'package:bazarli/ui/home/cart/component/product_in_cart_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';
import '../tool_bar_widget.dart';

class OrdersScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ToolBar(
            name: 'Orders',
          ),
          Container(
            margin: EdgeInsets.only(top:127.h),

            child: SingleChildScrollView(
              child:  Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Text('SeeManagedCheckOrder',style: SliderTitle2Style,).tr()),
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Text('Ordered on Oct 10, 2021',style: SliderTitle2Style,)),
                    Container(
                      // height: ScreenUtil.defaultSize.height,
                      // height: 480.h,
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(), // <-- this will disable scroll
                        shrinkWrap: true,
                        itemCount: Provider.of<ProductProvider>(context,listen: false).productList.length,
                        itemBuilder: (context,index){
                          return
                            ProductInCartListItem(product:Provider.of<ProductProvider>(context,listen: false).productList[index],);
                        },

                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );

  }



}