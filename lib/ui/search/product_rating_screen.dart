import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/constants/MyStyles.dart';
import 'package:bazarli/ui/Authentication/widgets/textFormField_widget.dart';
import 'package:bazarli/ui/home/tool_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'component/apply_btn_widget.dart';

class ProductRatingSearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
          ToolBar(
            name: 'ProductRating'),
          Container(
            height: ScreenUtil.defaultSize.height,
            margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 117,bottom: 60),
            child: SingleChildScrollView(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                SizedBox(
                  height: 25.h,
                ),
                Text('1.0 Stars or More',style:DescriptionStyle ,).tr(),
                Slider(inactiveColor: GrayColor,activeColor: PrimaryColor,
                    value:0.8, onChanged: (val){}),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text('1.0 Stars',style:SliderTitle2Style ,).tr(),
                  Text('5.0 Stars',style:SliderTitle2Style ,).tr(),

                ],)
              ]),
            ),
          ),
          ApplyButtonWidget(),

        ]));
  }


}
