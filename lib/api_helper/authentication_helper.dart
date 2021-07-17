import 'package:bazarli/models/user_model/Data.dart';
import 'package:bazarli/models/user_model/LoginStatus.dart';
import 'package:dio/dio.dart';
import 'constants.dart';

class AuthenticationApi {
  AuthenticationApi._();

  static AuthenticationApi api = AuthenticationApi._();
  Dio dio = Dio();
  Options options=Options(headers : { "contentType":"application/json","Authorization":"Bearer "} );

  Future<LoginStatus> customerSign(String email,String password) async {
    final formData = {
      'email': email,
      'password': password,
    };
    print(formData);
    try {
      Response response = await dio.post(
          baseUrl + customerLogin,options: options, data: formData);
      Map<String, dynamic> responseBody = response.data;
      print('loginJson${responseBody}');
      LoginStatus loginStatus = LoginStatus();
      Data userData = Data();
      if (response.statusCode == 200) {
        loginStatus = LoginStatus.fromJson(responseBody);
        bool token = responseBody["token"];
        Map map = responseBody["data"];
        userData = Data.fromJson(map);
        print('userData${userData}');
      } else {
        print(responseBody['error']);
        loginStatus = null;
      }
      return loginStatus;
    }
    catch (e) {
      final errorMessage = DioErrorType.response.toString();
      print(errorMessage);
    }
  }

}