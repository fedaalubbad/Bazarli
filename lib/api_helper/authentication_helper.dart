import 'package:bazarli/models/message_response/message_response.dart';
import 'package:bazarli/models/user_model/customer_status.dart';
import 'package:bazarli/ViewModel/authentication_provider.dart';
import 'package:bazarli/navigation_service/navigation_service.dart';
import 'package:bazarli/shared_preference/sp_helper.dart';
import 'package:bazarli/view/Authentication/loginAndRegister.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'constants_urls.dart';
import 'dio_settings.dart';

class AuthenticationApi {
  AuthenticationApi._();

  static AuthenticationApi api = AuthenticationApi._();
  // Dio dio = Dio();
  // Options options = Options(
  //   // followRedirects: false,
  //   // validateStatus: (status) {
  //   //   return status < 500;
  //   // },
  //   headers: {"Accept": "application/json", "Authorization": "Bearer "},
  // );

  Future<Map<String,dynamic>> customerSign(String email, String password) async {
    final formData = {
      'email': email,
      'password': password,
      'token': true,
    };
    Map<String,dynamic>status;
    print(formData);
    try {
      Response response = await Settings.settings.dio.post(CUSTOMER_LOGIN_URL, data: formData);
      // final response = await dio.post(baseUrl + CUSTOMER_LOGIN_URL,
      //     data: formData, options: options);
      if (response.statusCode == 200) {
        Map<String, dynamic> responseBody = response.data;
        // var jsonDataObject = jsonDecode(response.data);
        LoginResponse loginResponse = LoginResponse.fromJson(responseBody);
        print('token${loginResponse.token}///${loginResponse.data.id}');

        status = {'loginResponse':loginResponse, 'status': true};
        return status;
      } else {
        Map<String, dynamic> responseBody = response.data;
        status = {'errorMessage': responseBody['error'], 'status': false};
        return status;
        throw Exception();
      }
    } on DioError catch (e) {
        status = {'errorMessage': 'something went wrong', 'status': false};
        return status;
      //   print('errormsg $e');
      throw Exception();
    }
    // String token = responseBody["token"];
    // Map map = responseBody["data"];
    // userData = CustomerData.fromJson(map);
    // print('userData${userData}');
    // status = {'loginResponse': loginStatus, 'status': true};
    // return status;
    // } else if (response.statusCode == 401) {
    //   responseBody = response.data;
    // // print(responseBody["error"]);
    // // loginStatus = null;
    // status = {'errorMessage': responseBody, 'status': false};
    // return status;
    // } else {
    //   status = {'errorMessage': 'login failed', 'status': false};
    // } catch (e) {
    //   final errorMessage = DioErrorType.response.toString();
    //   print(errorMessage);
    //   // responseBody=response.extra;
    //   // status = {'errorMessage': 'something went wrong', 'status': false};
    //   // return status;
    // }
  }

  Future<Map<String, dynamic>> customerRedister(String firstName,
      String lastName,
      String email,
      String password,
      String passwordConfirmation) async {
    final formData = {
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'password': password,
      'password_confirmation': passwordConfirmation,
      // 'language_id': id,
    };
    Response response = await Settings.settings.dio.post(CUSTOMER_REGISTER_URL, data: formData);

    print(formData);
    Map<String, dynamic> responseBody;
    Map<String, dynamic> status = Map<String, dynamic>();

    try {
      if (response.statusCode == 200) {
        responseBody = response.data;
        status = {'response': responseBody['message'], 'status': true};
        return status;
      } else {
        // Map<String, List<String>> responseBody;
        // responseBody = response.toString();
        // Map<String,dynamic> errors=responseBody["errors"][];
        status = {
          'errorResponse': 'The email has already been taken',
          'status': false
        };
        return status;
      }
      // }else{
      //   status={'errorResponse':'register failed','status':false};
      //   return status;
      // }
    } catch (e) {
      final errorMessage = DioErrorType.response.toString();
      // print(errorMessage);
      status = {'catchResponse': 'something went wrong', 'status': false};
      return status;
    }
  }

  Future<Map<String, dynamic>> getProfile(id)async{

    Response response = await Settings.settings.dio.get(GET_CUSTOMER_PROFILE_URL+id);

    Map<String, dynamic> status = Map<String, dynamic>();

    try {
      if (response.statusCode == 200) {
        Map<String, dynamic> responseBody = response.data;
        LoginResponse loginResponse = LoginResponse.fromJson(responseBody);
        status = {'loginResponse':loginResponse, 'status': true};
        return status;
      } else {
        status = {
          'errorResponse': 'The email has already been taken',
          'status': false
        };
        return status;
      }

    } catch (e) {
      final errorMessage = DioErrorType.response.toString();
      // print(errorMessage);
      status = {'catchResponse': 'something went wrong', 'status': false};
      return status;
    }
  }
  Future<bool> detectToken(String id)async{

    Response response = await Settings.settings.dio.get(GET_CUSTOMER_PROFILE_URL+id);

    try {
      if (response.statusCode == 200) {
        SPHelper.spHelper.setLoged(true);
         return true;
      } else {
        SPHelper.spHelper.setLoged(false);
        return false;

      }

    } catch (e) {
      SPHelper.spHelper.setLoged(false);
      return false;

    }
  }
  Future editProfile(BuildContext context,
      {firstName, lastName, gender, dateOfBirth, languageId})async{
    final formData = {
      'first_name': firstName==null||firstName==''?SPHelper.spHelper.getUSer().firstName:firstName,
      'last_name': firstName==null||lastName==''?SPHelper.spHelper.getUSer().lastName:lastName,
      'gender': 'Male',
      // 'date_of_birth': dateOfBirth,
      'language_id': languageId==null||languageId==''?SPHelper.spHelper.getUSer().languageId:languageId,
    };
    print(formData.toString());
      var response = await Settings.settings.dio.post(UPDATE_CUSTOMER_PROFILE_URL,data:formData, options: Options(headers: {
        "Authorization": 'Bearer ${SPHelper.spHelper.getToken()}'
      }
      )
      );
    print(response.statusCode);
    try {
    Map<String, dynamic> responseBody;
      if (response.statusCode == 200) {
        responseBody = response.data;
        _showToast(context,responseBody['message']);
        Data userResponse=Data.fromJson(responseBody['data']);
        // return status;
        SPHelper.spHelper.setUSer(userResponse.toJson());

        Provider.of<AuthenticationProvider>(context, listen: false).changeLanguage(context,SPHelper.spHelper.getUSer().languageId);
      } else {
        _showToast(context,responseBody['error']);

      }
      // }else{
      //   status={'errorResponse':'register failed','status':false};
      //   return status;
      // }
    } catch (e) {
      final errorMessage = DioErrorType.response.toString();
      // print(errorMessage);
      // status = {'catchResponse': 'something went wrong', 'status': false};
      // return status;
    }
  }


  Future<MessageResponse> logout(context)async{
      try {
        Response response = await Settings.settings.dio.get(
            GET_CUSTOMER_LOGOUT_URL);
        if (response.statusCode == 200) {
          MessageResponse messageResponse = MessageResponse.fromJson(
              response.data);
          _showToast(context, messageResponse.message);
          SPHelper.spHelper.setLoged(false);
          NavigationService.navigationService.navigateAndReplaceWidget(
              LoginPage());
        } else {
          NavigationService.navigationService.navigateAndReplaceWidget(
              LoginPage());
          SPHelper.spHelper.setLoged(false);
        }
      } catch (e) {
        NavigationService.navigationService.navigateAndReplaceWidget(
            LoginPage());
        SPHelper.spHelper.setLoged(false);
          }
  }

  // Future<Map<String, dynamic>> supplierSign(
  //     String email, String password) async {
  //   final formData = {
  //     'email': email,
  //     'password': password,
  //     'token': true,
  //   };
  //   print(formData);
  //   SupplierLoginStatus loginStatus = SupplierLoginStatus();
  //   Response response = await Settings.settings.dio.post(SUPPLIER_LOGIN_URL, data: formData);
  //
  //   Map<String, dynamic> responseBody;
  //   Map<String, dynamic> status = Map<String, dynamic>();
  //
  //   try {
  //     responseBody = response.data;
  //     if (response.statusCode == 200) {
  //       print('loginJson${responseBody}');
  //       CustomerData userData = CustomerData();
  //       loginStatus = SupplierLoginStatus.fromJson(responseBody);
  //       // String token = responseBody["token"];
  //       Map map = responseBody["data"];
  //       userData = CustomerData.fromJson(map);
  //       print('userData${userData}');
  //       status = {'loginResponse': loginStatus, 'status': true};
  //       return status;
  //     } else if (response.statusCode == 401) {
  //       responseBody = response.data;
  //       // // print(responseBody["error"]);
  //       // // loginStatus = null;
  //       status = {'errorMessage': responseBody, 'status': false};
  //       return status;
  //     } else {
  //       status = {'errorMessage': 'login failed', 'status': false};
  //       return status;
  //     }
  //   } catch (e) {
  //     final errorMessage = DioErrorType.response.toString();
  //     print(errorMessage);
  //     // responseBody=response.extra;
  //     status = {'errorMessage': 'something went wrong', 'status': false};
  //     return status;
  //   }
  // }
  //
  // Future<Map<String, dynamic>> supplierRedister(
  //     String firstName,
  //     String lastName,
  //     String email,
  //     String password,
  //     String passwordConfirmation) async {
  //   final formData = {
  //     'first_name': firstName,
  //     'last_name': lastName,
  //     'email': email,
  //     'password': password,
  //     'password_confirmation': passwordConfirmation,
  //   };
  //   Response response = await Settings.settings.dio.post(SUPPLIER_REGISTER_URL, data: formData);
  //
  //   print(formData);
  //   Map<String, dynamic> responseBody;
  //   Map<String, dynamic> status = Map<String, dynamic>();
  //
  //   try {
  //     if (response.statusCode == 200) {
  //       responseBody = response.data;
  //       status = {'response': responseBody['message'], 'status': true};
  //       return status;
  //     } else {
  //       // Map<String, List<String>> responseBody;
  //       // responseBody = response.toString();
  //       // Map<String,dynamic> errors=responseBody["errors"][];
  //       status = {
  //         'errorResponse': 'The email has already been taken',
  //         'status': false
  //       };
  //       return status;
  //     }
  //     // }else{
  //     //   status={'errorResponse':'register failed','status':false};
  //     //   return status;
  //     // }
  //   } catch (e) {
  //     final errorMessage = DioErrorType.response.toString();
  //     // print(errorMessage);
  //     status = {'catchResponse': 'something went wrong', 'status': false};
  //     return status;
  //   }
  // }

  Future<Map<String, dynamic>> forgetPassword(BuildContext context,String email) async {
    final formData = {
      'email': email,
    };
    print(formData);
    try {
      Response response = await Settings.settings.dio.post( CUSTOMER_FORGET_PASSWORD_URL, data: formData);

      Map<String, dynamic> responseBody;
      if(response.statusCode==200){
        responseBody=response.data;
        _showToast(context, responseBody['message']);
        Navigator.of(context).pop();

     }else{
        responseBody=response.data;
        _showToast(context, responseBody['error']);
      }


    } catch (e) {
      final errorMessage = DioErrorType.response.toString();
      _showToast(context,errorMessage.toString());

      // print(errorMessage);
      // status = {'catchResponse': 'something went wrong', 'status': false};
      // return status;
    }
  }

  Future<Map<String, dynamic>> getLocals() async {
    Response response = await Settings.settings.dio.get(GET_LOCALS_URL);

    Map<String, dynamic> responseBody;
    Map<String, dynamic> status = Map<String, dynamic>();

    try {
      if(response.statusCode==200) {
        responseBody = response.data;
      }
    } catch (e) {
      final errorMessage = DioErrorType.response.toString();
      // print(errorMessage);
      status = {'catchResponse': 'something went wrong', 'status': false};
      return status;
    }
  }

  Future<Map<String, dynamic>> getCountriesState() async {
    Response response = await Settings.settings.dio.get(GET_COUNTRY_STATE_URL);

    Map<String, dynamic> responseBody;

    try {
      if(response.statusCode==200) {

        responseBody = response.data;

      }

    } catch (e) {
      final errorMessage = DioErrorType.response.toString();
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
