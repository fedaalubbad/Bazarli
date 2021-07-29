import 'dart:convert';
import 'dart:ffi';
import 'package:bazarli/models/address_model/createAddress_model.dart';
import 'package:bazarli/models/address_model/getAddress.dart';
import 'package:bazarli/shared_preference/sp_helper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class AddressesApi {
  AddressesApi._();

  static AddressesApi api = AddressesApi._();
  Dio dio = Dio();
  Options options = Options(
    followRedirects: false,
    validateStatus: (status) {
      return status < 500;
    },
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      // "charset": "utf-8",
      // "Accept-Charset": "utf-8",
      "Authorization": "Bearer +${SPHelper.spHelper.getToken()}"
    },
  );

  Future<CreateAddress> createAddress(BuildContext context,
    var address1,
    String country,
    String state,
    String city,
    String postcode,
    String phone,
    String first_name,
    String last_name,

  ) async {
    final formData = {
      'address1': address1,
      'country': country,
      'state': state,
      'city': city,
      'postcode': postcode,
      'phone': phone,
      'first_name': first_name,
      'last_name': last_name,
      'token': null,
    };
    print(formData);
    dio.options.headers["authorization"] = "Bearer ${SPHelper.spHelper.getToken()}";
    dio.options.headers["Content-Type"] = "application/json";
    dio.options.headers["Accept"] = "application/json";
    try{
    Response response = await dio.post(
      baseUrl + CREATE_ADDRESSES_URL,
      data: formData);

    if(response.statusCode==200){

     Map<String,dynamic> responseBody=response.data;
     CreateAddress createAddressResponse=CreateAddress.fromJson(responseBody);
     _showToast(context,responseBody['message']);
     return createAddressResponse;

  } else {
      Map<String,dynamic> responseBody=response.data;
      _showToast(context,responseBody['message']);
      throw Exception();
    }
  }on DioError catch (e) {
      _showToast(context,'something went wrong');
      print('errormsg $e');
    throw Exception();
    }

      }

Future<CreateAddress> updateAddress(BuildContext context,
    var address1,
    String addressId,
    String country,
    String state,
    String city,
    String postcode,
    String phone,
    String first_name,
    String last_name,

  ) async {
    final formData = {
      'id': addressId,
      'address1': address1,
      'country': country,
      'state': state,
      'city': city,
      'postcode': postcode,
      'phone': phone,
      'first_name': first_name,
      'last_name': last_name,
      'token': null,
    };
    print(formData);
    dio.options.headers["authorization"] = "Bearer ${SPHelper.spHelper.getToken()}";
    dio.options.headers["Content-Type"] = "application/json";
    dio.options.headers["Accept"] = "application/json";
    try{
    Response response = await dio.post(
      baseUrl + UPDATE_DELETE_ADDRESS_URL + addressId + '?_method=PUT',
      data: formData);

    if(response.statusCode==200){

     Map<String,dynamic> responseBody=response.data;
     CreateAddress createAddressResponse=CreateAddress.fromJson(responseBody);
     _showToast(context,responseBody['message']);
     return createAddressResponse;

  } else {
      Map<String,dynamic> responseBody=response.data;
      _showToast(context,responseBody['message']);
      throw Exception();
    }
  }on DioError catch (e) {
      _showToast(context,'something went wrong');
      print('errormsg $e');
    throw Exception();
    }

      }


Future<Map<String,dynamic>> deleteAddress(BuildContext context, String addressId,) async {
    dio.options.headers["authorization"] = "Bearer ${SPHelper.spHelper.getToken()}";
    // dio.options.headers["Content-Type"] = "application/json";
    // dio.options.headers["Accept"] = "application/json";
    try{
    Response response = await dio.delete(
      baseUrl + UPDATE_DELETE_ADDRESS_URL + addressId + '?token=true',);

    if(response.statusCode==200){

     Map<String,dynamic> responseBody=response.data;
     _showToast(context,responseBody['message']);
     return responseBody;

  } else {
      Map<String,dynamic> responseBody=response.data;
      _showToast(context,'error');
      return responseBody;
      throw Exception();
    }
  }on DioError catch (e) {
      _showToast(context,'something went wrong');
      print('errormsg $e');
    throw Exception();
    }

      }


  Future<GetAddress> getCustomerAddresses() async {
    // print("tokennn Bearer ${SPHelper.spHelper.getToken()}");
    dio.options.headers["authorization"] =
        "Bearer ${SPHelper.spHelper.getToken()}";
    dio.options.headers["Content-Type"] = "application/json";
    dio.options.headers["Accept"] = "application/json";
    try {
      final response = await dio.get(
        baseUrl + GET_ADDRESSES_URL,
      );
      print('000'+response.statusMessage);

      if (response.statusCode == 200) {
      Map<String,dynamic>  responseBody = response.data;
      print('000'+responseBody.toString());
        // var jsonDataObject = jsonDecode(response.data);
        GetAddress mAddressResponse = GetAddress.fromJson(responseBody);
        return mAddressResponse;
      } else {
        throw Exception();
      }

    } on DioError catch (e) {
      // final errorMessage = DioErrorType.response.toString();
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
