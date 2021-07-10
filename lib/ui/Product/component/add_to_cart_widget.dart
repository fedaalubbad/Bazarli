import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/constants/MyStyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:easy_localization/easy_localization.dart';

class AddToCartWidet extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil.defaultSize.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            child: Text(
              'Quantity',
              style: TextLabelStyle,
            ).tr(),
          ),
          SizedBox(height: 10.h,),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    height: 50.h,
                    width: 70.w,
                    padding: EdgeInsets.all(ScreenUtil().radius(2)),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(ScreenUtil().radius(2)),
                        border: Border.all(color: GrayLiteColor)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('1'),
                        SizedBox(
                          width: 10.w,
                        ),
                        // Divider(color:GrayLiteColor,height: 31.h),
                        Container(
                          height: 31.h,
                          color: GrayLiteColor,
                          width: 0.5,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),

                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              child: SvgPicture.asset('assets/svg/arrow_up.svg'),
                              onTap: () {},
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            InkWell(
                              child: SvgPicture.asset('assets/svg/arrow_down.svg'),
                              onTap: () {},
                            )
                          ],
                        )
                      ],
                    )
                ),

                Container(
                  child: InkWell(
                      onTap: () {
                        // NavigationService.navigationService
                        //     .navigateToWidget(HomeMainScreen());
                      },
                      child: Container(
                        // margin: EdgeInsets.symmetric(horizontal: 20.w),
                        alignment: Alignment.center,
                        height: 50.h,
                        width: 230.w,
                        decoration: BoxDecoration(
                            color: PrimaryColor,
                            borderRadius:
                            BorderRadius.circular(ScreenUtil().radius(2))),
                        child: Text(
                          'AddToCart',
                          style: SliderNextStyle,
                        ).tr(),
                      )),
                )
              ])
        ],
      ),
    );
  }

}