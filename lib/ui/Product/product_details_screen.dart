import 'dart:math';
import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/constants/MyStyles.dart';
import 'package:bazarli/models/product_model/product_classes/Data.dart';
import 'package:bazarli/navigation_service/navigation_service.dart';
import 'package:bazarli/ui/home/Home/component/dotted_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'component/add_to_cart_widget.dart';
import 'component/basic_detais_widget.dart';
import 'component/measurements_widgets.dart';
import 'component/customer_overview_widget.dart';
import 'component/product_app_bar.dart';
import 'package:easy_localization/easy_localization.dart';

class ProductDetailsScreen extends StatelessWidget {
  Data product;

  ProductDetailsScreen({this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ProductToolBar(
            productName: product.name,
          ),
          Container(
            color: HomeBackgroundColor,
            margin: EdgeInsets.only(top: 127.h, left: 20.w, right: 20.w),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  dottedSlider(context),
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
                  CustomerReviewWidget(),
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

  dottedSlider(BuildContext context) {
    // ProductResponse.fromJson(widget.product).imagesList.add(ProductResponse.fromJson(widget.product).image);
    return Container(
      child: DottedSlider(maxHeight: 283.h, children: [
        _productSlideImage(context, 'assets/images/promotion_one.png'),
        _productSlideImage(context, 'assets/images/promotion_one.png'),
        // _productSlideImage('https://www.google.ps/url?sa=i&url=https%3A%2F%2Fteamfusionlifestyle.com%2F2020%2F10%2F07%2Fcycle-of-fashion-trend%2F&psig=AOvVaw095oKbomyb-F0yDCocYfmv&ust=1625833349036000&source=images&cd=vfe&ved=0CAoQjRxqFwoTCJjZ87K70_ECFQAAAAAdAAAAABAI'),
        // _productSlideImage('https://www.google.ps/url?sa=i&url=http%3A%2F%2Fthepreppursuit.com%2Findian-fashion-industry%2F&psig=AOvVaw095oKbomyb-F0yDCocYfmv&ust=1625833349036000&source=images&cd=vfe&ved=0CAoQjRxqFwoTCJjZ87K70_ECFQAAAAAdAAAAABAO'),
      ]),
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
                DecorationImage(image: AssetImage(imageUrl), fit: BoxFit.cover),
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
