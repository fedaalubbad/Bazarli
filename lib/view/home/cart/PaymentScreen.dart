import 'package:bazarli/models/cart_model/address_rates.dart';
import 'package:bazarli/ViewModel/addresses_provider.dart';
import 'package:bazarli/ViewModel/orders_provider.dart';
import 'package:bazarli/models/cart_model/payment_methods.dart';
import 'package:bazarli/models/cart_model/save_order_response.dart';
import 'package:bazarli/models/cart_model/shipping_methods.dart';
import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/constants/MyStyles.dart';
import 'package:bazarli/models/address_model/getAddress.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../tool_bar_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class  PaymentScreen extends StatefulWidget{
Datum selectedAddress;
PaymentScreen(this.selectedAddress);
  @override
  State<StatefulWidget> createState() {
    return PaymentScreenState();
  }

}
class PaymentScreenState extends State<PaymentScreen> {

  @override
  void initState() {
    Provider.of<OrdersProvider>(context, listen: false).getAddressRates(context,widget.selectedAddress);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child: Stack(
        children: [
          ToolBar(
            name: 'Payment',
          ),
          Container(
            margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 117.h),
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
                  // if(Provider.of<OrdersProvider>(context).addressRates!=null)
                  //   if(Provider.of<OrdersProvider>(context).shippingMethods.data.methods.length>0)
                    buildSelectAddressRateMethodWidget(),
                  SizedBox(
                    height:20.h,
                  ),
                  if(Provider.of<OrdersProvider>(context).shippingMethods!=null)
                    if(Provider.of<OrdersProvider>(context).shippingMethods.data.methods.length>0)
                    buildSelectShippingMethodWidget(),
                  SizedBox(
                    height:20.h,
                  ),
                  if(Provider.of<OrdersProvider>(context).paymentMethods!=null)
                    if(Provider.of<OrdersProvider>(context).paymentMethods.data.paymentMethods.length>0)
                  buildSelectPaymentMethodWidget(),
                  SizedBox(
                    height:20.h,
                  ),
                    if(Provider.of<OrdersProvider>(context).shippingMethods!=null)
                    if(Provider.of<OrdersProvider>(context).shippingMethods.data.methods.length>0)
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
    )
    );
  }

  buildAddressWidget(String text){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text,style: TitlesInHome,).tr(),
        SizedBox(height:10.h ,),
        Container(
            // height:220.h,
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
                Text(widget.selectedAddress.firstName+' '+widget.selectedAddress.lastName,style: SliderTitle2Style,),
                SizedBox(height: 15.h,),
                Text('Address',style: TextLabelStyle,).tr(),
                SizedBox(height: 3.h,),
                Text(widget.selectedAddress.address1.first,style: SliderTitle2Style,),
                SizedBox(height: 15.h,),
                Text('PhoneNumber',style: TextLabelStyle,).tr(),
                SizedBox(height: 3.h,),
                Text(widget.selectedAddress.phoneCode.toString()+' '+widget.selectedAddress.phone.toString(),style: SliderTitle2Style,),
              ],
            )

        ),
      ],
    );
  }
  int _groupValue = -1;

  buildSelectAddressRateMethodWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'SelectAddressMethod',
          style: TitlesInHome,
        ).tr(),
        SizedBox(
          width: 5.w,
        ),
        Selector<OrdersProvider,AddressRates>(
          builder: (context, response, z) {
            if (response == null) {
              return Center(child: CircularProgressIndicator());
            } else {
              return  Container(
                margin: EdgeInsets.all(ScreenUtil().radius(4)),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[200])),
                child:  ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount:response.data.rates.length ,
                    itemBuilder: (context,index){
                      DataRate addressRate=response.data.rates[index];
                      return _addressRadioButton(
                            title:addressRate.carrierTitle,
                            value:addressRate,
                            onChanged: (newValue) =>  Provider.of<OrdersProvider>(context, listen: false).selectAddressRate(context,newValue));
                    }),
              );
            }
          },
          selector: (context, provider) {
            return provider.addressRates;
          },
        ),
      ],
    );
  }

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
        Selector<OrdersProvider,ShippingMethods>(
          builder: (context, response, z) {
            if (response == null) {
              return Center(child: CircularProgressIndicator());
            } else {
              return  Container(
                margin: EdgeInsets.all(ScreenUtil().radius(4)),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[200])),
                child:  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount:response.data.methods.length ,
                    itemBuilder: (context,index){
                      Method shippingMethod=response.data.methods[index];
                      return _shippingRadioButton(
                          title:shippingMethod.methodTitle,
                          value:shippingMethod,
                          onChanged: (newValue) =>  Provider.of<OrdersProvider>(context, listen: false).selectShippingMethod(context,newValue));
                    }),
              );
            }
          },
          selector: (context, provider) {
            return provider.shippingMethods;
          },
        ),
      ],
    );
  }
  Widget _addressRadioButton({String title, DataRate value, Function onChanged}) {
    return RadioListTile(
      value: value,
      activeColor: PrimaryColor,
      groupValue:Provider.of<OrdersProvider>(context).selectedDataRate,
      onChanged: onChanged,
      title: Text(
        title,
        style:SliderTitle2Style,
      ),
    );
  }
  Widget _shippingRadioButton({String title, Method value, Function onChanged}) {
    return RadioListTile(
      value: value,
      activeColor: PrimaryColor,
      groupValue:Provider.of<OrdersProvider>(context).selectedShippingMethod,
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
        Selector<OrdersProvider,PaymentMethods>(
          builder: (context, response, z) {
            if (response == null) {
              return Center(child: CircularProgressIndicator());
            } else {
              return  Container(
                margin: EdgeInsets.all(ScreenUtil().radius(4)),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[200])),
                child:  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount:response.data.paymentMethods.length ,
                    itemBuilder: (context,index){
                      PaymentMethod paymentMethod=response.data.paymentMethods[index];
                      return _paymentRadioButton(
                          value:paymentMethod,
                          onChanged: (newValue) =>  Provider.of<OrdersProvider>(context, listen: false).selectPaymentMethod(context,newValue));
                    }),
              );
            }
          },
          selector: (context, provider) {
            return provider.paymentMethods;
          },
        ),

      ],
    );
  }
  Widget _paymentRadioButton({ PaymentMethod value, Function onChanged}) {
    return Container(
      height: 50.h,
      width: ScreenUtil.defaultSize.width,
      child: Row(
        children: [
          Image.network(value.imageUrl,height: 20.h,width: 40.w,),
          SizedBox(width: 5.w,),
          Radio(
            activeColor: PrimaryColor,
            value: value,
            groupValue:Provider.of<OrdersProvider>(context).selectedPaymentMethod,
            onChanged: onChanged,
          ),
          Text(
            value.paymentMethodEn,
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
          Text(Provider.of<OrdersProvider>(context).paymentMethods.data.cart.formatedSubTotal,style: TitlesInHome,).tr(),
        ],
        ),
        SizedBox(height: 22.h,),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //   // Text('DeliveryChange',style: TitlesInHome,).tr(),
        //   // Text(Provider.of<OrdersProvider>(context).shippingMethods.data.cart.baseCurrencyCode,style: TitlesInHome,).tr(),
        // ],
        // ),
        // SizedBox(height: 22.h,),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //   Text('Tax',style: TitlesInHome,).tr(),
        //   Text('EGP 0,00',style: TitlesInHome,).tr(),
        // ],
        // ),
        // SizedBox(height: 50.h,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Text('GrandTotal',style: TitlesInHome,).tr(),
          Text(Provider.of<OrdersProvider>(context).paymentMethods.data.cart.formatedGrandTotal,style: SignInTextStyle,),
        ],
        ),

      ],
    );
  }

  buildPayNowButton(BuildContext context){
    return Container(
      child: InkWell(
          onTap: () async{
            if(Provider.of<OrdersProvider>(context,listen: false).catrId!=''&& Provider.of<OrdersProvider>(context,listen: false).selectedPaymentMethod!=null)
              SaveOrderResponse response=  await Provider.of<OrdersProvider>(context,listen: false).saveOrder(context, Provider.of<OrdersProvider>(context,listen: false).catrId, Provider.of<OrdersProvider>(context,listen: false).selectedPaymentMethod);
            // showPlacedOrderDialog(context);
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
                child: SingleChildScrollView(
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
                        height: 10.h,
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
                        height:10.h,
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
                        height:10.h,
                      ),
                      Divider(),
                      SizedBox(
                        height:10.h,
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
                       SizedBox(height:10.h,),
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
                        height:10.h,
                      ),
                      Divider(),
                      SizedBox(
                        height:10.h,
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
                        height: 10.h,
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
                        height:10.h,
                      ),
                      Divider(),
                      SizedBox(
                        height:10.h,
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
