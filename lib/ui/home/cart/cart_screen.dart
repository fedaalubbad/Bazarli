import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/constants/MyStyles.dart';
import 'package:bazarli/navigation_service/navigation_service.dart';
import 'package:bazarli/providers/Product_provider.dart';
import 'package:bazarli/ui/home/cart/shipping_addresses_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'component/product_in_cart_list_item.dart';
class CartScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return CartScreenState();
  }
}
class CartScreenState extends State<CartScreen> with AutomaticKeepAliveClientMixin {
@override
bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            height: 500.h,
            child: Container(
              padding: EdgeInsets.only(bottom:60.h),
              // height: 480.h,
                child: ListView.builder(
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
      bottom:20.h,
      left: 20.w,
      right: 20.w,
      child: InkWell(
        onTap: (){
          NavigationService.navigationService.navigateToWidget(ShippingAdressScreen());
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
            'Checkout',
            style: SliderNextStyle,
          ).tr(),
        ),
      ),
    );
  }

}