import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/constants/MyStyles.dart';
import 'package:bazarli/ui/home/tool_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'component/apply_btn_widget.dart';

class SizesSearchScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
          ToolBar(
            name: 'Sizes',
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
                              childAspectRatio:1.h,
                            ),
                            itemBuilder: (context, index) {
                              return  buildColorWidget('oneSize', '(733)');
                            }
                        ),
                      ]),
                ),
              ),
              ApplyButtonWidget(),
            ],
          ),
        ]));
  }

  buildColorWidget(String size,String name){
    return Container(
      width: 80.w,
      height: 50.h,
      decoration: BoxDecoration(
          color: GrayLiteColor,
          border: Border.all(color: GrayColor)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(size,style: TextLabelStyle,),
          SizedBox(height: 10.h,),
          Text(name,style: TextLabelStyle,),
        ],
      ),
    );
  }
}
