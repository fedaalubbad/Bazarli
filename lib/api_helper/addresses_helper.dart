import 'dart:convert';

import 'package:bazarli/models/address_model/address_response.dart';
import 'package:bazarli/models/address_model/getAddress.dart';
import 'package:bazarli/shared_preference/sp_helper.dart';
import 'package:dio/dio.dart';
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
      "charset": "utf-8",
      "Accept-Charset": "utf-8",
      "Authorization": "Bearer +${SPHelper.spHelper.getToken()}"
    },
  );

  Future<Map<String, dynamic>> createAddress(
    String address1,
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
    AddressResponse addressResponse = AddressResponse();
    Response response = await dio.post(
      baseUrl + CREATE_ADDRESSES_URL,
      data: formData,
    );
    Map<String, dynamic> responseBody;
    Map<String, dynamic> status = Map<String, dynamic>();

    try {
      responseBody = response.data;
    } catch (e) {
      final errorMessage = DioErrorType.response.toString();
      print(errorMessage);
      // responseBody=response.extra;
      status = {'errorMessage': 'something went wrong', 'status': false};
      return status;
    }
  }

  Future<GetAddress> getCustomerAddresses() async {
    // print("tokennn Bearer ${SPHelper.spHelper.getToken()}");
    // dio.options.headers["authorization"] =
    //     "Bearer ${SPHelper.spHelper.getToken()}";
    // dio.options.headers["Content-Type"] = "application/json";
    // dio.options.headers["Accept"] = "application/json";
    try {
      final response = await dio.get(
        baseUrl + GET_ADDRESSES_URL,
      );
      if (response.statusCode == 200) {
        var jsonDataObject = jsonDecode(response.data);
        print('000000000000000000000000');
        GetAddress mAddressResponse = GetAddress.fromJson(jsonDataObject);
        return mAddressResponse;
      } else {
        throw Exception();
      }

      // print('addressesCode${response.statusCode}');
      //
      // Map<String, dynamic> responseBody = response.data;
      // List<dynamic> mapList = responseBody["data"];
      // // List<Address> addressesList = mapList.map((e) => Address.fromJson(e)).toList();
      // // print('addressesList${addressesList}');
      // return mapList;
    } on DioError catch (e) {
      // final errorMessage = DioErrorType.response.toString();
      print('errormsg $e');
      throw Exception();
    }
  }
}
