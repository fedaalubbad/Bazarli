import 'dart:core';
import 'package:bazarli/models/cart_model/shipping_methods.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'PaypalServices.dart';

class PaypalPayment extends StatefulWidget {
  final Function onFinish;
  Cart cart;

  PaypalPayment({this.onFinish,this.cart});

  @override
  State<StatefulWidget> createState() {
    return PaypalPaymentState();
  }
}

class PaypalPaymentState extends State<PaypalPayment> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String checkoutUrl;
  String executeUrl;
  String accessToken;
  PaypalServices services = PaypalServices();

  // you can change default currency according to your need
  Map<dynamic,dynamic> defaultCurrency = {"symbol": "KWD ", "decimalDigits": 2, "symbolBeforeTheNumber": true, "currency": "USD"};

  bool isEnableShipping = false;
  bool isEnableAddress = false;

  String returnURL = 'return.example.com';
  String cancelURL= 'cancel.example.com';


  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () async {
      try {
        accessToken = await services.getAccessToken();

        final transactions = getOrderParams();
        final res =
        await services.createPaypalPayment(transactions, accessToken);
        if (res != null) {
          setState(() {
            checkoutUrl = res["approvalUrl"];
            executeUrl = res["executeUrl"];
          });
        }
      } catch (e) {
        print('exception: '+e.toString());
        final snackBar = SnackBar(
          content: Text(e.toString()),
          duration: Duration(seconds: 10),
          action: SnackBarAction(
            label: 'Close',
            onPressed: () {
              // Some code to undo the change.
            },
          ),
        );
        _scaffoldKey.currentState.showSnackBar(snackBar);
      }
    });
  }

  // item name, price and quantity
  // String itemName = 'iPhone X';  //todo   vip subscribtion
  // String itemPrice = widget.planType==0?'1.00':'10.00';  //todo subscribe price
  int quantity = 1;

  Map<String, dynamic> getOrderParams() {
    List items = [
      {
        "name":  widget.cart.customerFirstName+' '+widget.cart.customerLastName,
        "quantity":widget.cart.itemsCount,
        "price":  widget.cart.grandTotal,
        "currency": defaultCurrency["currency"]
      }
    ];


    // checkout invoice details
    String totalAmount =   widget.cart.grandTotal.toString();
    String subTotalAmount =  widget.cart.subTotal.toString();
    String shippingCost = '0';//todo
    int shippingDiscountCost = 0;
    String userFirstName = widget.cart.customerFirstName+' '+widget.cart.customerLastName; //todo
    String userLastName = 'Yadav';  //todo
    String addressCity = 'Delhi';  //todo
    String addressStreet = 'Mathura Road';  //todo
    String addressZipCode = '110014';   //todo
    String addressCountry = 'India';   //todo
    String addressState = 'Delhi';   //todo
    String addressPhoneNumber =widget.cart.shippingAddress.phone;  //todo

    Map<String, dynamic> temp = {
      "intent": "sale",
      "payer": {"payment_method": "paypal"},
      "transactions": [
        {
          "amount": {
            "total": totalAmount,
            "currency": defaultCurrency["currency"],  //todo
            "details": {
              "subtotal": subTotalAmount,
              "shipping": shippingCost,
              "shipping_discount":
              ((-1.0) * shippingDiscountCost).toString()
            }
          },
          "description": "The payment transaction description.",
          "payment_options": {
            "allowed_payment_method": "INSTANT_FUNDING_SOURCE"
          },
          "item_list": {
            "items": items,
            if (isEnableShipping &&
                isEnableAddress)
              "shipping_address": {
                "recipient_name": userFirstName +
                    " " +
                    userLastName,
                "line1": addressStreet,
                "line2": "",
                "city": addressCity,
                "country_code": addressCountry,
                "postal_code": addressZipCode,
                "phone": addressPhoneNumber,
                "state": addressState
              },
          }
        }
      ],
      "note_to_payer": "Contact us for any questions on your order.",
      "redirect_urls": {
        "return_url": returnURL,
        "cancel_url": cancelURL
      }
    };
    return temp;
  }

  @override
  Widget build(BuildContext context) {
    print(checkoutUrl);

    if (checkoutUrl != null) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).backgroundColor,
          leading: GestureDetector(
            child: Icon(Icons.arrow_back_ios),
            onTap: () => Navigator.pop(context),
          ),
        ),
        body: WebView(

          initialUrl: checkoutUrl,
          javascriptMode: JavascriptMode.unrestricted,
          navigationDelegate: (NavigationRequest request) {
            if (request.url.contains(returnURL)) {
              final uri = Uri.parse(request.url);
              final payerID = uri.queryParameters['PayerID'];
              if (payerID != null) {
                services
                    .executePayment(executeUrl, payerID, accessToken)
                    .then((id) {
                  widget.onFinish(id);
                  Navigator.of(context).pop();
                });
              } else {
                Navigator.of(context).pop();
              }
              Navigator.of(context).pop();
            }
            if (request.url.contains(cancelURL)) {
              Navigator.of(context).pop();
            }
            return NavigationDecision.navigate;
          },
        ),
      );
    } else {
      return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              }),
          backgroundColor: Colors.black12,
          elevation: 0.0,
        ),
        body: Center(child: Container(child: CircularProgressIndicator())),
      );
    }
  }
}