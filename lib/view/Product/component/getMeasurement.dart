import 'package:bazarli/ViewModel/Product_provider.dart';
import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/constants/MyStyles.dart';
import 'package:bazarli/models/product_model/product_by_id_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
class GetMeasurement extends StatelessWidget{
  Data product;
  GetMeasurement ({this.product});

  @override
  Widget build(BuildContext context) {
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
              itemCount: product.variants.length,
              itemBuilder: (ctx, index) {
                return InkWell(
                  onTap: (){
                    Provider.of<ProductProvider>(
                      context,listen: false
                    ).selectVarientIndex(index);
                    Provider.of<ProductProvider>(
                        context,listen: false
                    ).quantity=1;

                    if(product.variants[Provider.of<ProductProvider>(
                      context,listen: false
                    ).selectedVarientIndex].inventories!=null) {
                      Provider.of<ProductProvider>(
                          context, listen: false
                      ).setQunty(product.variants[Provider
                          .of<ProductProvider>(
                        context,listen: false
                      ).selectedVarientIndex].inventories[0].qty);
                    }else {
                      Provider.of<ProductProvider>(
                          context, listen: false
                      ).setQunty(1);
                    }
                  },
                  child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(ScreenUtil().radius(2)),
                          border: Border.all(color:index==Provider.of<ProductProvider>(
                            context,
                          ).selectedVarientIndex?RedColor :GrayLiteColor)),
                      margin: EdgeInsets.symmetric(horizontal: 10.w),
                      height: 39.h,
                      width: 48.w,
                      // child: Text(product.variants[index].size.toString()));
                      child: Text(Provider.of<ProductProvider>(
                          context,listen: false
                      ).getSize(product,index))),
                );
              }),
        ),
      ],
    );
  }
  
}