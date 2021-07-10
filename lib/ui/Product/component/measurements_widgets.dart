import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/constants/MyStyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
class MeasurementsWidgets extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Item Measurements',style: ProductTitleStyle,).tr(),
          SizedBox(height: 10.h,),
          Container(
            // margin: EdgeInsets.symmetric(horizontal: 20.w),
            alignment: Alignment.center,
            height: 50.h,
            width: ScreenUtil.defaultSize.width,
            decoration: BoxDecoration(
                color: PrimaryColor,
                borderRadius:
                BorderRadius.circular(ScreenUtil().radius(5))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Container(
                  alignment: Alignment.center,
                  width: 0.4.sw,
                  child: Text('CM',style: WhiteButtonStyle,).tr(),
                ),
                SizedBox(width:20.w),

                Container(
                  margin:context.locale.toString()=='ar'? EdgeInsets.only(left:4):EdgeInsets.only(right: 4),
                  height: 40.h,
                  width: 0.4.sw,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color:HomeBackgroundColor,
                      borderRadius:
                      BorderRadius.circular(ScreenUtil().radius(5))),
                  child: Text(
                    'INCH', style: TabsTextStyle,).tr(),
                ),
              ],
            ),

          ),
        ],
      );

  }

}