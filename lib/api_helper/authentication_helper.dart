import 'package:bazarli/models/user_model/customer_data.dart';
import 'package:bazarli/models/user_model/customer_status.dart';
import 'package:bazarli/models/user_model/supplier_status.dart';
import 'package:dio/dio.dart';
import 'constants.dart';

class AuthenticationApi {
  AuthenticationApi._();

  static AuthenticationApi api = AuthenticationApi._();
  Dio dio = Dio();
  Options options=Options(
    followRedirects: false,
    validateStatus: (status) {
    return status < 500;
  },
  headers : { "contentType":"application/json","Authorization":"Bearer "},
  );

  Future<Map<String,dynamic>> customerSign(String email,String password) async {
    final formData = {
      'email': email,
      'password': password,
      'token':null,
    };
    print(formData);
    LoginStatus loginStatus = LoginStatus();
      Response response = await dio.post(
          baseUrl + CUSTOMER_LOGIN_URL,options: options, data: formData);
    Map<String, dynamic> responseBody;
    Map<String,dynamic> status=Map<String,dynamic>();

    try {
      responseBody=response.data;
      if (response.statusCode == 200) {
        print('loginJson${responseBody}');
        CustomerData userData = CustomerData();
        loginStatus = LoginStatus.fromJson(responseBody);
        // String token = responseBody["token"];
        Map map = responseBody["data"];
        userData = CustomerData.fromJson(map);
        print('userData${userData}');
          status={'loginResponse':loginStatus,'status':true};
          return status;
      } else if (response.statusCode == 401) {
        responseBody=response.data;
        // // print(responseBody["error"]);
        // // loginStatus = null;
        status={'errorMessage':responseBody,'status':false};
        return status;
      }else{
        status={'errorMessage':'login failed','status':false};
        return status;
      }
    }
    catch (e) {
      final errorMessage = DioErrorType.response.toString();
      print(errorMessage);
        // responseBody=response.extra;
        status = {'errorMessage':'something went wrong', 'status': false};
        return status;

    }
  }


  Future<Map<String,dynamic>> customerRedister(String firstName,String lastName,String email,
    String password,String passwordConfirmation) async {

    final formData = {
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'password': password,
      'password_confirmation': passwordConfirmation,
    };
    Response response = await dio.post(
        baseUrl + CUSTOMER_REGISTER_URL,options: options, data: formData);
    print(formData);
    Map<String, dynamic> responseBody;
    Map<String,dynamic> status=Map<String,dynamic>();

    try {
      if (response.statusCode == 200) {
        responseBody=response.data;
        status={'response':responseBody['message'],'status':true};
        return status;

      } else {
        // Map<String, List<String>> responseBody;
        // responseBody = response.toString();
        // Map<String,dynamic> errors=responseBody["errors"][];
        status = {'errorResponse': 'The email has already been taken', 'status': false};
        return status;
      }
      // }else{
      //   status={'errorResponse':'register failed','status':false};
      //   return status;
      // }
    }
    catch (e) {
      final errorMessage = DioErrorType.response.toString();
      // print(errorMessage);
      status={'catchResponse':'something went wrong','status':false};
      return status;

    }
  }

  Future<Map<String,dynamic>> supplierSign(String email,String password) async {
    final formData = {
      'email': email,
      'password': password,
      'token':null,
    };
    print(formData);
    SupplierLoginStatus loginStatus = SupplierLoginStatus();
    Response response = await dio.post(
        baseUrl + SUPPLIER_LOGIN_URL,options: options, data: formData);
    Map<String, dynamic> responseBody;
    Map<String,dynamic> status=Map<String,dynamic>();

    try {
      responseBody=response.data;
      if (response.statusCode == 200) {
        print('loginJson${responseBody}');
        CustomerData userData = CustomerData();
        loginStatus = SupplierLoginStatus.fromJson(responseBody);
        // String token = responseBody["token"];
        Map map = responseBody["data"];
        userData = CustomerData.fromJson(map);
        print('userData${userData}');
        status={'loginResponse':loginStatus,'status':true};
        return status;
      } else if (response.statusCode == 401) {
        responseBody=response.data;
        // // print(responseBody["error"]);
        // // loginStatus = null;
        status={'errorMessage':responseBody,'status':false};
        return status;
      }else{
        status={'errorMessage':'login failed','status':false};
        return status;
      }
    }
    catch (e) {
      final errorMessage = DioErrorType.response.toString();
      print(errorMessage);
      // responseBody=response.extra;
      status = {'errorMessage':'something went wrong', 'status': false};
      return status;

    }
  }

  Future<Map<String,dynamic>> supplierRedister(String firstName,String lastName,String email,
    String password,String passwordConfirmation) async {

    final formData = {
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'password': password,
      'password_confirmation': passwordConfirmation,
    };
    Response response = await dio.post(
        baseUrl + SUPPLIER_REGISTER_URL,options: options, data: formData);
    print(formData);
    Map<String, dynamic> responseBody;
    Map<String,dynamic> status=Map<String,dynamic>();

    try {
      if (response.statusCode == 200) {
        responseBody=response.data;
        status={'response':responseBody['message'],'status':true};
        return status;

      } else {
        // Map<String, List<String>> responseBody;
        // responseBody = response.toString();
        // Map<String,dynamic> errors=responseBody["errors"][];
        status = {'errorResponse': 'The email has already been taken', 'status': false};
        return status;
      }
      // }else{
      //   status={'errorResponse':'register failed','status':false};
      //   return status;
      // }
    }
    catch (e) {
      final errorMessage = DioErrorType.response.toString();
      // print(errorMessage);
      status={'catchResponse':'something went wrong','status':false};
      return status;

    }
  }


  Future<Map<String,dynamic>> forgetPassword(String email) async {

    final formData = {
      'email':email,
    };
    Response response = await dio.post(
        baseUrl + CUSTOMER_FORGET_PASSWORD_URL,options: options, data: formData);
    print(formData);
    Map<String, dynamic> responseBody;
    Map<String,dynamic> status=Map<String,dynamic>();

    try {
        responseBody=response.data;

    }
    catch (e) {
      final errorMessage = DioErrorType.response.toString();
      // print(errorMessage);
      status={'catchResponse':'something went wrong','status':false};
      return status;

    }
  }





}