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
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../home_main_screen.dart';
import 'component/product_in_cart_list_item.dart';

class CartScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CartScreenState();
  }
}

class CartScreenState extends State<CartScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

//////////refresh
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  GlobalKey _contentKey = GlobalKey();
  GlobalKey _refresherKey = GlobalKey();
  void _onRefresh() async {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => HomeMainScreen(selectedPageIndex:3)));
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));

    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    await Future.delayed(Duration(milliseconds: 1000));
    if (mounted) setState(() {});

    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      key: _refresherKey,
        enablePullDown: true,
        enablePullUp: true,
        header: WaterDropHeader(),
        footer: CustomFooter(
          builder: (BuildContext context, LoadStatus mode) {
            Widget body;
            if (mode == LoadStatus.idle) {
              body = Text("pull up load");
            } else if (mode == LoadStatus.loading) {
              body = CupertinoActivityIndicator();
            } else if (mode == LoadStatus.failed) {
              body = Text("Load Failed!Click retry!");
            } else if (mode == LoadStatus.canLoading) {
              body = Text("release to load more");
            } else {
              body = Text("No more Data");
            }
            return Container(
              height: 55.h,
              child: Center(child: body),
            );
          },
        ),
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        physics: BouncingScrollPhysics(),
          child: Container(
            height: ScreenUtil.defaultSize.height.h-(ScreenUtil.defaultSize.height.h / 3.2.h),
            key: _contentKey,
            child: Stack(
              children: [
                    Container(
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics:NeverScrollableScrollPhysics(),
                      itemCount:
                          Provider.of<ProductProvider>(context, listen: false)
                              .productList
                              .length,
                      itemBuilder: (context, index) {
                        return ProductInCartListItem(
                          product:
                              Provider.of<ProductProvider>(context, listen: false)
                                  .productList[index],
                        );
                      },
                    ),
                  ),
                checkOutBtnWidget()
              ],
            ),
          ),

    );
  }

  checkOutBtnWidget() {
    return Positioned(
      bottom: 83.h,
      left: 20.w,
      right: 20.w,
      child: InkWell(
        onTap: () {
          NavigationService.navigationService
              .navigateToWidget(ShippingAdressScreen());
        },
        child: Container(
          // margin: EdgeInsets.symmetric(horizontal: 20.w),
          alignment: Alignment.center,
          height: 45.h,
          width: ScreenUtil.defaultSize.width,
          decoration: BoxDecoration(
              color: PrimaryColor,
              borderRadius: BorderRadius.circular(ScreenUtil().radius(5))),
          child: Text(
            'Checkout',
            style: SliderNextStyle,
          ).tr(),
        ),
      ),
    );
  }
}
