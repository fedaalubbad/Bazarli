import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/constants/MyStyles.dart';
import 'package:bazarli/models/wish_list_model/wishlist.dart';
import 'package:bazarli/providers/wishlist_provider.dart';
import 'package:bazarli/ui/home/cart/component/product_in_cart_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_placeholder_textlines/placeholder_lines.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';
import '../tool_bar_widget.dart';

class WishListScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // Provider.of<WishListProvider>(context, listen: false).getCustomerWishList();
    return Scaffold(
      backgroundColor: HomeBackgroundColor,
      body: Container(
        height: ScreenUtil.defaultSize.height.h,
        width: ScreenUtil.defaultSize.width.w,
        child: Stack(
          children: [
            ToolBar(
              name: 'WishList',
            ),
            getWishList(context),
            checkOutBtnWidget()
          ],
        ),
      ),
    );

  }
  getWishList(BuildContext context){
    return FutureBuilder<List<WishList>>(
        future: Provider.of<WishListProvider>(context, listen: false).getCustomerWishList(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              child: Container(
                padding: EdgeInsets.only(top:117.h,bottom:60.h),
                child: ListView.builder(
                  // physics: NeverScrollableScrollPhysics(), // <-- this will disable scroll
                  shrinkWrap: true,
                  itemCount: snapshot.data.length,
                  itemBuilder: (context,index){
                    return
                      ProductInCartListItem(wishList:snapshot.data[index],);
                  },

                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Container(
              child: Container(
                padding: EdgeInsets.only(top:117.h,bottom:60.h),
                child: ListView.builder(
                  // physics: NeverScrollableScrollPhysics(), // <-- this will disable scroll
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context,index){
                    return _buildCardPlaceholder();
                  },

                ),
              ),
            );
          }

          // By default, show a loading spinner. placeholder view
          return Container(
            child: Container(
              padding: EdgeInsets.only(top:117.h,bottom:60.h),
              child: ListView.builder(
                // physics: NeverScrollableScrollPhysics(), // <-- this will disable scroll
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context,index){
                  return _buildCardPlaceholder();
                },

              ),
            ),
          );
        },
    );
  }
  checkOutBtnWidget(){
    return Positioned(
      bottom:10.h,
      left: 20.w,
      right: 20.w,
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
  _buildCardPlaceholder() {
    return Container(
      color: WhiteColor,
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
        width: 300.w,
        child: Row(
          children: <Widget>[
            Container(
              width: 0.2.sw,
              child:
              Center(
                child: Icon(
                  Icons.photo_rounded,
                  color: CurveColor,
                  size:100,
                ),
              ),
            ),
            SizedBox(
              width: 25.w,
            ),
            Container(
              width: 0.5.sw,
              // child:Expanded(
              child: PlaceholderLines(
                count: 3,
                animate: true,
                color: PrimaryColor.withOpacity(0.3),
              ),
              // ),
            ),
          ],
        ),
    );
  }
}