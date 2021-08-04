import 'package:bazarli/api_helper/orders_helper.dart';
import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/constants/MyStyles.dart';
import 'package:bazarli/models/cart_model/cartItem.dart';
import 'package:bazarli/models/wish_list_model/wishlist.dart';
import 'package:bazarli/providers/orders_provider.dart';
import 'package:bazarli/ui/home/Home/component/star_rating.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

class ProductInCartListItem extends StatelessWidget{
  CartItem item;
  WishList wishList;
  Function onPressed;
  ProductInCartListItem({this.item,this.wishList,this.onPressed});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed
      ,
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
                  // mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:[
                      ClipRRect(
                          borderRadius: BorderRadius.circular(ScreenUtil().radius(10)),
                          child: Container(
                            height: ScreenUtil.defaultSize.height.h/5.h,
                            width: 70.w,
                            decoration: BoxDecoration(
                              // borderRadius: BorderRadius.circular(ScreenUtil().radius(10)),
                              image: DecorationImage(
                                // colorFilter: ColorFilter.mode(
                                //     MyColors.blackColor.withOpacity(0.3), BlendMode.darken),
                                fit: BoxFit.cover,
                                image: NetworkImage(wishList!=null?wishList.product.baseImage.mediumImageUrl:item.product.baseImage.largeImageUrl),
                              ),
                            ),
                          )
                      ),

                      Row(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(width: 40.w,height: 40.h,
                              margin: EdgeInsets.symmetric(horizontal: 2.w,vertical: 10.h),
                              child: Image.network(wishList!=null?wishList.product.baseImage.mediumImageUrl:item.product.images[0].mediumImageUrl)),


                          Container(
                            margin: context.locale.toString()=='en'?EdgeInsets.only(top:10.h,left:5.w,):EdgeInsets.only(top:10.h,right:5.w,),
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  child: Container(
                                  width:0.45.sw,
                                  child: Text(wishList!=null?wishList.product.name:item.product.name,
                                    style:TabsTextStyle,
                                    maxLines:2,overflow: TextOverflow.ellipsis,)
                                  ),
                                ),
                                SizedBox(height: 5.h,),
                                Flexible(
                                  child: Container(
                                      width:0.55.sw,
                                      child: Text(wishList!=null?wishList.product.formatedPrice:item.product.formatedPrice,
                                        style:PriceTextStyle,
                                        overflow: TextOverflow.ellipsis,
                                      )),
                                ),
                                SizedBox(height: 6.h,),

                                Row(
                                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    StarRating(rating: 3.5,size: ScreenUtil().radius(15),),
                                      Container(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        // crossAxisAlignment: CrossAxisAlignment.end,
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          SizedBox(width: 20.w,),
                                          InkWell(
                                            onTap: (){
                                              Provider.of<OrdersProvider>(context, listen: false).removeItemFromCart(context,item.product.id);
                                            },
                                              child: SvgPicture.asset('assets/svg/delete.svg')),
                                          if(wishList==null)
                                          SizedBox(width: 15.w,),
                                          if(wishList==null)
                                          Text('QTY',style: QTYStyle,),
                                          if(wishList==null)
                                          SizedBox(width: 6.w,),
                                          if(wishList==null)
                                            incAnddescWidget(context),
                                          if(wishList==null)
                                          SizedBox(width: 10.w,),
                                          if(wishList==null)
                                         SvgPicture.asset('assets/svg/add.svg'),
                                        ],

                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),


                    ]

                ),
              ),
            ),
            if(wishList==null)
              circleWidget(context,item.quantity),
          ],
          overflow: Overflow.visible,
        ),
      ),
    );
  }
circleWidget(BuildContext context,int count){
  return  context.locale.toString()=='en'?
    Positioned(
      right: 10,top: -2,
      child: CircleAvatar(
        radius: ScreenUtil().radius(15),
        backgroundColor: PrimaryColor,
        child: Text(count.toString(),style: SliderNextStyle,),
      ),
    )
    :Positioned(
    left: 10,top: -2,
    child: CircleAvatar(
      radius: ScreenUtil().radius(15),
      backgroundColor: PrimaryColor,
      child: Text(count.toString(),style: SliderNextStyle,),
    ),
  )
  ;
}

incAnddescWidget(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(wishList!=null?'1':item.quantity.toString(),style: DiscountOffStyle,),
        SizedBox(
          width: 5.w,
        ),
        // Divider(color:GrayLiteColor,height: 31.h),
        Container(
          height: 31.h,
          color: GrayLiteColor,
          width: 0.5,
        ),
        SizedBox(
          width:5.w,
        ),

        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              child: SvgPicture.asset('assets/svg/arrow_up.svg',color: PrimaryColor,width: 6.w,height:6.h,),
              onTap: () {
                Provider.of<OrdersProvider>(context, listen: false).updateCartItem(context,item.id,item.quantity+1);

              },
            ),
            SizedBox(
              height: 10.h,
            ),
            InkWell(
              child: SvgPicture.asset('assets/svg/arrow_down.svg',color: PrimaryColor,width: 6.w,height:6.h,),
              onTap: () {
                if(item.quantity>1)
                Provider.of<OrdersProvider>(context, listen: false).updateCartItem(context,item.id,item.quantity-1);

                // print(response.data);
              },
            )
          ],
        )
      ],
    );
}
}