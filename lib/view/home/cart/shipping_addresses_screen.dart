import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/constants/MyStyles.dart';
import 'package:bazarli/models/address_model/getAddress.dart';
import 'package:bazarli/navigation_service/navigation_service.dart';
import 'package:bazarli/ViewModel/addresses_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../tool_bar_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'addAddressScreen.dart';
class ShippingAdressScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return ShippingAdressScreenState();
  }

}
class ShippingAdressScreenState extends State<ShippingAdressScreen> {

  @override
  void initState() {
    Provider.of<AddressesProvider>(context, listen: false)
        .getCustomerAddresses();
    Provider.of<AddressesProvider>(context, listen: false)
        .getCKuwitCities();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HomeBackgroundColor,
      body: SafeArea(
        child: Stack(
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
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    getAddresses(context),
                    SizedBox(
                      height: 20.h,
                    ),
                    buildAddAddressWidget(context),
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
      ),
    );
  }

  // Widget getAddresses(BuildContext context) {
  //   return FutureBuilder<List<Datum>>(
  //     future: Provider.of<AddressesProvider>(context, listen: false)
  //         .getCustomerAddresses(),
  //         builder: (context, snapshot) {
  //           if (snapshot.hasData) {
  //             return ListView.builder(
  //               shrinkWrap: true,
  //               physics: NeverScrollableScrollPhysics(),
  //               itemCount: snapshot.data.length,
  //               itemBuilder: (context, index) {
  //               Datum address = snapshot.data[index];
  //               return buildAddressWidget(context,
  //                 index==0?'PrimaryAddress':'SecondaryAddress',
  //                 address,
  //               );
  //             },
  //         );
  //       } else if (snapshot.hasError) {
  //         return Padding(
  //           padding: const EdgeInsets.all(10.0),
  //           child: Container(
  //             child: Text('no addresses yet'),
  //           ),
  //         );
  //       }
  //       // By default, show a loading spinner. placeholder view
  //       return Padding(
  //         padding: const EdgeInsets.all(10.0),
  //         child: Container(
  //           child: Text('load'),
  //         ),
  //       );
  //     },
  //   );
  // }
 Widget getAddresses(BuildContext context) {

            if (Provider.of<AddressesProvider>(context).addressList.length!=0) {
              return ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: Provider.of<AddressesProvider>(context, listen: false).addressList.length,
                itemBuilder: (context, index) {
                Datum address = Provider.of<AddressesProvider>(context, listen: false).addressList[index];
                return buildAddressWidget(context,
                  index==0?'PrimaryAddress':'SecondaryAddress',
                  address,
                );
              },
          );
        } else {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              child: Text('no addresses yet'),
            ),
          );
        }
        // By default, show a loading spinner. placeholder view

  }

Widget  buildAddressWidget(BuildContext context,text,Datum address) {
    return Container(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10.h,
          ),
          Text(
            text,
            style: TitlesInHome,
          ).tr(),
          SizedBox(
            height: 10.h,
          ),
          GestureDetector(
            onLongPress:(){
              Provider.of<AddressesProvider>(context, listen: false)
              .submitDeleteAddressDialog(context,'are you sure you want delete this address?',address.id);
            },
            child: Container(
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
                    address.firstName + ' ' + address.lastName,
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
                    address.address1.toString(),
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
                    address.phone,
                    style: SliderTitle2Style,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  buildAddAddressWidget(BuildContext context) {
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
        InkWell(
        onTap: ()async{
        NavigationService.navigationService.navigateToWidget(
            AddAddressScreen(),
          );
          // await  Provider.of<AddressesProvider>(context, listen: false).createNewAddress(context);
          // Provider.of<AddressesProvider>(context, listen: false).getCustomerAddresses();
          //
          },
          child: Container(
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
        ),
      ],
    );
  }

  buildContinueButton() {
    return Container(
      child: InkWell(
        onTap: () {
          // NavigationService.navigationService.navigateToWidget(
          //   AddAddressScreen(),
          // );
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
