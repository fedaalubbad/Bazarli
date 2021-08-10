import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/constants/MyStyles.dart';
import 'package:bazarli/providers/authentication_provider.dart';
import 'package:bazarli/ui/Authentication/widgets/textFormField_widget.dart';
import 'package:bazarli/ui/home/profile/component/profile_toolbar.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class EditProfileScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HomeBackgroundColor,
        body: Stack(
            children: [
             ProfileToolBar(),
              Container(
                margin: EdgeInsets.only(top:ScreenUtil.defaultSize.height.h/4.h),
                child:  SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 10.h,),
                      buildProfileDetailsWidget(context),
                      SizedBox(height: 20.h,),
                      doneBtnWidget(context),
                      SizedBox(height: 10.h,),
                      cancelBtnWidget(),
                      SizedBox(height: 20.h,),
                    ],
                  ),
                ),
              )
            ]
        )
    );
  }
  buildProfileDetailsWidget(BuildContext context){
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
        child:Form(
          key:Provider.of<AuthenticationProvider>(context, listen: false).profileFormStateKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Text(
                    'Profile',
                    style: TextLabelStyle,
                  ).tr(),

                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                'Manage your profile details',
                style: SliderTitle2Style,
              ).tr(),
              SizedBox(
                height:20.h,
              ),
              Text(
                'GeneralInformation',
                style: TitlesInHome,
              ).tr(),
////////////////////////////////////////////////////
              SizedBox(
                height:20.h,
              ),
              Text('FirstName',
                style: TextLabelStyle,
              ).tr(),
              SizedBox(
                height: 10.h,
              ),
              Container(
                height: 50.h,
                decoration: BoxDecoration(
                  color:TextFormFieldColor,
                  borderRadius:  BorderRadius.circular(ScreenUtil().radius(5)),
                ),
                child:
                CustomTextfieldWidget(
                  contraller:Provider.of<AuthenticationProvider>(context, listen: false).fNameContraller2,
                  isObscure: false,
                  isPassword: false,
                  linesNo: 1,
                  hint: 'FirstName'.tr(),
                  textInputType:TextInputType.text,
                  save: Provider.of<AuthenticationProvider>(context, listen: false).saveFName2,
                  validator: Provider.of<AuthenticationProvider>(context, listen: false).validateFName,
                ),),
              SizedBox(
                height: 15.h,
              ),
              Text('LastName',
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
                  contraller:Provider.of<AuthenticationProvider>(context, listen: false).lNameContraller2,
                  isObscure: false,
                  isPassword: false,
                  linesNo: 1,
                  hint: 'LastName'.tr(),
                  textInputType:TextInputType.text,
                  save: Provider.of<AuthenticationProvider>(context, listen: false).saveLName2,
                  validator: Provider.of<AuthenticationProvider>(context, listen: false).validateLName,
                ),
              ),
///////////////////////////////////////////////////
              SizedBox(
                height:20.h,
              ),
              Text(
                'PreferredLanguage',
                style: TitlesInHome,
              ).tr(),
              SizedBox(
                height:20.h,
              ),
              buildAddressLableWidget(),
              SizedBox(
                height:20.h,
              ),
            ],
          ),
        )
    );
  }
  doneBtnWidget(BuildContext context){
    return InkWell(
        onTap: (){
          Provider.of<AuthenticationProvider>(context, listen: false).editProfile(context) ;
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


  int _groupValue = -1;

  buildAddressLableWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        _myRadioButton(
          title: 'English'.tr(),
          value: 0,
          assetName: 'assets/svg/en.svg'
          // onChanged: (newValue) => setState(() => _groupValue = newValue),
        ),
        _myRadioButton(
          title: 'Arabic'.tr(),
          value: 1,
            assetName: 'assets/svg/ar.svg'
          // onChanged: (newValue) => setState(() => _groupValue = newValue),
        )
      ],
    );
  }

  Widget _myRadioButton({String title, int value, Function onChanged,String assetName}) {
    return RadioListTile(
      value: value,
      groupValue: _groupValue,
      onChanged: onChanged,
      title: Row(
        children: [
          SvgPicture.asset(assetName,width: 14,height: 14,),
          SizedBox(width: 2.w,),
          Text(
            title,
            style: TitlesInHome,
          ),
        ],
      ),
    );
  }

}