import 'package:bazarli/models/cart_model/add_to_cart_model.dart';
import 'package:bazarli/shared_preference/sp_helper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class OrdersApi{
  OrdersApi._();
  static OrdersApi api=OrdersApi._();
  Dio dio=Dio();


  Future<AddToCart> addProductToCart(BuildContext context,productId,quantity) async{
    final formData = {
      'quantity': quantity,
    };
    try{
    dio.options.headers["authorization"] =
    "Bearer ${SPHelper.spHelper.getToken()}";
    Response response = await dio.post(baseUrl + ADD_PRODUCT_TO_CART_URL+productId,data: formData);

    if(response.statusCode==200){
      Map<String,dynamic> responseBody=response.data;
      AddToCart addToCartResponse=AddToCart.fromJson(responseBody);
      print('productListJson${responseBody}');
      _showToast(context, addToCartResponse.message);
    }else{
      Map<String,dynamic> responseBody=response.data;
      print('productListJson${responseBody}');
      _showToast(context, responseBody['error']['message']);
      throw Exception();
    }
  }on DioError catch (e) {
  _showToast(context,'something went wrong');
  print('errormsg $e');
  throw Exception();
  }
  }


 Future getCart(BuildContext context)async{
   try{
     dio.options.headers["authorization"] =
     "Bearer ${SPHelper.spHelper.getToken()}";
     Response response = await dio.get(baseUrl + GET_CART_URL+'?token=true');

     if(response.statusCode==200){
       Map<String,dynamic> responseBody=response.data;
       AddToCart addToCartResponse=AddToCart.fromJson(responseBody);
       print('productListJson${responseBody}');
       _showToast(context, addToCartResponse.message);
     }else{
       Map<String,dynamic> responseBody=response.data;
       print('productListJson${responseBody}');
       _showToast(context, responseBody['error']['message']);
       throw Exception();
     }
   }on DioError catch (e) {
     _showToast(context,'something went wrong');
     print('errormsg $e');
     throw Exception();
   }
  }



  Future removeItemFromCart(BuildContext context,productId)async{
     dio.options.headers["authorization"] =
     "Bearer ${SPHelper.spHelper.getToken()}";
     try{

       Response response = await dio.post(baseUrl +REMOVE_ITEM_CART_URL+productId+'?token=true');

     if(response.statusCode==200){
       Map<String,dynamic> responseBody=response.data;
       print('productListJson${responseBody}');
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
  Future applyCoupon(BuildContext context,code)async{
    dio.options.headers["authorization"] =
    "Bearer ${SPHelper.spHelper.getToken()}";
    final formData = {
      'code': code,
    };
    try{
      Response response = await dio.post(baseUrl +APPLY_COUPON_URL+'?token=true',data: formData);

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
    dio.options.headers["authorization"] =
    "Bearer ${SPHelper.spHelper.getToken()}";
    final formData = {
      'code': code,
    };
    try{
      Response response = await dio.delete(baseUrl +DELETE_COUPON_URL+'?token=true',data: formData);

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