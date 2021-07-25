import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/constants/MyStyles.dart';
import 'package:bazarli/models/product_model/product_classes/Data.dart';
import 'package:bazarli/navigation_service/navigation_service.dart';
import 'package:bazarli/providers/wishlist_provider.dart';
import 'package:bazarli/ui/Product/product_details_screen.dart';
import 'package:bazarli/ui/home/Home/component/star_rating.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'cordinator_widget.dart';
import 'package:easy_localization/easy_localization.dart';

class BuildCarouselSlider extends StatelessWidget{
  int currentIndex;
  List<Product> product;
  BuildCarouselSlider({this.product, this.currentIndex});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        NavigationService.navigationService.navigateToWidget(ProductDetailsScreen(product: product[currentIndex],));
      },
      child: CarouselSlider.builder(
        itemCount: product.length,
        itemBuilder: (_, index, realIdx) {
          return Container(
            child: Column(
              children: [

                Container(
                  // height:(0.70.sh)-50.h,
                  decoration: BoxDecoration(
                      color: WhiteColor,
                    borderRadius: BorderRadius.circular(ScreenUtil().radius(10)),
                    boxShadow: [
                      BoxShadow(
                        color: ShadowColor,
                        // spreadRadius: 5,
                          blurRadius: 7.0,
                          offset: Offset(0.0, 8)
                      ),
                    ],

                  ),
                  margin: EdgeInsets.symmetric(horizontal: 6.w,vertical: 5.h),
                  child: Column(
                      children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(ScreenUtil().radius(10)),

                    child: Container(
                      width: double.infinity,
                      height:(0.40.sh),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(ScreenUtil().radius(10)),
                        image: DecorationImage(
                          // colorFilter: ColorFilter.mode(
                          //     MyColors.blackColor.withOpacity(0.3), BlendMode.darken),
                          fit: BoxFit.cover,
                          image: NetworkImage(product[index].baseImage.originalImageUrl),
                        ),

                      ),
                      // margin: EdgeInsets.symmetric(horizontal: 5),

                    ),
                  ),

                   Container(
                    // height:200.h,
                    // width: ScreenUtil.defaultSize.width/2,
                    margin:
                    context.locale.toString()=='en'?
                    EdgeInsets.only(top: 10.h,left: 10.w)
                     : EdgeInsets.only(top: 10.h,right: 10.w)
                     ,
                     child: Row(
                       children: [
                         Container(
                         height: 80.h,
                         width: 0.2.sw,
                         child: Image.network(product[index].baseImage.smallImageUrl)
                         ),
                         SizedBox(width: 5.w,),
                         Container(
                           width: 0.5.sw,
                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.start,
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                                Text(product[index].name,style:TabsTextStyle,maxLines: 2,),
                                SizedBox(width: 10.h,),
                                Text(product[index].formatedPrice,style:PriceTextStyle,),
                                SizedBox(height: 6.h,),
                                StarRating(rating: 4,size: ScreenUtil().radius(20),),
                             ],
                           ),
                         ),
                       ],
                     ),

                    ),


                        Container(
                          margin:
                          context.locale.toString()=='en'?
                          EdgeInsets.only(left: 30.w,top: 30.h,bottom: 15.h)
                          : EdgeInsets.only(right: 30.w,top: 30.h,bottom: 15.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,

                          children: [
                            InkWell(
                              onTap:(){
                                Provider.of<WishListProvider>(context, listen: false).addToWishList(context,product[index].id);
                               },
                                child: SvgPicture.asset('assets/svg/fav.svg')),

                            SizedBox(width: 20.w,),

                            SvgPicture.asset('assets/svg/fi_shopping-cart.svg',color: PrimaryColor,),

                          ],
                        ),

                        )

                  ]
                  ),
                ),
                // ),
                Container(
                  height: 20.h,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children:product
                            .map((e) => BuildCordinator(
                            currentIndex, product.indexOf(e)))
                            .toList()),
                  ),

                ),
              ],
            ),
          );
        },
        options: CarouselOptions(
            height:0.70.sh,
            initialPage: 0,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 3000),
            autoPlayCurve: Curves.fastOutSlowIn,
            autoPlay: false,
            // aspectRatio: 16/9,
            viewportFraction: 0.9,
            scrollPhysics: AlwaysScrollableScrollPhysics(),
            // enableInfiniteScroll: true,
            scrollDirection: Axis.horizontal,
            enlargeCenterPage: false,
            onPageChanged: (index, _) {
              // setState(() {
                currentIndex = index;
              // });
            }),
      ),
    );
  }

}