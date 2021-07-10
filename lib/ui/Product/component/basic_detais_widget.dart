import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/constants/MyStyles.dart';
import 'package:bazarli/models/product_model/product_classes/Data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
class BasicDetailsWidget extends StatelessWidget{
  Data product;
  BasicDetailsWidget({this.product});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Container(
                  height: 80,
                  width: 80,
                  child: Image.network(
                    product.baseImage.originalImageUrl,
                    fit: BoxFit.cover,
                  )),
              Container(
                margin: context.locale.toString() == 'en'
                    ? EdgeInsets.only(left: 20.w)
                    : EdgeInsets.only(right: 20.w),
                width: 0.6.sw,
                child: Text(
                  product.name,
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
                Text('U1542AZ-CB', style: DescriptionStyle),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('was', style: TextLabelStyle).tr(),
                Text(product.price, style: DiscountStyle),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Now', style: TextLabelStyle).tr(),
                Text(product.formatedPrice, style: PriceNowTextStyle),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Saving', style: TextLabelStyle).tr(),
                Row(
                  children: [
                    Container(
                      child: Text(product.price, style: PriceTextStyle),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Container(
                        decoration:
                        BoxDecoration(color: PrimaryColor.withOpacity(0.2)),
                        child: Text(
                          '80% off',
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