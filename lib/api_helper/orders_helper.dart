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
      Response response = await Settings.settings.dio.post(ADD_PRODUCT_TO_CART_URL+productId+'?token=true',data: formData);
    // Response response = await dio.post(baseUrl + ADD_PRODUCT_TO_CART_URL+productId+'?token=true',data: formData);

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
     Response response = await Settings.settings.dio.get(GET_CART_URL+'?token=true');


     if(response.statusCode==200){
       Map<String,dynamic> responseBody=response.data;
       if(responseBody['data']==null){
         print('cartListJson null');
         return null;
       }else {
         GetCartResponse getCartResponse =GetCartResponse.fromJson(responseBody);
         print('cartListJson${responseBody}');
         // _showToast(context, addToCartResponse.message);
         return getCartResponse;
       }
     }else{
       Map<String,dynamic> responseBody=response.data;
       print('cartListJsonelse${responseBody}');
       // _showToast(context, responseBody['error']['message']);
       return null;
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
       Response response = await Settings.settings.dio.get(REMOVE_ITEM_CART_URL+productId.toString()+'?token=true');


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
       Response response = await Settings.settings.dio.post(UPDATE_CART_URL,data: formData);


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



  Future applyCoupon(BuildContext context,code)async{
    // dio.options.headers["authorization"] =
    // "Bearer ${SPHelper.spHelper.getToken()}";
    final formData = {
      'code': code,
    };
    try{
      Response response = await Settings.settings.dio.post(APPLY_COUPON_URL+'?token=true',data: formData);


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
      Response response = await Settings.settings.dio.delete(DELETE_COUPON_URL+'?token=true',data: formData);


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