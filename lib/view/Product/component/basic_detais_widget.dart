import 'package:bazarli/ViewModel/Product_provider.dart';
import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/constants/MyStyles.dart';
import 'package:bazarli/models/product_model/product_response.dart' as productResponse;
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';
class BasicDetailsWidget extends StatelessWidget{
  productResponse.Datum product;
  BasicDetailsWidget({this.product});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Container(
                  height: 70.h,
                  width: 70.w,
                  child: Image.network(
                    product.category[0].imageUrl,
                    fit: BoxFit.fill,
                  )),
              Container(
                margin: context.locale.toString() == 'en'
                    ? EdgeInsets.only(left: 20.w)
                    : EdgeInsets.only(right: 20.w),
                width: 0.6.sw,
                child: Text(
                  product.variants[Provider.of<ProductProvider>(
                    context,
                  ).selectedVarientIndex].name==null?'':product.variants[Provider.of<ProductProvider>(
                    context,
                  ).selectedVarientIndex].name,
                  style: ProductTitleStyle,
                  maxLines: 2,
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('modelNo', style: TextLabelStyle).tr(),
                Text(product.variants[Provider.of<ProductProvider>(
                  context,
                ).selectedVarientIndex].productNumber, style: DescriptionStyle),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('was', style: TextLabelStyle).tr(),
                Text(product.variants[Provider.of<ProductProvider>(
                  context,
                ).selectedVarientIndex].price.toString(), style: DiscountStyle),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Now', style: TextLabelStyle).tr(),
                Text(product.variants[Provider.of<ProductProvider>(
                  context,
                ).selectedVarientIndex].specialPrice.toString(), style: PriceNowTextStyle),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Saving', style: TextLabelStyle).tr(),
                if( product.variants[Provider.of<ProductProvider>(
                  context,
                ).selectedVarientIndex].savingPrice!=null)
                Row(
                  children: [
                    Container(
                      child: Text(product.variants[Provider.of<ProductProvider>(
                        context,
                      ).selectedVarientIndex].savingPrice.toString().substring(0,5), style: PriceTextStyle),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Container(
                        decoration:
                        BoxDecoration(color: PrimaryColor.withOpacity(0.2)),
                        child: Text(
                          product.variants[Provider.of<ProductProvider>(
                            context,
                          ).selectedVarientIndex].savingPrice.toString().substring(5,product.variants[Provider.of<ProductProvider>(
                            context,).selectedVarientIndex].savingPrice.length),
                          style: DiscountOffStyle,
                        )),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}