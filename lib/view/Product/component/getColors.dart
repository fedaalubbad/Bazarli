import 'package:bazarli/ViewModel/Product_provider.dart';
import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/constants/MyStyles.dart';
import 'package:bazarli/models/product_model/product_by_id_response.dart' as productResponse;
import 'package:flutter/cupertino.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
class GetColors extends StatelessWidget {
  productResponse.Data product;

  GetColors({this.product});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
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
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(ScreenUtil().radius(2)),
                  color: HexColor.fromHex(product.color.swatchValue
                  //     Provider.of<ProductProvider>(
                  //     context, listen: false
                  // ).getColors(product, Provider
                  //     .of<ProductProvider>(
                  //   context,listen: false)
                  //     .selectedVarientIndex)
                  ),
                border: Border.all(color: BlueDarkColor,width: 2.w)
                  ),
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              height: 35.h,
              width: 48.w,
            ),
            // Text(Provider.of<ProductProvider>(
            //     context,listen: false
            // ).getColors(product,Provider.of<ProductProvider>(
            //   context,
            // ).selectedVarientIndex)),
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
        ),
      ],
    );
  }
}
extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}