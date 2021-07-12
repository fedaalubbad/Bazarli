import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/constants/MyStyles.dart';
import 'package:bazarli/providers/Product_provider.dart';
import 'package:bazarli/ui/home/cart/component/product_in_cart_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';
import '../tool_bar_widget.dart';

class WishListScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HomeBackgroundColor,
      body: Stack(
        children: [
          ToolBar(
            name: 'WishList',
          ),
          Container(
            child: Container(
              padding: EdgeInsets.only(top:117.h,bottom:60.h),
              child: ListView.builder(
                // physics: NeverScrollableScrollPhysics(), // <-- this will disable scroll
                shrinkWrap: true,
                itemCount: Provider.of<ProductProvider>(context,listen: false).productList.length,
                itemBuilder: (context,index){
                  return
                    ProductInCartListItem(product:Provider.of<ProductProvider>(context,listen: false).productList[index],);
                },

              ),
            ),
          ),
          checkOutBtnWidget()
        ],
      ),
    );

  }

  checkOutBtnWidget(){
    return Positioned(
      bottom:10,
      left: 20,
      right: 20,
      child: InkWell(
        onTap: (){
        },
        child: Container(
          // margin: EdgeInsets.symmetric(horizontal: 20.w),
          alignment: Alignment.center,
          height: 45.h,
          width:ScreenUtil.defaultSize.width,
          decoration: BoxDecoration(
              color: PrimaryColor,
              borderRadius:
              BorderRadius.circular(ScreenUtil().radius(5))),
          child: Text(
            'Done',
            style: SliderNextStyle,
          ).tr(),
        ),
      ),
    );
  }

}