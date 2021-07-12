import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/constants/MyStyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../tool_bar_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ToolBar(
            name: 'Payment',
          ),
          Container(
            margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 117),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 25.h,
                  ),
                  Text('Checkout',style: TitlesInHome,).tr(),
                  SizedBox(
                    height:40.h,
                  ),
                  buildAddressWidget('PrimaryAddress'),
                  SizedBox(
                    height:40.h,
                  ),
                  buildSelectShippingMethodWidget(),
                  SizedBox(
                    height:20.h,
                  ),
                  buildSelectPaymentMethodWidget(),
                  SizedBox(
                    height:20.h,
                  ),
                  buildTotalWidget(),
                  SizedBox(
                    height:30.h,
                  ),
                  buildPayNowButton(context),
                  SizedBox(
                    height:10.h,
                  ),
                  buildBackButton(context),

                  SizedBox(
                    height:40.h,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  buildAddressWidget(String text){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text,style: TitlesInHome,).tr(),
        SizedBox(height:10.h ,),
        Container(
            height:220.h,
            width: ScreenUtil.defaultSize.width,
            padding: EdgeInsets.all(ScreenUtil().radius(15)),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: ShadowColor,
                      // spreadRadius: 5 ,
                      blurRadius: 7.0,
                      offset: Offset(0.0, 8)
                  ),
                ],
                color:WhiteColor ,
                borderRadius: BorderRadius.circular(ScreenUtil().radius(5)),
                border: Border.all(color:PrimaryColor)),
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Name',style: TextLabelStyle,).tr(),
                SizedBox(height: 3.h,),
                Text('Mohammed alhajri',style: SliderTitle2Style,),
                SizedBox(height: 15.h,),
                Text('Address',style: TextLabelStyle,).tr(),
                SizedBox(height: 3.h,),
                Text('at230,44000kuwait,kw',style: SliderTitle2Style,),
                SizedBox(height: 15.h,),
                Text('PhoneNumber',style: TextLabelStyle,).tr(),
                SizedBox(height: 3.h,),
                Text('99430999',style: SliderTitle2Style,),
              ],
            )

        ),
      ],
    );
  }
  int _groupValue = -1;

  buildSelectShippingMethodWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'SelectShippingMethod',
          style: TitlesInHome,
        ).tr(),
        SizedBox(
          width: 5.w,
        ),
        _myRadioButton(
          title: '\$ 10.00 Flat rate - flat rate shipping'.tr(),
          value: 0,
          // onChanged: (newValue) => setState(() => _groupValue = newValue),
        ),
        _myRadioButton(
          title: '\$ 00.0 Free shipping - Free shipping'.tr(),
          value: 1,
          // onChanged: (newValue) => setState(() => _groupValue = newValue),
        ),
        _myRadioButton(
          title: '\$ 10.00 Aramex Shipping  - Aramex Shipping  '.tr(),
          value: 2,
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
        style:SliderTitle2Style,
      ),
    );
  }


  ////////////////////

  int _groupValue2 = -1;

  buildSelectPaymentMethodWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'SelectPaymentMethod',
          style: TitlesInHome,
        ).tr(),
        SizedBox(
          width: 5.w,
        ),
        _paymentRadioButton(
          title: 'Knet'.tr(),
          asset: 'assets/svg/k_net.svg',
          value: 0,
          // onChanged: (newValue) => setState(() => _groupValue2 = newValue),
        ),
        _paymentRadioButton(
          title: 'Visa'.tr(),
          value: 1,
          asset: 'assets/svg/visa.svg',
          // onChanged: (newValue) => setState(() => _groupValue2 = newValue),
        ),

      ],
    );
  }
  Widget _paymentRadioButton({String title,String asset, int value, Function onChanged}) {
    return Container(
      height: 50.h,
      width: ScreenUtil.defaultSize.width,
      child: Row(
        children: [
          SvgPicture.asset(asset),
          SizedBox(width: 5.w,),
          Radio(
            value: value,
            groupValue: _groupValue2,
            onChanged: onChanged,
          ),
          Text(
            title,
            style:SliderTitle2Style,
          ),
        ],
      ),
    );
  }

  buildTotalWidget(){
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Text('Subtotal',style: TitlesInHome,).tr(),
          Text('EGP 129,99',style: TitlesInHome,).tr(),
        ],
        ),
        SizedBox(height: 22.h,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Text('DeliveryChange',style: TitlesInHome,).tr(),
          Text('EGP 299,99',style: TitlesInHome,).tr(),
        ],
        ),
        SizedBox(height: 22.h,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Text('Tax',style: TitlesInHome,).tr(),
          Text('EGP 0,00',style: TitlesInHome,).tr(),
        ],
        ),
        SizedBox(height: 50.h,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Text('GrandTotal',style: TitlesInHome,).tr(),
          Text('EGP 3000.00',style: SignInTextStyle,),
        ],
        ),

      ],
    );
  }

  buildPayNowButton(BuildContext context){
    return Container(
      child: InkWell(
          onTap: () {
            showPlacedOrderDialog(context);
          },
          child: Container(
            // margin: EdgeInsets.symmetric(horizontal: 20.w),
            alignment: Alignment.center,
            height: 50.h,
            width: ScreenUtil.defaultSize.width,
            decoration: BoxDecoration(
              color: PrimaryColor,
              borderRadius:
              BorderRadius.circular(ScreenUtil().radius(5)),
            ),
            child: Text(
              'PayNow',
              style:WhiteButtonStyle,
            ).tr(),
          )),
    );
  }

  buildBackButton(BuildContext context){
    return Container(
      child: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            // margin: EdgeInsets.symmetric(horizontal: 20.w),
            alignment: Alignment.center,
            height: 50.h,
            width: ScreenUtil.defaultSize.width,
            decoration: BoxDecoration(
              color: WhiteColor,
              borderRadius:
              BorderRadius.circular(ScreenUtil().radius(5)),
                border: Border.all(color:PrimaryColor)
            ),
            child: Text(
              'Back',
              style:SignInTextStyle,
            ).tr(),
          )),
    );
  }
  void showPlacedOrderDialog(BuildContext context) {
    showGeneralDialog(
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 700),
      context: context,
      pageBuilder: (_, __, ___) {
        return Container(
          child: Align(
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              padding: EdgeInsets.all(ScreenUtil().radius(25)),
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color:WhiteColor,
                  borderRadius: BorderRadius.circular(ScreenUtil().radius(25)),
                  boxShadow: [
                    BoxShadow(color: Colors.black,offset: Offset(0,10),
                        blurRadius: 10
                    ),
                  ]
              ),
              child: Material(
                color: WhiteColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                   Text(
                        'OrderPlaced',
                        style: TitlesInHome,
                      ).tr(),

                    SizedBox(
                      height: 5,
                    ),
                    Text(
                        'OrderPlacedSuccessfully',
                        style: DescriptionStyle,
                      ).tr(),
                    SizedBox(
                      height: 20.h,
                    ),

                    Center(
                        child: SvgPicture.asset('assets/svg/jumping.svg')),
                    SizedBox(
                      height:20.h,
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: (){
                          showCustomerReceiptDialog(context);
                        },
                        child: Container(
                              alignment: Alignment.center,
                              height: 50.h,
                              width: 280.w,
                              decoration: BoxDecoration(
                                color: PrimaryColor,
                                borderRadius: BorderRadius.circular(ScreenUtil().radius(5)),
                              ),
                              child: Text(
                                'Done',
                                style: WhiteButtonStyle,
                              ).tr(),
                            )
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        return SlideTransition(
          position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
          child: child,
        );
      },
    );
  }


  void showCustomerReceiptDialog(BuildContext context) {
    showGeneralDialog(
      barrierLabel: "Customer Receipt",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 700),
      context: context,
      pageBuilder: (_, __, ___) {
        return Container(
          child: Align(
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              padding: EdgeInsets.all(ScreenUtil().radius(25)),
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color:WhiteColor,
                  borderRadius: BorderRadius.circular(ScreenUtil().radius(25)),
                  boxShadow: [
                    BoxShadow(color: Colors.black,offset: Offset(0,10),
                        blurRadius: 10
                    ),
                  ]
              ),
              child: Material(
                color: WhiteColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Row(
                      children: [
                        Text(
                          'CustomerReceipt',
                          style:DialogTitle1Style,
                        ).tr(),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                     SvgPicture.asset('assets/svg/printer.svg'),
                            SizedBox(
                              width: 20.w,
                            ),
                     GestureDetector(
                       onTap: (){
                         Navigator.of(context).pop();
                       },
                         child: SvgPicture.asset('assets/svg/cross.svg')),
                        ],),
                      )
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      'Name',
                      style:DescriptionStyle,
                    ).tr(),
                    SizedBox(
                      height: 3.h,
                    ),
                    Text(
                      'Mohammed alhajri',
                      style:TitlesInHome,
                    ).tr(),

                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      'Address',
                      style:DescriptionStyle,
                    ).tr(),
                    SizedBox(
                      height: 3.h,
                    ),
                    Text(
                      'at230,44000kuwait,kw',
                      style:TitlesInHome,
                    ).tr(),
                    SizedBox(
                      height:20.h,
                    ),
                    Divider(),
                    SizedBox(
                      height:20.h,
                    ),
///////////////////////////////////////////////////////////////////////////////////////
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'OrderID',
                            style:DescriptionStyle,
                          ).tr(),
                          SizedBox(
                            height: 3.h,
                          ),
                          Text(
                            '16 NOV 2021',
                            style:TitlesInHome,
                          ).tr(),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Text(
                            'TransactionNumber',
                            style:DescriptionStyle,
                          ).tr(),
                          SizedBox(
                            height: 3.h,
                          ),
                          Text(
                            '26 NOV 2021',
                            style:TitlesInHome,
                          ).tr(),
                        ],
                      ),

                    ],),
                     SizedBox(height: 20.h,),
                    Text(
                      'TransactionStatus',
                      style:DescriptionStyle,
                    ).tr(),
                    SizedBox(
                      height: 3.h,
                    ),
                    Text(
                      '26 NOV 2021',
                      style:TitlesInHome,
                    ).tr(),
                    SizedBox(
                      height:20.h,
                    ),
                    Divider(),
                    SizedBox(
                      height:20.h,
                    ),
//////////////////////////////////////////////////////////////////////////////////////
                    Row(
                      mainAxisAlignment:MainAxisAlignment.spaceBetween,
                      children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'SubTotal',
                            style:DescriptionStyle,
                          ).tr(),
                          SizedBox(
                            height: 3.h,
                          ),
                          Text(
                            'EGP 129,99',
                            style:TitlesInHome,
                          ).tr(),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'DeliveryChange',
                            style:DescriptionStyle,
                          ).tr(),
                          SizedBox(
                            height: 3.h,
                          ),
                          Text(
                            'EGP 299,99',
                            style:TitlesInHome,
                          ).tr(),
                        ],
                      ),

                    ],),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      'Tax',
                      style:DescriptionStyle,
                    ).tr(),
                    SizedBox(
                      height: 3.h,
                    ),
                    Text(
                      'EGP 0,00',
                      style:TitlesInHome,
                    ).tr(),
                    SizedBox(
                      height:20.h,
                    ),
                    Divider(),
                    SizedBox(
                      height:20.h,
                    ),
///////////////////////////////////////////////////////////////////////////////////
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                          Text(
                            'GrandTotal',
                            style:DialogTitle1Style,
                          ).tr(),
                          SizedBox(
                            width: 3.h,
                          ),
                          Text(
                            'EGP 3000.00',
                            style:GrandTotalStyle,
                          ).tr(),


                    ],),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        return SlideTransition(
          position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
          child: child,
        );
      },
    );
  }
}
