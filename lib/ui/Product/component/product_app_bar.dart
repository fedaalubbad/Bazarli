import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/constants/MyStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:easy_localization/easy_localization.dart';

class ProductToolBar extends StatelessWidget {
   String productName;
   ProductToolBar({this.productName});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      color: WhiteColor,
      height: 117.h,
      child: Container(
        margin: EdgeInsets.only(top: 57.h),
        height: 20.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

          if( context.locale.toString()=='en')
            InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: SvgPicture.asset('assets/svg/back.svg')),

            if( context.locale.toString()=='ar')
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: SvgPicture.asset('assets/svg/ar_back.svg')),

                Container(
                  width: 0.7.sw,
                  height: 45.h,
                  alignment:context.fallbackLocale.toString()=='en'? Alignment.centerLeft:Alignment.centerRight,
                  child: Text(productName,style: ProducttoolbarTitleStyle,maxLines: 2,)
                ),
      ]))

    );
  }
}
