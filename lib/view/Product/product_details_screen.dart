import 'dart:math';
import 'package:bazarli/ViewModel/Product_provider.dart';
import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/constants/MyStyles.dart';
import 'package:bazarli/models/product_model/product_by_id_response.dart';
import 'package:bazarli/models/product_model/product_response.dart' as productResponse;
import 'package:bazarli/view/Product/component/getColors.dart';
import 'package:bazarli/view/home/Home/component/dotted_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'component/add_to_cart_widget.dart';
import 'component/basic_detais_widget.dart';
import 'component/getMeasurement.dart';
import 'component/toggle_view.dart';
import 'component/product_app_bar.dart';
import 'package:easy_localization/easy_localization.dart';
class ProductDetailsScreen extends StatefulWidget{
  // productResponse.Datum product;
 dynamic product;

  ProductDetailsScreen({this.product});
  @override
  State<StatefulWidget> createState() {
   return ProductDetailsScreenState();
  }
}

class ProductDetailsScreenState extends State<ProductDetailsScreen> {

@override
  void initState() {

  Provider.of<ProductProvider>(
        context,listen: false
      ).getProductById(productId: widget.product.id);
  super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Consumer<ProductProvider>(
          builder: (context,provider, child) {
            if(provider.productById==null){
              return Center(child: CircularProgressIndicator());
            }else
            return Stack(
              children: [
                ProductToolBar(
                  productName: provider.productById.data.name == null ? '' :provider.productById.data
                      .name,
                ),
                Container(
                  color: HomeBackgroundColor,
                  margin: EdgeInsets.only(top: 127.h, left: 20.w, right: 20.w),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        dottedSlider(context,provider.productById.data.images),
                        SizedBox(
                          height: 20.h,
                        ),
                        BasicDetailsWidget(product:provider.productById.data),
                        SizedBox(
                          height: 20.h,
                        ),
                        GetMeasurement(product: provider.productById.data,),
                        SizedBox(
                          height: 20.h,
                        ),
                        if( Provider.of<ProductProvider>(
                            context, listen: false
                        ).getColors(provider.productById.data, Provider
                            .of<ProductProvider>(
                          context,
                        ).selectedVarientIndex) != '')
                       GetColors(product: provider.productById.data,),
                        SizedBox(
                          height: 20.h,
                        ),
                        AddToCartWidet(provider.productById.data),
                        SizedBox(
                          height: 40.h,
                        ),
                        OverViewAndCustomerReviewToggleView(),
                        // SizedBox(
                        //   height: 20.h,
                        // ),
                        // MeasurementsWidgets(),
                        SizedBox(
                          height: 20.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }
      ),
    );
  }

  dottedSlider(BuildContext context,List<dynamic>images) {
    // ProductResponse.fromJson(widget.product).imagesList.add(ProductResponse.fromJson(widget.product).image);
    return Container(
      child: DottedSlider(maxHeight: 283.h, children:[
       ... images.map((e) => _productSlideImage(context, e.largeImageUrl))]
      ,color: PrimaryColor,),
    );
  }

  _productSlideImage(BuildContext context, String imageUrl) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 20.h),
          height: 283.h,
          width: ScreenUtil.defaultSize.width,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: ShadowColor,
                  spreadRadius: 1,
                  blurRadius: 1.0,
                  offset: Offset(0.0, 7)),
            ],
            borderRadius: BorderRadius.circular(ScreenUtil().radius(10)),
            image:
                DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover),
          ),
        ),
        if (context.locale.toString() == 'en')
          Positioned(
            right: 30.w,
            top: 30.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  child: SvgPicture.asset(
                    'assets/svg/fav.svg',
                    width: 12.h,
                    height: 11.h,
                  ),
                  backgroundColor: WhiteColor,
                  radius: ScreenUtil().radius(12),
                ),
                SizedBox(
                  height: 10.w,
                ),
                CircleAvatar(
                  child: SvgPicture.asset(
                    'assets/svg/share.svg',
                    width: 12.h,
                    height: 11.h,
                  ),
                  backgroundColor: WhiteColor,
                  radius: ScreenUtil().radius(12),
                ),
              ],
            ),
          ),
        if (context.locale.toString() == 'ar')
          Positioned(
            left: 30.w,
            top: 30.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  child: SvgPicture.asset(
                    'assets/svg/fav.svg',
                    width: 12.h,
                    height: 11.h,
                  ),
                  backgroundColor: WhiteColor,
                  radius: ScreenUtil().radius(12),
                ),
                SizedBox(
                  height: 10.w,
                ),
                CircleAvatar(
                  child: SvgPicture.asset(
                    'assets/svg/share.svg',
                    width: 12.h,
                    height: 11.h,
                  ),
                  backgroundColor: WhiteColor,
                  radius: ScreenUtil().radius(12),
                ),
              ],
            ),
          ),
      ],
    );
  }







}
