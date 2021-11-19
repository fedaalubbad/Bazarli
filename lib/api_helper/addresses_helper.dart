import 'package:bazarli/api_helper/constants_urls.dart';
import 'package:bazarli/models/address_model/createAddress_model.dart';
import 'package:bazarli/models/address_model/getAddress.dart';
import 'package:bazarli/models/get_cities_respons/get_cities_respons.dart';
import 'package:bazarli/models/message_response/message_response.dart';
import 'package:bazarli/shared_preference/sp_helper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dio_settings.dart';

class AddressesApi {
  AddressesApi._();

  static AddressesApi api = AddressesApi._();

  Future<CreateAddress> createAddress(BuildContext context,
      var address1,
      String country,
      String state,
      String city,
      String postcode,
      String phone,
      String phoneCode,
      String first_name,
      String last_name,
      String title,

      ) async {

    final formData = {
      'address1': address1,
      'country': country,
      'state': state,
      'city': city,
      'postcode': postcode,
      'phone': phone,
      'phone_code': phoneCode,
      'first_name': first_name,
      'last_name': last_name,
      'title': title,
      'token': true,
    };
    print(formData);

    try{
      Response response = await Settings.settings.dio.post(CREATE_ADDRESSES_URL,
          data: formData);

      if(response.statusCode==200){

        Map<String,dynamic> responseBody=response.data;
        print('addAddress'+ response.data.toString());
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
      String title
      ) async {
    final formData = {
      'id': addressId,
      'address1': address1,
      'country': country,
      'state': state,
      'city': city,
      'post_code': postcode,
      'phone': phone,
      'first_name': first_name,
      'last_name': last_name,
      'title': title,
      'token': null,
    };
    print(formData);
    // dio.options.headers["authorization"] = "Bearer ${SPHelper.spHelper.getToken()}";
    // dio.options.headers["Content-Type"] = "application/json";
    // dio.options.headers["Accept"] = "application/json";
    try{
      Response response = await Settings.settings.dio.post(UPDATE_DELETE_ADDRESS_URL + addressId + '?_method=PUT',
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


  Future<MessageResponse> deleteAddress(BuildContext context, String addressId,) async {

    try{
      Response response = await Settings.settings.dio.delete(UPDATE_DELETE_ADDRESS_URL + addressId + '?token=true');


      if(response.statusCode==200){
        MessageResponse messageResponse=MessageResponse.fromJson(response.data);
        _showToast(context, messageResponse.message);
        return messageResponse;

      } else {
        _showToast(context,'error');
        // return messageResponse ;
        throw Exception();
      }
    }on DioError catch (e) {
      _showToast(context,'something went wrong');
      print('errormsg $e');
      throw Exception();
    }

  }


  Future<GetAddress> getCustomerAddresses() async {

    // // print("tokennn Bearer ${SPHelper.spHelper.getToken()}");
    // dio.options.headers["authorization"] =
    //     "Bearer ${SPHelper.spHelper.getToken()}";
    // dio.options.headers["Content-Type"] = "application/json";
    // dio.options.headers["Accept"] = "application/json";
    try {
      Response response = await Settings.settings.dio.get(GET_ADDRESSES_URL,
          options: Options(headers: {
            "Authorization": 'Bearer ${SPHelper.spHelper.getToken()}'
          }));

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

  Future<List<GetCitiesResponse>> getKuwitCities() async {

    try {
      Response response = await Settings.settings.dio.get(GET_CITIES_URL+'?language=en&country=KW');
      print('002'+response.statusMessage);

      if (response.statusCode < 400) {
        List<dynamic> searchResponse = response.data;
        List<GetCitiesResponse> ls = searchResponse.map((e) {
          return GetCitiesResponse.fromJson(e);
        }).toList();
        print('002cities'+ls.first.toString());
        return ls;
      } else {
        print('002citiesError'+response.data);
      }
    } on Exception catch (e) {
      print('002citiesError'+e.toString());
      return null;
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

//////////////end addresses
}
