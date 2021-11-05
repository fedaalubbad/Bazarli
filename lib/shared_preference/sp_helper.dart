import 'dart:convert';
import 'package:bazarli/models/user_model/customer_status.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SPHelper {
  SPHelper._();
  static SPHelper spHelper = SPHelper._();
  SharedPreferences sharedPreferences;
  Future<SharedPreferences> initSharedPrefences() async {
    if (sharedPreferences == null) {
      sharedPreferences = await SharedPreferences.getInstance();
      return sharedPreferences;
    } else {
      return sharedPreferences;
    }
  }
  setLoged(bool loged){
    sharedPreferences.setBool('isLoged', loged);

  }
  bool isLoged(){
    bool isLog=sharedPreferences.getBool("isLoged") ?? false;
    return isLog;

  }
  setFirstLog(bool first){
    sharedPreferences.setBool('isFirst', first);

  }
  bool isFirstLog(){
    bool isFirst=sharedPreferences.getBool("isFirst") ?? false;
    return isFirst;

  }
  setUSer( Map<String,dynamic> user){

    sharedPreferences.setString('user', json.encode(user));

  }
  Data getUSer(){
    Map userMap = jsonDecode(sharedPreferences.getString('user'));
   Data user = Data.fromJson(userMap);
    return user;
  }

  setToken(String token){
    sharedPreferences.setString('token',token);

  }

  String getToken(){
    return sharedPreferences.getString('token');
  }


}