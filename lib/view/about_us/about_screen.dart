import 'package:bazarli/constants/MyStyles.dart';
import 'package:bazarli/view/home/profile/component/extra_widget.dart';
import 'package:bazarli/view/home/tool_bar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
class AboutUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          width: double.infinity,
          child: Stack(children: [
      ToolBar(
          name: 'AboutUs',
      ),
      Container(
            margin: EdgeInsets.only( top: 117.h),
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  buildTopImageWidget(),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 15.h,
                        ),
                        buildDescriptionWidget('Welcome','WelcomeDesc'),
                        SizedBox(
                          height: 20.h,
                        ),
                        buildDescriptionWidget('OurStory','OurStoryDesc'),
                        SizedBox(
                          height: 20.h,
                        ),
                        buildDescriptionWidget('OurTeam','OurTeamDesc'),

                        SizedBox(
                          height: 20.h,
                        ),

                       ExtraWidget(),
                        SizedBox(
                          height: 30.h,
                        ),

                      ],
                    ),
                  ),


                    ])))
    ]),
        ));
  }

  buildTopImageWidget(){
    return    Stack(
      children: [
        Container(height: 122.h,
            width: double.infinity,

            child: Image.asset('assets/images/about_rectangle.jpg',fit: BoxFit.cover,)
        ),
        Positioned(
          top: 10,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('AboutUs',style: DialogTitle1Style,).tr(),
                SizedBox(height: 10,),
                Container(width: ScreenUtil.defaultSize.width.w/1.2.w,
                    child: Text('AboutDesc',style: SliderTitle2Style,).tr()),
              ],
            ),
          ),
        )
      ],
    );
  }
  buildDescriptionWidget(title,description){
    return Container(
      width: ScreenUtil.defaultSize.width.w/1.2.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,style: TextLabelStyle,).tr(),
          SizedBox(
            height: 10.h,
          ),
           Text(description,style:AboutStyle,).tr(),

        ],
      ),
    );
  }
}
