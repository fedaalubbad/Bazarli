import 'package:bazarli/ViewModel/orders_provider.dart';
import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/constants/MyStyles.dart';
import 'package:bazarli/models/cart_model/get_orders_response.dart'
    as orderResponse;
import 'package:bazarli/navigation_service/navigation_service.dart';
import 'package:bazarli/view/home/cart/component/product_in_cart_list_item.dart';
import 'package:bazarli/view/home/profile/component/order_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../tool_bar_widget.dart';

class OrderScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return OrdersScreenState();
  }
}

class OrdersScreenState extends State<OrderScreen> {
  @override
  void initState() {
    Provider.of<OrdersProvider>(context, listen: false).getOrders('en');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(children: [
      ToolBar(
        name: 'Orders',
      ),
      Container(
        margin: EdgeInsets.only(top: 127.h),
        child: Selector<OrdersProvider, orderResponse.GetOrderResponse>(
            builder: (context, response, widget) {
          if (response == null) {
            return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    child: Center(
                        child: SvgPicture.asset(
                            'assets/svg/girl_shopping_with_cart.svg')),
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Text(
                        'Orders',
                        style: SliderTitle1Style,
                      ).tr()),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Text(
                        'SeeHowManagedCheckOrder',
                        style: SliderTitle2Style,
                        textAlign: TextAlign.center,
                      ).tr()),
                  SizedBox(
                    height: 20.h,
                  ),
                  // continueShoppingBtnWidget()
                ]);
          } else if (response.data.length == 0) {
            return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    child: Center(
                        child: SvgPicture.asset(
                            'assets/svg/girl_shopping_with_cart.svg')),
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Text(
                        'Orders',
                        style: SliderTitle1Style,
                      ).tr()),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Text(
                        'SeeHowManagedCheckOrder',
                        style: SliderTitle2Style,
                        textAlign: TextAlign.center,
                      ).tr()),
                  SizedBox(
                    height: 20.h,
                  ),
                  // continueShoppingBtnWidget()
                ]);
          } else {
            return Container(
              margin: EdgeInsets.only(bottom: 100),
              child: ListView.builder(
                itemCount: response.data.length,
                itemBuilder: (context, index) {
                  return OrderListItem(
                    order: response.data[index],
                    // onPressed:(){
                    //   // NavigationService.navigationService.navigateToWidget(ProductDetailsScreen(product:Provider.of<OrdersProvider>(context, listen: false).getCartResponse.data.items[index].product,));
                    //  },
                  );
                },
              ),
            );
          }
        }, selector: (context, provider) {
          return provider.getOrderResponse;
        }),
      ),
      Positioned(
          bottom: 0, left: 0, right: 0, child: continueShoppingBtnWidget())
    ])));
  }

  continueShoppingBtnWidget() {
    return InkWell(
      onTap: () {
        // NavigationService.navigationService.navigateToWidget(ReturnsEditScreen());
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        alignment: Alignment.center,
        height: 45.h,
        width: ScreenUtil.defaultSize.width,
        decoration: BoxDecoration(
            color: PrimaryColor,
            borderRadius: BorderRadius.circular(ScreenUtil().radius(5))),
        child: Text(
          'ContinueShopping',
          style: SliderNextStyle,
        ).tr(),
      ),
    );
  }
}
