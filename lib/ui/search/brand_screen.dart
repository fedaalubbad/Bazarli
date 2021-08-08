import 'package:bazarli/constants/MyStyles.dart';
import 'package:bazarli/providers/home_provider.dart';
import 'package:bazarli/ui/home/tool_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'component/apply_btn_widget.dart';

class BrandScreen extends StatelessWidget {
  int _groupValue = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Stack(children: [
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
                      mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      SizedBox(
                        height: 25.h,
                      ),
                     Container(
                       child: ListView.builder(
                         physics: NeverScrollableScrollPhysics(),
                         itemCount:  Provider.of<HomeProvider>(context, )
                               .brandList.length,
                           shrinkWrap: true,
                           itemBuilder:(context,index){
                          return _myRadioButton(title: Provider.of<HomeProvider>(context, listen: false)
                              .brandList[index].adminName, value:index,);
                       }),
                     ),

                     // _myRadioButton(title: Provider.of<HomeProvider>(context, listen: false)
                     //              .brandList[0].adminName, value: 0,),
                     // _myRadioButton(title: 'FOSSIL', value: 1,),
                     // _myRadioButton(title: 'FOSSIL', value: 2,),
                     // _myRadioButton(title: 'FOSSIL', value: 3,),
                     // _myRadioButton(title: 'FOSSIL', value: 4,),
                     // _myRadioButton(title: 'FOSSIL', value: 5,),
                     // _myRadioButton(title: 'FOSSIL', value: 6,),
                     // _myRadioButton(title: 'FOSSIL', value: 7,),
                     // _myRadioButton(title: 'FOSSIL', value: 8,),
                     // _myRadioButton(title: 'FOSSIL', value: 9,),

                    ]),
                ),
            ),
            ApplyButtonWidget(),
          ],
      ),
    ]),
        ));
  }
  Widget _myRadioButton({String title, int value, Function onChanged}) {
    return RadioListTile(
      value: value,
      groupValue: _groupValue,
      onChanged: onChanged,
      title: Text(
        title,
        style: DescriptionStyle,
      ),
    );
  }

}
