import 'dart:math';
import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/constants/MyStyles.dart';
import 'package:bazarli/view/home/tool_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'component/apply_btn_widget.dart';

class ColorsSearchScreen extends StatelessWidget {
  int _groupValue = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Stack(children: [
      ToolBar(
          name: 'Colors',
      ),
      Stack(
          children: [
            Container(
              height: ScreenUtil.defaultSize.height.h,
              padding: EdgeInsets.only(bottom: 60.h),
              margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 117.h),
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 25.h,
                      ),
                      GridView.builder(
                          itemCount: 12,
                          physics: ScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount:4,
                            mainAxisSpacing:10.h,
                            crossAxisSpacing: 10.w,
                            childAspectRatio:0.8.h,
                          ),
                          itemBuilder: (context, index) {
                            Color color = Colors.primaries[Random().nextInt(
                                Colors.primaries.length)];
                          return  buildColorWidget(color, 'text');
                          }
                      ),
                    ]),
              ),
            ),
            ApplyButtonWidget(),
          ],
      ),
    ]),
        ));
  }

  buildColorWidget(Color color,String name){
    return Container(
      width: 80.w,
      height: 80.h,
      color: WhiteColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              height: 40.h,
              color: color),
          SizedBox(height: 10.h,),
          Text(name,style: TextLabelStyle,)
        ],
      ),
    );
  }
}
