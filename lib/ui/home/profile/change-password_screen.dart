import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/constants/MyStyles.dart';
import 'package:bazarli/navigation_service/navigation_service.dart';
import 'package:bazarli/ui/Authentication/widgets/textFormField_widget.dart';
import 'package:bazarli/ui/home/profile/returns_edit_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../tool_bar_widget.dart';
import 'package:easy_localization/easy_localization.dart';
class ChangePasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HomeBackgroundColor,
        body: Stack(
            children: [
              ToolBar(
                name: 'ChangePassword',
              ),
              Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 127.h),
                  child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height:20.h,),
                          buildchangePasswordWidget(),
                          SizedBox(height: 20.h,),
                          doneBtnWidget(),
                          SizedBox(height: 10.h,),
                          cancelBtnWidget(),

                        ]
                    ),
                  )
              )
            ]
        )
    );
  }

  buildchangePasswordWidget(){
    return  Container(
        margin: EdgeInsets.symmetric(horizontal:2.w),
        width:double.infinity,
        padding: EdgeInsets.all(ScreenUtil().radius(25)),
        decoration: BoxDecoration(
          color: WhiteColor,
          borderRadius: BorderRadius.circular(ScreenUtil().radius(5)),
          boxShadow: [
            BoxShadow(
                color: ShadowColor,
                spreadRadius: 5,
                blurRadius: 7.0,
                offset: Offset(0.0, 8)),
          ],
          // border: Border.all(color:PrimaryColor)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SizedBox(
              height:20.h,
            ),
            Text('CurrentPassword',
              style: TextLabelStyle,
            ).tr(),
            SizedBox(
              height: 10.h,
            ),
            Container(
              height: 50.h,
              decoration: BoxDecoration(
                color:TextFormFieldColor ,
                borderRadius:  BorderRadius.circular(ScreenUtil().radius(5)),
              ),
              child:
              CustomTextfieldWidget(
                isObscure: false,
                isPassword: false,
                linesNo: 1,
                hint: 'CurrentPassword'.tr(),
                textInputType:TextInputType.text,
              ),),
            SizedBox(
              height: 15.h,
            ),
            Text('RepeatNewPassword',
              style: TextLabelStyle,
            ).tr(),
            SizedBox(
              height: 10.h,
            ),
            Container(
              height: 50.h,
              decoration: BoxDecoration(
                color:TextFormFieldColor ,
                borderRadius:  BorderRadius.circular(ScreenUtil().radius(5)),
              ),
              child: CustomTextfieldWidget(
                isObscure: false,
                isPassword: false,
                linesNo: 1,
                hint: 'RepeatNewPassword'.tr(),
                textInputType:TextInputType.text,
              ),
            ),
///////////////////////////////////////////////////
            SizedBox(
              height:20.h,
            ),

          ],
        )
    );
  }
  doneBtnWidget(){
    return InkWell(
      onTap: (){
        // NavigationService.navigationService.navigateToWidget(EditProfileScreen());
      },
      child: Container(
        // margin: EdgeInsets.symmetric(horizontal: 20.w),
        alignment: Alignment.center,
        height: 45.h,
        width:ScreenUtil.defaultSize.width,
        decoration: BoxDecoration(
            color: PrimaryColor,
            borderRadius:
            BorderRadius.circular(ScreenUtil().radius(5))),
        child: Text(
          'Done',
          style: SliderNextStyle,
        ).tr(),
      ),
    );
  }

  cancelBtnWidget(){
    return  InkWell(
      onTap: (){
        // NavigationService.navigationService.navigateToWidget(EditProfileScreen());
      },
      child: Container(
        // margin: EdgeInsets.symmetric(horizontal: 20.w),
        alignment: Alignment.center,
        height: 50.h,
        width:ScreenUtil.defaultSize.width,
        decoration: BoxDecoration(
            color: WhiteColor,
            borderRadius:
            BorderRadius.circular(ScreenUtil().radius(5)),
            border: Border.all(color: PrimaryColor)),
        child: Text(
          'Cancel',
          style: SignInTextStyle,
        ).tr(),
      ),
    );
  }


}