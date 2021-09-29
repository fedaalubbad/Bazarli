import 'dart:math';
import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/constants/MyStyles.dart';
import 'package:bazarli/models/product_model/product_response.dart' as productResponse;
import 'package:bazarli/view/home/Home/component/dotted_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'component/add_to_cart_widget.dart';
import 'component/basic_detais_widget.dart';
import 'component/measurements_widgets.dart';
import 'component/toggle_view.dart';
import 'component/product_app_bar.dart';
import 'package:easy_localization/easy_localization.dart';

class ProductDetailsScreen extends StatelessWidget {
  // productResponse.Datum product;
  dynamic product;

  ProductDetailsScreen({this.product});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: [
          ProductToolBar(
            productName: product.name==null?'':product.name,
          ),
          Container(
            color: HomeBackgroundColor,
            margin: EdgeInsets.only(top: 127.h, left: 20.w, right: 20.w),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  dottedSlider(context,product.images),
                  SizedBox(
                    height: 20.h,
                  ),
                  BasicDetailsWidget(product:product),
                  SizedBox(
                    height: 20.h,
                  ),
                  getMeasures(),
                  SizedBox(
                    height: 20.h,
                  ),
                  getColors(),
                  SizedBox(
                    height: 20.h,
                  ),
                  AddToCartWidet(),
                  SizedBox(
                    height: 40.h,
                  ),
                  OverViewAndCustomerReviewToggleView(),
                  SizedBox(
                    height: 20.h,
                  ),
                  MeasurementsWidgets(),
                  SizedBox(
                    height: 20.h,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  dottedSlider(BuildContext context,List<productResponse.Image>images) {
    // ProductResponse.fromJson(widget.product).imagesList.add(ProductResponse.fromJson(widget.product).image);
    return Container(
      child: DottedSlider(maxHeight: 283.h, children:[
       ... images.map((e) => _productSlideImage(context, e.largeImageUrl))]
      ),
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


  getMeasures() {
    List<String> meauresList = ['S', 'M', 'L', 'XL', '2XL'];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Text(
            'Measures',
            style: TextLabelStyle,
          ).tr(),
        ),
        SizedBox(
          height: 10.h,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10.w),
          height: 39.h,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: meauresList.length,
              itemBuilder: (ctx, index) {
                return Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(ScreenUtil().radius(2)),
                        border: Border.all(color: GrayLiteColor)),
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    height: 39.h,
                    width: 48.w,
                    child: Text(meauresList[index]));
              }),
        ),
      ],
    );
  }

  getColors() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Text(
            'Colors',
            style: TextLabelStyle,
          ).tr(),
        ),
        SizedBox(
          height: 10.h,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10.w),
          height: 35.h,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (ctx, index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(ScreenUtil().radius(2)),
                    color: Colors
                        .primaries[Random().nextInt(Colors.primaries.length)],
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  height: 35.h,
                  width: 48.w,
                );
              }),
        ),
      ],
    );
  }





}
