import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/constants/MyStyles.dart';
import 'package:bazarli/models/address_model/data.dart';
import 'package:bazarli/models/address_model/getAddress.dart';
import 'package:bazarli/navigation_service/navigation_service.dart';
import 'package:bazarli/providers/addresses_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../tool_bar_widget.dart';
import 'package:easy_localization/easy_localization.dart';

import 'addAddressScreen.dart';

class ShippingAdressScreen extends StatelessWidget {
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
            margin: EdgeInsets.only(
              left: 20.w,
              right: 20.w,
              top: 117.h,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 25.h,
                  ),
                  // buildAddressWidget('PrimaryAddress'),
                  getAddresses(context),
                  SizedBox(
                    height: 20.h,
                  ),
                  buildAddAddressWidget(),
                  SizedBox(
                    height: 20.h,
                  ),
                  buildContinueButton(),
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

  getAddresses(BuildContext context) {
    return FutureBuilder<GetAddress>(
      future: Provider.of<AddressesProvider>(context, listen: false)
          .getCustomerAddresses(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data.data.length,
            itemBuilder: (context, index) {
              Datum address = snapshot.data.data[index];
              return buildAddressWidget(
                'PrimaryAddress',
                address.firstName,
                address.lastName,
                address.address1[0] + '/' + address.city,
                address.phone,
              );
            },
          );
        } else if (snapshot.hasError) {
          return Container(
            child: Text('error'),
          );
        }
        // By default, show a loading spinner. placeholder view
        return Container(
          child: Text('load'),
        );
      },
    );
  }

  buildAddressWidget(
    String text,
    String firstName,
    String lastName,
    String address,
    String phone,
  ) {
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
          // height:220.h,
          width: ScreenUtil.defaultSize.width,
          padding: EdgeInsets.all(
            ScreenUtil().radius(15),
          ),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: ShadowColor,
                // spreadRadius: 5 ,
                blurRadius: 7.0,
                offset: Offset(0.0, 8),
              ),
            ],
            color: WhiteColor,
            borderRadius: BorderRadius.circular(
              ScreenUtil().radius(5),
            ),
            border: Border.all(
              color: PrimaryColor,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Name',
                style: TextLabelStyle,
              ).tr(),
              SizedBox(
                height: 3.h,
              ),
              Text(
                firstName + ' ' + lastName,
                style: SliderTitle2Style,
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                'Address',
                style: TextLabelStyle,
              ).tr(),
              SizedBox(
                height: 3.h,
              ),
              Text(
                address,
                style: SliderTitle2Style,
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                'PhoneNumber',
                style: TextLabelStyle,
              ).tr(),
              SizedBox(
                height: 3.h,
              ),
              Text(
                phone,
                style: SliderTitle2Style,
              ),
            ],
          ),
        ),
      ],
    );
  }

  buildAddAddressWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'AddNewAddress',
          style: TitlesInHome,
        ).tr(),
        SizedBox(
          height: 10.h,
        ),
        Container(
          height: 220.h,
          width: ScreenUtil.defaultSize.width,
          padding: EdgeInsets.all(
            ScreenUtil().radius(15),
          ),
          decoration: BoxDecoration(
            color: WhiteColor,
            borderRadius: BorderRadius.circular(
              ScreenUtil().radius(5),
            ),
            border: Border.all(
              color: PrimaryColor,
            ),
            boxShadow: [
              BoxShadow(
                color: ShadowColor,
                // spreadRadius: 5,
                blurRadius: 7.0,
                offset: Offset(0.0, 8),
              ),
            ],
          ),
          child: Center(
            child: SvgPicture.asset('assets/svg/add_address.svg'),
          ),
        ),
      ],
    );
  }

  buildContinueButton() {
    return Container(
      child: InkWell(
        onTap: () {
          NavigationService.navigationService.navigateToWidget(
            AddAddressScreen(),
          );
        },
        child: Container(
          // margin: EdgeInsets.symmetric(horizontal: 20.w),
          alignment: Alignment.center,
          height: 50.h,
          width: 157.w,
          decoration: BoxDecoration(
            color: PrimaryColor,
            borderRadius: BorderRadius.circular(
              ScreenUtil().radius(5),
            ),
          ),
          child: Text(
            'Continue',
            style: WhiteButtonStyle,
          ).tr(),
        ),
      ),
    );
  }
}
