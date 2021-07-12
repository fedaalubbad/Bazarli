import 'package:bazarli/constants/MyStyles.dart';
import 'package:bazarli/ui/home/profile/component/clime_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../tool_bar_widget.dart';

class ClimesScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
            children: [
              ToolBar(
                name: 'Climes',
              ),
              Container(
                margin: EdgeInsets.only(top:127.h),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20.h,),
                      Container(
                        margin: EdgeInsets.only(left: 20.w,right: 20.w),
                       child: Text('Claims (3,409)',style: TitlesInHome,)),

                      ListView.builder(
                        shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(), // <-- this will disable scroll
                          itemCount: 4,
                          itemBuilder: (context,index){
                            return ClimeItemWidget();
                          }),

                    ],
                  ),
                ),

              )
            ]
        )
    );
  }
}