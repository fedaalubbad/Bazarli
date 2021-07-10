import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/constants/MyStyles.dart';
import 'package:bazarli/ui/Authentication/widgets/textFormField_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeToolBar extends StatelessWidget {
  bool isHome = false;

  HomeToolBar({this.isHome = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      color: WhiteColor,
      height: 117.h,
      // child: Center(
      child: Container(
        margin: EdgeInsets.only(top: 57.h),
        height: 20.h,
        child: Row(
          // mainAxisSize: MainAxisSize.max,
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            isHome
                ? Container(
                    height: 20.h,
                    width: 65.w,
                    child: Image.asset("assets/images/app_logo.png"))
                : context.locale.toString()=='en'?
                          InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: SvgPicture.asset('assets/svg/back.svg'))
                :InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: SvgPicture.asset('assets/svg/ar_back.svg'))
            ,
            Row(
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
                    width: 0.25.sw,
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
                            'Search',
                            style: SliderNextStyle,
                          ).tr(),
                        ))),
              ],
            )
          ],
        ),
      ),
      // ),
    );
  }
}
