import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/constants/MyStyles.dart';
import 'package:bazarli/ViewModel/addresses_provider.dart';
import 'package:bazarli/models/get_cities_respons/get_cities_respons.dart';
import 'package:bazarli/view/Authentication/widgets/textFormField_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../tool_bar_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class AddAddressScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return AddAddressScreenState();
  }

}
class AddAddressScreenState extends State<AddAddressScreen> {
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
            padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 117.h),
            child: SingleChildScrollView(
              child: Form(
                key: Provider.of<AddressesProvider>(context ).addressesFormStateKey,
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
                    buildSaveAddressButton(context),
                    SizedBox(
                      height: 20.h,
                    ),
                  ],
                ),
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
            // margin: EdgeInsets.symmetric(horizontal: 2.w),
            // width: ScreenUtil.defaultSize.width.w-50.w,
            // padding: EdgeInsets.all(ScreenUtil().radius(25)),
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
                Selector<AddressesProvider, List<GetCitiesResponse>>(
                  builder: (context, x, z) {
                    if (x == null) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                 return  Container(
                   margin: EdgeInsets.all(ScreenUtil().radius(4)),
                   decoration: BoxDecoration(
                       border: Border.all(color: Colors.grey[200])),
                   child:  DropdownButton<GetCitiesResponse>(
                          icon: Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Icon(
                                  Icons.arrow_drop_down_sharp,
                                  color: PrimaryColor,
                                  size: ScreenUtil().radius(30),
                                ),
                              ],
                            ),
                          ),
                          hint: Text('SelectCity').tr(),
                          iconDisabledColor: PrimaryColor,
                          iconSize: ScreenUtil().radius(20),
                          underline: SizedBox(),
                          items:x.map(
                                (value) {
                              return DropdownMenuItem<GetCitiesResponse>(
                                value: value,
                                child: Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(ScreenUtil().radius(5)),
                                      child: Row(
                                        children: [
                                          Text(value.text),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                              ////////////////////////
                            },
                          ).toList(),
                          value: Provider.of<AddressesProvider>(context,listen: false ).selectedCity,
                          onChanged:(val) {
                            Provider.of<AddressesProvider>(context, listen: false).selectCity(val);

                                }

                          ,
                        ),
                      );
                    }
                  },
                  selector: (context, provider) {
                    return provider.getCitiesResponseList;
                  },
                ),

                // Text(
                //   'at230,44000kuwait,kw',
                //   style: SliderTitle2Style,
                // ),
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
          width: ScreenUtil.defaultSize.width,
          decoration: BoxDecoration(
            color: TextFormFieldColor,
            borderRadius: BorderRadius.circular(ScreenUtil().radius(5)),
          ),
          child: CustomTextfieldWidget(
            isObscure: false,
            isPassword: false,
            linesNo: 1,
            // contraller: ,
            hint: 'Apartment / Flat number/ Tower Number/ Building Number',
            textInputType: TextInputType.multiline,
            save:Provider.of<AddressesProvider>(context, listen: false).saveDesc,
            validator:(val)=>Provider.of<AddressesProvider>(context, listen: false).validateDesc(val),
          ),
        ),
      ],
    );
  }


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
          title: 'Home'.tr(),
          value: 'home',
          onChanged: (newValue) => Provider.of<AddressesProvider>(context, listen: false).selectTitle(newValue),
        ),
        _myRadioButton(
          title: 'Work'.tr(),
          value: 'work',
          onChanged: (newValue) => Provider.of<AddressesProvider>(context, listen: false).selectTitle(newValue),
        )
      ],
    );
  }

  Widget _myRadioButton({String title, String value, Function onChanged}) {
    return RadioListTile(
      value: value,
      groupValue:Provider.of<AddressesProvider>(context).homeWork,
      onChanged: onChanged,
      activeColor: PrimaryColor,
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
        Text(
          'PersonalInformation',
          style: TitlesInHome,
        ).tr(),
        Row(
          children: [
            Container(
              height: 50.h,
              width: 70.w,
              decoration: BoxDecoration(
                color: TextFormFieldColor,
                borderRadius: BorderRadius.circular(ScreenUtil().radius(5)),
              ),
              child: CustomTextfieldWidget(
                isObscure: false,
                isPassword: false,
                linesNo: 1,
                // hint: '20',
                label: '+20',
                textInputType: TextInputType.multiline,
                save:Provider.of<AddressesProvider>(context, listen: false).savePhoneCode,
                validator: (val)=>Provider.of<AddressesProvider>(context, listen: false).validatePhoneCode(val),
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            Expanded(
              child: Container(
                height: 50.h,
                // width: 200.w,
                decoration: BoxDecoration(
                  color: TextFormFieldColor,
                  borderRadius: BorderRadius.circular(ScreenUtil().radius(5)),
                ),
                child: CustomTextfieldWidget(
                  isObscure: false,
                  isPassword: false,
                  linesNo: 1,
                  hint: 'MobileNumber'.tr(),
                  // label: '+20',
                  textInputType: TextInputType.multiline,
                  save:Provider.of<AddressesProvider>(context, listen: false).savePhone,
                  validator: (val)=>Provider.of<AddressesProvider>(context, listen: false).validatePhone(val),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        Container(
          height: 50.h,
          width: ScreenUtil.defaultSize.width,
          decoration: BoxDecoration(
            color: TextFormFieldColor,
            borderRadius: BorderRadius.circular(ScreenUtil().radius(5)),
          ),
          child: CustomTextfieldWidget(
            isObscure: false,
            isPassword: false,
            linesNo: 1,
            hint: 'FirstName'.tr(),
            // label: '+20',
            textInputType: TextInputType.multiline,
            save:Provider.of<AddressesProvider>(context, listen: false).saveFName,
            validator: (val)=>Provider.of<AddressesProvider>(context, listen: false).validateFName(val),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Container(
          height: 50.h,
          width: ScreenUtil.defaultSize.width,
          decoration: BoxDecoration(
            color: TextFormFieldColor,
            borderRadius: BorderRadius.circular(ScreenUtil().radius(5)),
          ),
          child: CustomTextfieldWidget(
            isObscure: false,
            isPassword: false,
            linesNo: 1,
            hint: 'LastName'.tr(),
            // label: '+20',
            textInputType: TextInputType.multiline,
            save:Provider.of<AddressesProvider>(context, listen: false).saveLName,
            validator: (val)=>Provider.of<AddressesProvider>(context, listen: false).validateLName(val),
          ),
        ),
      ],
    );
  }

  buildSaveAddressButton(BuildContext context) {
    return Provider.of<AddressesProvider>(context, listen: false)
    .isLoading?
        CircularProgressIndicator(color: PrimaryColor,)
          :
       Container(
      child: InkWell(
          onTap: () async {
            await Provider.of<AddressesProvider>(context, listen: false)
                .createNewAddress(context);
            Provider.of<AddressesProvider>(context, listen: false)
                .getCustomerAddresses();
            Navigator.of(context).pop();
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
