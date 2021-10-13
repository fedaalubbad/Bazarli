import 'dart:math';

import 'package:bazarli/ViewModel/Product_provider.dart';
import 'package:bazarli/constants/MyStyles.dart';
import 'package:bazarli/models/product_model/product_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
class GetColors extends StatelessWidget{
  Datum product;
  GetColors ({this.product});
  @override
  Widget build(BuildContext context) {
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
        Text(Provider.of<ProductProvider>(
            context,listen: false
        ).getColors(product,Provider.of<ProductProvider>(
          context,
        ).selectedVarientIndex)),
        // Container(
        //   margin: EdgeInsets.symmetric(horizontal: 10.w),
        //   height: 35.h,
        //   child: ListView.builder(
        //       scrollDirection: Axis.horizontal,
        //       itemCount: 4,
        //       itemBuilder: (ctx, index) {
        //         return Container(
        //           decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(ScreenUtil().radius(2)),
        //             color: Colors
        //                 .primaries[Random().nextInt(Colors.primaries.length)],
        //           ),
        //           margin: EdgeInsets.symmetric(horizontal: 10),
        //           height: 35.h,
        //           width: 48.w,
        //         );
        //       }),
        // ),
      ],
    );
  }

}