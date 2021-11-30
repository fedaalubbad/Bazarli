import 'package:bazarli/models/cart_model/address_rates.dart';
import 'package:bazarli/models/cart_model/get_orders_response.dart' as GetOrdersResponse;
import 'package:bazarli/models/cart_model/payment_methods.dart';
import 'package:bazarli/models/cart_model/save_order_response.dart';
import 'package:bazarli/models/cart_model/shipping_methods.dart';
import 'package:bazarli/models/address_model/getAddress.dart';
import 'package:bazarli/models/cart_model/add_to_cart_model.dart';
import 'package:bazarli/models/cart_model/get_cart_response.dart';
import 'package:bazarli/shared_preference/sp_helper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants_urls.dart';
import 'dio_settings.dart';

class OrdersApi{
  OrdersApi._();
  static OrdersApi api=OrdersApi._();
  // Dio dio=Dio();

  Future<AddToCart> addProductToCart(BuildContext context,productId,quantity) async{
    // dio.options.headers["authorization"] =
    // "Bearer ${SPHelper.spHelper.getToken()}";
    final formData = {
      'quantity': quantity,
      'product_id':productId,
    };
    try{
      Response response = await Settings.settings.dio.post(ADD_PRODUCT_TO_CART_URL+productId+'?token=true',data: formData,
          options: Options(headers: {
          "Authorization": 'Bearer ${SPHelper.spHelper.getToken()}'
          }
      )
    );
      print('addCartJson${response.statusCode}$productId');

    if(response.statusCode==200){
      Map<String,dynamic> responseBody=response.data;
      AddToCart addToCartResponse=AddToCart.fromJson(responseBody);
      print('addCartJson${responseBody}');
      _showToast(context, addToCartResponse.message);
    }else{
      Map<String,dynamic> responseBody=response.data;
      print('addCartJsonElse${responseBody}');
      _showToast(context, responseBody['error']['message']);
      throw Exception();
    }
  }on DioError catch (e) {
  _showToast(context,'something went wrong');
  print('errormsg $e');
  throw Exception();
  }
  }


 Future<GetCartResponse> getCart(BuildContext context) async {
   try{
     // dio.options.headers["authorization"] =
     // "Bearer ${SPHelper.spHelper.getToken()}";
     Response response = await Settings.settings.dio.get(GET_CART_URL,
         options: Options(headers: {
           "Authorization": 'Bearer ${SPHelper.spHelper.getToken()}'
         }
         )
     );
     print('cartListJsonstatuscode${response.statusCode}');
     print('cartListJson${response}');

     if(response.statusCode==200){
       GetCartResponse getCartResponse=GetCartResponse.fromJson(response.data);
       return getCartResponse;
     }else {
       }

   } on DioError catch (e) {
     _showToast(context,'something went wrong');
     print('errormsg $e');
     return null;
   }

  }

 // Future updateQuantity(BuildContext context,productId)async{
 //   dio.options.headers["authorization"] =
 //   "Bearer ${SPHelper.spHelper.getToken()}";
 //   try{
 //     Response response = await dio.post(baseUrl +UPDATE_CART_URL+productId+'?token=true');
 //
 //   }on DioError catch (e) {
 //     _showToast(context,'something went wrong');
 //     print('errormsg $e');
 //     throw Exception();
 //   }
 //
 //   }

  Future removeItemFromCart(BuildContext context,int productId) async {
     // dio.options.headers["authorization"] =
     // "Bearer ${SPHelper.spHelper.getToken()}";
     try{
       Response response = await Settings.settings.dio.get(REMOVE_ITEM_CART_URL+productId.toString()+'?token=true',
           options: Options(headers: {
             "Authorization": 'Bearer ${SPHelper.spHelper.getToken()}'
           }
           )
       );


     if(response.statusCode==200){
       Map<String,dynamic> responseBody=response.data;
       print('removeCartJson${responseBody}');
       _showToast(context,responseBody['message']);
     }else{
       Map<String,dynamic> responseBody=response.data;
       print('removeCart${responseBody}');
       _showToast(context, responseBody['error']);
       throw Exception();
     }
   }on DioError catch (e) {
     _showToast(context,'something went wrong');
     print('errormsgRemoveCart $e');
     throw Exception();
   }
  }


  Future updateCartItem(BuildContext context,int productId,int newQty,) async {
     // dio.options.headers["authorization"] =
     // "Bearer ${SPHelper.spHelper.getToken()}";

     final formData = FormData.fromMap( {
       'qty[$productId]':newQty,
     });
     print('updateFormDate$formData ${SPHelper.spHelper.getToken()}');
     try{
       Response response = await Settings.settings.dio.post(UPDATE_CART_URL,data: formData,
           options: Options(headers: {
             "Authorization": 'Bearer ${SPHelper.spHelper.getToken()}'
           }
           )
       );


     if(response.statusCode==200){
       Map<String,dynamic> responseBody=response.data;
       print('uodateCartJson${responseBody}');
       // _showToast(context,responseBody['message']);
     }else{
       Map<String,dynamic> responseBody=response.data;
       print('uodateCart${responseBody}');
       // _showToast(context, responseBody['error']);
       throw Exception();
     }
   }on DioError catch (e) {
     _showToast(context,'something went wrong');
     print('errormsgUodateCart $e');
     throw Exception();
   }

  }


  Future<AddressRates> getAddressRates(BuildContext context,Datum address) async {
     // dio.options.headers["authorization"] =
     // "Bearer ${SPHelper.spHelper.getToken()}";

     final formData = FormData.fromMap( {
       // 'billing[address_id]':address.id,
       'billing[customer_id]':SPHelper.spHelper.getUSer().id,
       'billing[address]': address.address1[0],
       // 'billing[address2]':address.address2.toString(),
       'billing[country]':'KW',
       // 'billing[state]':'KA',
       'billing[city]':address.city.toString(),
       'billing[postcode]':'70030',
       'billing[phone]':address.phone.toString(),
       'billing[phone_code]':'00',
       // "billing['phone_code']":address.phoneCode.toString(),
       // "billing['title']":address.title,
       'billing[title]':address.title,
       'billing[first_name]':address.firstName,
       'billing[last_name]':address.lastName,
       'billing[email]':SPHelper.spHelper.getUSer().email,
     });
     print('updateFormDate${SPHelper.spHelper.getUSer().id}$formData ${SPHelper.spHelper.getToken()}');
     try{
       Response response = await Settings.settings.dio.post(GET_ADDRESS_RATES_URL,data: formData,
           options: Options(headers: {
             "Authorization": 'Bearer ${SPHelper.spHelper.getToken()}'
           }
           )
       );
       print('addressrateResp$response');


     if(response.statusCode==200){
       Map<String,dynamic> responseBody=response.data;
       AddressRates addressRates=AddressRates.fromJson(responseBody);
       print('addressRatesJson${responseBody}');

       return addressRates;
     }else{
       Map<String,dynamic> responseBody=response.data;
       print('addressRatesJson2${responseBody}');
       // _showToast(context, responseBody['error']);
       throw Exception();
     }
   }on DioError catch (e) {
     _showToast(context,'something went wrong');
     print('errormsgUodateCart $e');
     throw Exception();
   }

  }
  Future<ShippingMethods> getShippingMethods(BuildContext context,DataRate addressRate) async {
     // dio.options.headers["authorization"] =
     // "Bearer ${SPHelper.spHelper.getToken()}";

     final formData = FormData.fromMap( {
       'shipping_method':addressRate.rates[0].method,

     });
     print('updateFormDate$formData ${SPHelper.spHelper.getToken()}');
     try{
       Response response = await Settings.settings.dio.post(GET_SHIPPING_METHODS_URL,data: formData,
           options: Options(headers: {
             "Authorization": 'Bearer ${SPHelper.spHelper.getToken()}'
           }
           )
       );


     if(response.statusCode==200){
       Map<String,dynamic> responseBody=response.data;
       ShippingMethods shippingMethods=ShippingMethods.fromJson(responseBody);
       print('ShippingMethodsJson${responseBody}');

       return shippingMethods;
     }else{
       Map<String,dynamic> responseBody=response.data;
       print('ShippingMethodsJson2${responseBody}');
       // _showToast(context, responseBody['error']);
       throw Exception();
     }
   }on DioError catch (e) {
     _showToast(context,'something went wrong');
     print('errormsgUodateCart $e');
     throw Exception();
   }

  }

  Future<PaymentMethods> getPaymentMethods(BuildContext context,Method shippingMethods) async {
     // dio.options.headers["authorization"] =
     // "Bearer ${SPHelper.spHelper.getToken()}";

     final formData = FormData.fromMap( {
       'payment[method]':shippingMethods.method,

     });
     print('updateFormDate$formData ${SPHelper.spHelper.getToken()}');
     try{
       Response response = await Settings.settings.dio.post(GET_PAYMENT_METHODS_URL,data: formData,
           options: Options(headers: {
             "Authorization": 'Bearer ${SPHelper.spHelper.getToken()}'
           }
           )
       );


     if(response.statusCode==200){
       Map<String,dynamic> responseBody=response.data;
       PaymentMethods paymentMethods=PaymentMethods.fromJson(responseBody);
       print('paymentMethodsJson${responseBody}');

       return paymentMethods;
     }else{
       Map<String,dynamic> responseBody=response.data;
       print('paymentMethodsJson2${responseBody}');
       // _showToast(context, responseBody['error']);
       throw Exception();
     }
   }on DioError catch (e) {
     _showToast(context,'something went wrong');
     print('errormsgUodateCart $e');
     throw Exception();
   }

  }


Future<SaveOrderResponse> saveOrder(
    BuildContext context, {dynamic cartId, PaymentMethod method}) async {
     // dio.options.headers["authorization"] =
     // "Bearer ${SPHelper.spHelper.getToken()}";

     final formData = FormData.fromMap( {
       'cart':cartId,
       if(method!=null)
       'myfatoorah_payment_id':method.paymentMethodId,

     });
     print('updateFormDate$formData ${SPHelper.spHelper.getToken()}');
     try{
       Response response = await Settings.settings.dio.post(SAVE_ORDER_URL,data: formData,
           options: Options(headers: {
             "Authorization": 'Bearer ${SPHelper.spHelper.getToken()}'
           }
           )
       );


     if(response.statusCode==200){
       Map<String,dynamic> responseBody=response.data;
      SaveOrderResponse saveOrderResponse= SaveOrderResponse.fromJson(responseBody);
       print('saveORderJson${responseBody}');

       return saveOrderResponse;
     }else{
       Map<String,dynamic> responseBody=response.data;
       print('saveORderJson2${responseBody}');
       // _showToast(context, responseBody['error']);
       throw Exception();
     }
   }on DioError catch (e) {
     _showToast(context,'something went wrong');
     print('errormsgUodateCart $e');
     throw Exception();
   }

  }
  Future<GetOrdersResponse.GetOrderResponse> getOrders() async {
    try{
      Response response = await Settings.settings.dio.get(GET_ORDERS_URL,
          options: Options(headers: {
            "Authorization": 'Bearer ${SPHelper.spHelper.getToken()}'
          }
          )
      );


      if(response.statusCode==200){
        Map<String,dynamic> responseBody=response.data;
        GetOrdersResponse.GetOrderResponse orders=GetOrdersResponse.GetOrderResponse.fromJson(responseBody);
        print('ordersJson${responseBody}');

        return orders;
      }else{
        Map<String,dynamic> responseBody=response.data;
        print('paymentMethodsJson2${responseBody}');
        // _showToast(context, responseBody['error']);
        throw Exception();
      }
    }on DioError catch (e) {
      // _showToast(context,'something went wrong');
      print('errormsgUodateCart $e');
      throw Exception();
    }

  }


  Future applyCoupon(BuildContext context,code)async{
    // dio.options.headers["authorization"] =
    // "Bearer ${SPHelper.spHelper.getToken()}";
    final formData = {
      'code': code,
    };
    try{
      Response response = await Settings.settings.dio.post(APPLY_COUPON_URL+'?token=true',data: formData,
          options: Options(headers: {
            "Authorization": 'Bearer ${SPHelper.spHelper.getToken()}'
          }
          )
      );


      if(response.statusCode==200){
        Map<String,dynamic> responseBody=response.data;
        print('productListJson${responseBody}');
        bool success=responseBody['success'];
        _showToast(context,responseBody['message']);
      }else{
        Map<String,dynamic> responseBody=response.data;
        print('productListJson${responseBody}');
        _showToast(context, responseBody['error']);
        throw Exception();
      }
    }on DioError catch (e) {
      _showToast(context,'something went wrong');
      print('errormsg $e');
      throw Exception();
    }
  }

  Future removeCoupon(BuildContext context,code)async{
    // dio.options.headers["authorization"] =
    // "Bearer ${SPHelper.spHelper.getToken()}";
    final formData = {
      'code': code,
    };
    try{
      Response response = await Settings.settings.dio.delete(DELETE_COUPON_URL+'?token=true',data: formData,
          options: Options(headers: {
            "Authorization": 'Bearer ${SPHelper.spHelper.getToken()}'
          }
          )
      );


      if(response.statusCode==200){
        Map<String,dynamic> responseBody=response.data;
        print('productListJson${responseBody}');
        bool success=responseBody['success'];
        _showToast(context,responseBody['message']);
      }else{
        Map<String,dynamic> responseBody=response.data;
        print('productListJson${responseBody}');
        _showToast(context, responseBody['error']);
        throw Exception();
      }
    }on DioError catch (e) {
      _showToast(context,'something went wrong');
      print('errormsg $e');
      throw Exception();
    }
  }
  void _showToast(BuildContext context, String message) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(message),
        // action: SnackBarAction(label: 'Done', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );

  }

}