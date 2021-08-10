import 'package:bazarli/shared_preference/sp_helper.dart';
import 'package:dio/dio.dart';

class Settings {
  Settings._();
  static Settings settings = Settings._();
  final String baseurl = 'https://test.bazarli.com/api/';
  Dio dio;
  initDio() {
    String token = SPHelper.spHelper.getToken();
    dio = Dio();
    dio.options.baseUrl = baseurl;
    // dio.options.headers=getHeaders();
    dio.options.headers['Accept'] = 'application/json';
    dio.options.headers['Authorization'] = 'Bearer $token';
  }

  Map<String, dynamic> getHeaders() {
    String token = SPHelper.spHelper.getToken();
    Map<String, dynamic> headers = token == null
        ? {'Content-Type': 'application/json'}
        :
      {'Content-Type': 'application/json',
       'Authorization': 'Bearer $token'
    };
    return headers;
  }
}