import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/constants/MyStyles.dart';
import 'package:bazarli/ui/Authentication/widgets/textFormField_widget.dart';
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
                name: 'Claims',
              ),
              Container(
                margin: EdgeInsets.only(top:127.h),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20.h,),
                      buildSearchWidget(context),
                      SizedBox(height: 20.h,),
                      Container(
                        margin: EdgeInsets.only(left: 20.w,right: 20.w),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.start,
                         children: [
                           Text('Claims',style: TitlesInHome,).tr(),
                           Text('(3,409)',style: TitlesInHome,),
                         ],
                       )),

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

  buildSearchWidget(BuildContext context){
    return  Container(
      width:ScreenUtil.defaultSize.width.w,
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 0.4.sw,
            height: 45.h,
            decoration: BoxDecoration(
              color: TextFormFieldColor,

              borderRadius:
              context.locale.toString()=='en'?
              BorderRadius.only(
                  topLeft: Radius.circular(ScreenUtil().radius(5)),
                  bottomLeft: Radius.circular(ScreenUtil().radius(5)))
                  :
              BorderRadius.only(
                  topRight: Radius.circular(ScreenUtil().radius(5)),
                  bottomRight: Radius.circular(ScreenUtil().radius(5))),
            ),
            child: CustomTextfieldWidget(
              // contraller: Provider.of<AuthenticationProvider>(context, listen: false).nameContraller,
              hint: 'Search'.tr(),
              textInputType: TextInputType.text,
              // save:Provider.of<AuthenticationProvider>(context, listen: false).saveName,
              // validator:Provider.of<AuthenticationProvider>(context, listen: false).validateEmail,
            ),
          ),
          Container(
              width: 0.4.sw,
              child: InkWell(
                  onTap: () {
                    // NavigationService.navigationService.navigateToWidget(HomeMainScreen())  ;
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 100.w,
                    height: 45.h,
                    decoration: BoxDecoration(
                      color: PrimaryColor,
                      borderRadius:
                      context.locale.toString()=='en'?
                      BorderRadius.only(
                        topRight: Radius.circular(ScreenUtil().radius(5)),
                        bottomRight: Radius.circular(ScreenUtil().radius(5),),
                      )
                          : BorderRadius.only(
                        topLeft: Radius.circular(ScreenUtil().radius(5)),
                        bottomLeft: Radius.circular(ScreenUtil().radius(5),),
                      ),
                    ),
                    child: Text(
                      'ConfirmLocation',
                      style: SliderNextStyle,
                    ).tr(),
                  ))),
        ],
      ),
    );
  }
}