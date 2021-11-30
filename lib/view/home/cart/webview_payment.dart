import 'package:bazarli/ViewModel/orders_provider.dart';
import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/constants/MyStyles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:easy_localization/easy_localization.dart';

class WebViewPayment extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
   return WebViewPaymentState();
  }

}
class WebViewPaymentState extends State<WebViewPayment>{
  WebViewController _controller;

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body:
     WebView(initialUrl:
         Provider
             .of<OrdersProvider>(context,listen: false)
             .redirectUrl,
       onWebViewCreated: (controller) {
         _controller = controller;
       },
       // ,userAgent: "random",
       javascriptMode: JavascriptMode.unrestricted,
       // navigationDelegate: (action) { launch(action.url); return NavigationDecision.prevent; },


       gestureNavigationEnabled: true,
       onPageFinished: (_) {
         readResponse();
       },
     ),
   //     WebView(
   //       initialUrl: Provider
   //                 .of<OrdersProvider>(context,listen: false)
   //                 .redirectUrl,
   //       userAgent: "random",
   //
   //       onPageFinished:(value){
   //         setState(() {
   //           print("====your page is load");
   //         });
   //       },
   //
   // ),
   );
  }




void readResponse() async {
  setState(() {
    _controller.evaluateJavascript("document.documentElement.innerHTML")
        .then((value) async {
      if (value.contains("name=\"paymentId\"")) {
        showPlacedOrderDialog(context);
      }
    });
  });
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
                color: WhiteColor,
                borderRadius: BorderRadius.circular(ScreenUtil().radius(25)),
                boxShadow: [
                  BoxShadow(color: Colors.black, offset: Offset(0, 10),
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
                    height: 20.h,
                  ),
                  Center(
                    child: GestureDetector(
                        onTap: () {
                          showCustomerReceiptDialog(context);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 50.h,
                          width: 280.w,
                          decoration: BoxDecoration(
                            color: PrimaryColor,
                            borderRadius: BorderRadius.circular(
                                ScreenUtil().radius(5)),
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
                color: WhiteColor,
                borderRadius: BorderRadius.circular(ScreenUtil().radius(25)),
                boxShadow: [
                  BoxShadow(color: Colors.black, offset: Offset(0, 10),
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
                          style: DialogTitle1Style,
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
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: SvgPicture.asset(
                                      'assets/svg/cross.svg')),
                            ],),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'Name',
                      style: DescriptionStyle,
                    ).tr(),
                    SizedBox(
                      height: 3.h,
                    ),
                    Text(
                      'Mohammed alhajri',
                      style: TitlesInHome,
                    ).tr(),

                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'Address',
                      style: DescriptionStyle,
                    ).tr(),
                    SizedBox(
                      height: 3.h,
                    ),
                    Text(
                      'at230,44000kuwait,kw',
                      style: TitlesInHome,
                    ).tr(),
                    SizedBox(
                      height: 10.h,
                    ),
                    Divider(),
                    SizedBox(
                      height: 10.h,
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
                              style: DescriptionStyle,
                            ).tr(),
                            SizedBox(
                              height: 3.h,
                            ),
                            Text(
                              '16 NOV 2021',
                              style: TitlesInHome,
                            ).tr(),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Text(
                              'TransactionNumber',
                              style: DescriptionStyle,
                            ).tr(),
                            SizedBox(
                              height: 3.h,
                            ),
                            Text(
                              '26 NOV 2021',
                              style: TitlesInHome,
                            ).tr(),
                          ],
                        ),

                      ],),
                    SizedBox(height: 10.h,),
                    Text(
                      'TransactionStatus',
                      style: DescriptionStyle,
                    ).tr(),
                    SizedBox(
                      height: 3.h,
                    ),
                    Text(
                      '26 NOV 2021',
                      style: TitlesInHome,
                    ).tr(),
                    SizedBox(
                      height: 10.h,
                    ),
                    Divider(),
                    SizedBox(
                      height: 10.h,
                    ),
//////////////////////////////////////////////////////////////////////////////////////
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'SubTotal',
                              style: DescriptionStyle,
                            ).tr(),
                            SizedBox(
                              height: 3.h,
                            ),
                            Text(
                              'EGP 129,99',
                              style: TitlesInHome,
                            ).tr(),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'DeliveryChange',
                              style: DescriptionStyle,
                            ).tr(),
                            SizedBox(
                              height: 3.h,
                            ),
                            Text(
                              'EGP 299,99',
                              style: TitlesInHome,
                            ).tr(),
                          ],
                        ),

                      ],),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'Tax',
                      style: DescriptionStyle,
                    ).tr(),
                    SizedBox(
                      height: 3.h,
                    ),
                    Text(
                      'EGP 0,00',
                      style: TitlesInHome,
                    ).tr(),
                    SizedBox(
                      height: 10.h,
                    ),
                    Divider(),
                    SizedBox(
                      height: 10.h,
                    ),
///////////////////////////////////////////////////////////////////////////////////
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'GrandTotal',
                          style: DialogTitle1Style,
                        ).tr(),
                        SizedBox(
                          width: 3.h,
                        ),
                        Text(
                          'EGP 3000.00',
                          style: GrandTotalStyle,
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