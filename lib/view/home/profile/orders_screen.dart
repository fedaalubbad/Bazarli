import 'package:bazarli/ViewModel/orders_provider.dart';
import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/constants/MyStyles.dart';
import 'package:bazarli/models/cart_model/get_orders_response.dart';
import 'package:bazarli/navigation_service/navigation_service.dart';
import 'package:bazarli/view/home/cart/component/product_in_cart_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../tool_bar_widget.dart';
class OrderScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return OrdersScreenState();
  }
}
class OrdersScreenState extends State<OrderScreen>{
  @override
  void initState() {
    Provider.of<OrdersProvider>(context,listen: false).getOrders();
    super.initState();
  }
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
                    // Container(
                    //     margin: EdgeInsets.symmetric(horizontal: 20.w),
                    //     child: Text('SeeManagedCheckOrder',style: SliderTitle2Style,).tr()),
                    // Container(
                    //     margin: EdgeInsets.symmetric(horizontal: 20.w),
                    //     child: Text('Ordered on Oct 10, 2021',style: SliderTitle2Style,)),

                    Selector<OrdersProvider,GetOrderResponse>(
                        builder: (context, response, widget) {
                          if (response == null) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children:[
                                SizedBox(height: 20.h,),
                                Container(
                              child: Center(child: SvgPicture.asset('assets/svg/girl_shopping_with_cart.svg')),
                               ),
                                Container(
                                    margin: EdgeInsets.symmetric(horizontal: 20.w),
                                    child: Text('Orders',style: SliderTitle1Style,).tr()),
                                SizedBox(height: 10.h,),
                                Container(
                                    margin: EdgeInsets.symmetric(horizontal: 20.w),
                                    child: Text('SeeHowManagedCheckOrder',style:SliderTitle2Style,textAlign: TextAlign.center,).tr()),
                                SizedBox(height: 20.h,),
                                continueShoppingBtnWidget()
                              ]);
                          } else if (response.data.length == 0) {
                            return Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children:[
                                  SizedBox(height: 20.h,),
                                  Container(
                                    child: Center(child: SvgPicture.asset('assets/svg/girl_shopping_with_cart.svg')),
                                  ),
                                  Container(
                                      margin: EdgeInsets.symmetric(horizontal: 20.w),
                                      child: Text('Orders',style: SliderTitle1Style,).tr()),
                                  SizedBox(height: 10.h,),
                                  Container(
                                      margin: EdgeInsets.symmetric(horizontal: 20.w),
                                      child: Text('SeeHowManagedCheckOrder',style:SliderTitle2Style,textAlign: TextAlign.center,).tr()),
                                  SizedBox(height: 20.h,),
                                  continueShoppingBtnWidget()
                                ]);
                          } else {
                            return Container(
                              margin: EdgeInsets.only(bottom: 100),
                              child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                // physics:NeverScrollableScrollPhysics(),
                                itemCount:response.data.length,
                                itemBuilder: (context, index) {

                                  return ProductInCartListItem(
                                    item: response.data[index],
                                    onPressed:(){
                                      // NavigationService.navigationService.navigateToWidget(ProductDetailsScreen(product:Provider.of<OrdersProvider>(context, listen: false).getCartResponse.data.items[index].product,));
                                     },
                                  );
                                },
                              ),
                            );
                          }
                        }, selector: (context, provider) {
                      return provider.getOrderResponse;
                    }),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );

  }

  continueShoppingBtnWidget(){
    return InkWell(
      onTap: (){
        // NavigationService.navigationService.navigateToWidget(ReturnsEditScreen());
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
          'ContinueShopping',
          style: SliderNextStyle,
        ).tr(),
      ),

    );
  }

}