import 'package:bazarli/models/address_model/address_response.dart';
import 'package:bazarli/shared_preference/sp_helper.dart';
import 'package:dio/dio.dart';
import 'constants.dart';

class AddressesApi {
  AddressesApi._();

  static AddressesApi api = AddressesApi._();
  Dio dio = Dio();
  Options options=Options(
    followRedirects: false,
    validateStatus: (status) {
      return status < 500;
    },
    headers : { "contentType":"application/json","Authorization":"Bearer +${SPHelper.spHelper.getToken()}"},
  );

  Future<Map<String,dynamic>> createAddress(String address1,String country,
      String state,String city,String postcode,String phone,String first_name,String last_name) async {
    final formData = {
      'address1': address1,
      'country': country,
      'state': state,
      'city': city,
      'postcode': postcode,
      'phone': phone,
      'first_name': first_name,
      'last_name': last_name,
      'token':null,
    };
    print(formData);
    AddressResponse addressResponse = AddressResponse();
    Response response = await dio.post(
        baseUrl + CREATE_ADDRESSES_URL,options: options, data: formData);
    Map<String, dynamic> responseBody;
    Map<String,dynamic> status=Map<String,dynamic>();

    try {
      responseBody=response.data;

    }
    catch (e) {
      final errorMessage = DioErrorType.response.toString();
      print(errorMessage);
      // responseBody=response.extra;
      status = {'errorMessage':'something went wrong', 'status': false};
      return status;

    }
  }




}