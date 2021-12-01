import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/constants/MyStyles.dart';
import 'package:bazarli/models/wish_list_model/wishlist.dart';
import 'package:bazarli/ViewModel/wishlist_provider.dart';
import 'package:bazarli/navigation_service/navigation_service.dart';
import 'package:bazarli/view/Product/product_details_screen.dart';
import 'package:bazarli/view/home/cart/component/product_in_cart_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_placeholder_textlines/placeholder_lines.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';
import '../tool_bar_widget.dart';
class WishListScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return WishListScreenState();
  }

}
class WishListScreenState extends State<WishListScreen>{

  @override
  void initState() {
    Provider.of<WishListProvider>(context, listen: false).getCustomerWishList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HomeBackgroundColor,
      body:SafeArea(
        child: Container(
        height: ScreenUtil.defaultSize.height.h,
        width: ScreenUtil.defaultSize.width.w,
        child: Stack(
          children: [
            ToolBar(
              name: 'WishList',
            ),
            getWishList(context),
            checkOutBtnWidget(context)
          ],
        ),
      ),
      ));

  }

  getWishList(context){
    return Selector<WishListProvider,WishlistResponse>(
        builder: (context, response, widget) {
      if (response == null) {
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
      }else if(response.data.length==0){
        return Container();
      }else{
        return Container(
          child: Container(
            padding: EdgeInsets.only(top:117.h,bottom:60.h),
            child: ListView.builder(
              // physics: NeverScrollableScrollPhysics(), // <-- this will disable scroll
              shrinkWrap: true,
              itemCount: response.data.length,
              itemBuilder: (context,index){
                return
                  ProductInCartListItem(wishList:response.data[index],
                    onPressed: () {
                      NavigationService.navigationService
                          .navigateToWidget(ProductDetailsScreen(
                        id:response.data[index].product.id
                      ));
                    },);
              },

            ),
          ),
        );
      }
        }, selector: (context, provider) {
      return provider.wishList;
    });
  }
  // getWishList(BuildContext context){
  //   return FutureBuilder<List<WishData>>(
  //       future: Provider.of<WishListProvider>(context, listen: false).getCustomerWishList(),
  //       builder: (context, snapshot) {
  //         if (snapshot.hasData) {
  //           return Container(
  //             child: Container(
  //               padding: EdgeInsets.only(top:117.h,bottom:60.h),
  //               child: ListView.builder(
  //                 // physics: NeverScrollableScrollPhysics(), // <-- this will disable scroll
  //                 shrinkWrap: true,
  //                 itemCount: snapshot.data.length,
  //                 itemBuilder: (context,index){
  //                   return
  //                     ProductInCartListItem(wishList:snapshot.data[index],);
  //                 },
  //
  //               ),
  //             ),
  //           );
  //         } else if (snapshot.hasError) {
  //           return Container(
  //             child: Container(
  //               padding: EdgeInsets.only(top:117.h,bottom:60.h),
  //               child: ListView.builder(
  //                 // physics: NeverScrollableScrollPhysics(), // <-- this will disable scroll
  //                 shrinkWrap: true,
  //                 itemCount: 5,
  //                 itemBuilder: (context,index){
  //                   return _buildCardPlaceholder();
  //                 },
  //
  //               ),
  //             ),
  //           );
  //         }
  //
  //         // By default, show a loading spinner. placeholder view
  //         return Container(
  //           child: Container(
  //             padding: EdgeInsets.only(top:117.h,bottom:60.h),
  //             child: ListView.builder(
  //               // physics: NeverScrollableScrollPhysics(), // <-- this will disable scroll
  //               shrinkWrap: true,
  //               itemCount: 5,
  //               itemBuilder: (context,index){
  //                 return _buildCardPlaceholder();
  //               },
  //
  //             ),
  //           ),
  //         );
  //       },
  //   );
  // }
  checkOutBtnWidget(BuildContext context){
    return Positioned(
      bottom:10.h,
      left: 20.w,
      right: 20.w,
      child: InkWell(
        onTap: (){
          Navigator.of(context).pop();
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