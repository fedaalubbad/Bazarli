import 'package:bazarli/constants/MyStyles.dart';
import 'package:bazarli/view/home/tool_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'component/apply_btn_widget.dart';
class NewArrivalScreen extends StatelessWidget {
  int _groupValue = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
          ToolBar(
            name: 'Brand',
          ),
          Stack(
            children: [
              Container(
                height: ScreenUtil.defaultSize.height,
                padding: EdgeInsets.only(bottom: 60.h),
                margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 117),
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 25.h,
                        ),
                        _myCheckButton(title: 'FOSSIL', value: 0,),
                        _myCheckButton(title: 'FOSSIL', value: 1,),
                        _myCheckButton(title: 'FOSSIL', value: 2,),


                      ]),
                ),
              ),
              ApplyButtonWidget(),
            ],
          ),
        ]));
  }
  Widget _myCheckButton({String title,  value, Function onChanged}) {
    return CheckboxListTile(
      onChanged: onChanged,
      value: false,

      title: Text(
        title,
        style: DescriptionStyle,
      ),
    );
  }

}
