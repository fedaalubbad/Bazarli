import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/constants/MyStyles.dart';
import 'package:bazarli/navigation_service/navigation_service.dart';
import 'package:bazarli/ui/Authentication/widgets/textFormField_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../tool_bar_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'PaymentScreen.dart';

class AddAddressScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HomeBackgroundColor,

      body: Stack(
        children: [
          ToolBar(
            name: 'ShippingAddress',
          ),
          Container(
           padding: EdgeInsets.only( left:20.w,right:20.w,top: 117),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 25.h,
                  ),
                  Text(
                    'EditAddress',
                    style: TitlesInHome,
                  ).tr(),
                  SizedBox(
                    height: 20.h,
                  ),
                  buildDeliveryAddressWidget('DeliveryAddress'),
                  SizedBox(
                    height: 20.h,
                  ),
                  addDescriptionWidget(),
                  SizedBox(
                    height: 20.h,
                  ),
                  buildAddressLableWidget(),
                  SizedBox(
                    height: 20.h,
                  ),
                  buildPersonalInfoWidget(),
                  SizedBox(
                    height: 20.h,
                  ),
                  buildSaveAddressButton(),
                  SizedBox(
                    height: 20.h,
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  buildDeliveryAddressWidget(String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TitlesInHome,
        ).tr(),
        SizedBox(
          height: 10.h,
        ),
        Container(
            margin: EdgeInsets.symmetric(horizontal:2.w),
            width: ScreenUtil.defaultSize.width,
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
                Text(
                  'Address',
                  style: TextLabelStyle,
                ).tr(),
                SizedBox(
                  height: 3.h,
                ),
                Text(
                  'at230,44000kuwait,kw',
                  style: SliderTitle2Style,
                ),
              ],
            )),
      ],
    );
  }

  addDescriptionWidget() {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'AddDescription',
              style: TitlesInHome,
            ).tr(),
            SizedBox(
              width: 5.w,
            ),
            Text(
              'Optional',
              style: SliderTitle2Style,
            ).tr(),
          ],
        ),
        SizedBox(
          height: 5.w,
        ),
        Container(
          // height: 50.h,
          width:ScreenUtil.defaultSize.width,
          decoration: BoxDecoration(
            color: TextFormFieldColor,
            borderRadius: BorderRadius.circular(ScreenUtil().radius(5)),
          ),
          child: CustomTextfieldWidget(
            // contraller: ,
            hint: 'Apartment / Flat number/ Tower Number/ Building Number',
            textInputType: TextInputType.multiline,
            // save:Provider.of<AuthenticationProvider>(context, listen: false).saveName,
            // validator:Provider.of<AuthenticationProvider>(context, listen: false).validateEmail,
          ),
        ),
      ],
    );
  }

  int _groupValue = -1;

  buildAddressLableWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'AddressLabel',
          style: TitlesInHome,
        ).tr(),
        SizedBox(
          width: 5.w,
        ),
        Text(
          'Optional',
          style: SliderTitle2Style,
        ).tr(),
        _myRadioButton(
          title: 'home'.tr(),
          value: 0,
          // onChanged: (newValue) => setState(() => _groupValue = newValue),
        ),
        _myRadioButton(
          title: 'Work'.tr(),
          value: 1,
          // onChanged: (newValue) => setState(() => _groupValue = newValue),
        )
      ],
    );
  }

  Widget _myRadioButton({String title, int value, Function onChanged}) {
    return RadioListTile(
      value: value,
      groupValue: _groupValue,
      onChanged: onChanged,
      title: Text(
        title,
        style: TitlesInHome,
      ),
    );
  }

  buildPersonalInfoWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('PersonalInformation', style: TitlesInHome,).tr(),
        Row(children: [
          Container(
            height: 50.h,
            width: 70.w,
            decoration: BoxDecoration(
              color: TextFormFieldColor,
              borderRadius: BorderRadius.circular(ScreenUtil().radius(5)),
            ),
            child: CustomTextfieldWidget(
              // hint: '20',
              label: '+20',
              textInputType: TextInputType.multiline,
            ),
          ),
          SizedBox(width: 10.w,),
          Expanded(
            child: Container(
              height: 50.h,
              // width: 200.w,
              decoration: BoxDecoration(
                color: TextFormFieldColor,
                borderRadius: BorderRadius.circular(ScreenUtil().radius(5)),
              ),
              child: CustomTextfieldWidget(
                hint: 'MobileNumber'.tr(),
                // label: '+20',
                textInputType: TextInputType.multiline,
              ),
            ),
          ),
        ],),
        SizedBox(height: 10.h,),
        Container(
          height: 50.h,
          width: ScreenUtil.defaultSize.width,
          decoration: BoxDecoration(
            color: TextFormFieldColor,
            borderRadius: BorderRadius.circular(ScreenUtil().radius(5)),
          ),
          child: CustomTextfieldWidget(
            hint: 'FirstName'.tr(),
            // label: '+20',
            textInputType: TextInputType.multiline,
          ),
        ),
        SizedBox(height: 10.h,),
        Container(
          height: 50.h,
          width: ScreenUtil.defaultSize.width,
          decoration: BoxDecoration(
            color: TextFormFieldColor,
            borderRadius: BorderRadius.circular(ScreenUtil().radius(5)),
          ),
          child: CustomTextfieldWidget(
            hint: 'LastName'.tr(),
            // label: '+20',
            textInputType: TextInputType.multiline,
          ),
        ),
      ],
    );

  }

  buildSaveAddressButton() {
    return Container(
      child: InkWell(
          onTap: () {
            NavigationService.navigationService
                .navigateToWidget(PaymentScreen());
          },
          child: Container(
            // margin: EdgeInsets.symmetric(horizontal: 20.w),
            alignment: Alignment.center,
            height: 50.h,
            width: 157.w,
            decoration: BoxDecoration(
              color: PrimaryColor,
              borderRadius: BorderRadius.circular(ScreenUtil().radius(5)),
            ),
            child: Text(
              'SaveAddress',
              style: WhiteButtonStyle,
            ).tr(),
          )),
    );
  }
}
