import 'package:bazarli/api_helper/authentication_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:easy_localization/easy_localization.dart';

class AuthenticationProvider extends ChangeNotifier {
  final GlobalKey<FormState> formStateKey = GlobalKey<FormState>();
  bool isObscure = true;
  bool vaidate = true;
  AuthMode authMode;
  Language language;
  final passwordContraller =TextEditingController();
  final nameContraller =TextEditingController();
  final emailContraller =TextEditingController();
  Map<String, dynamic> authData = {
    'email': '',
    'pass': '',
    'name': '',
  };

  switchLanguage(BuildContext context){
    if(language==Language.English){
      language=Language.Arabic;
      context.locale=Locale('ar');
      notifyListeners();
    }else{
      language=Language.English;
      context.locale=Locale('en');
      notifyListeners();
    }
  }

  switchMode(){
    if(authMode==AuthMode.login){
      authMode=AuthMode.signUp;
      notifyListeners();
    }else{
      authMode=AuthMode.login;
      notifyListeners();
    }
  }

  bool onValidate() {
    if(!formStateKey.currentState.validate()){
      vaidate=false;
      notifyListeners();
      return false;
    }

    formStateKey.currentState.save();
    vaidate=true;
    notifyListeners();
    return true;
  }

  saveEmail(val) {
    authData['email'] = val;
    notifyListeners();
  }

  savePassword(val) {
    authData['password'] = val;
    notifyListeners();
  }

  saveName(val) {
    authData['name'] = val;
    notifyListeners();
  }

  String validateName(val) {
    if (val.isEmpty) {
      return 'enter your name';
    } else if (val.length < 4) {
      return 'too short name';
    }
    return null;
  }

  String validatePassword(val) {
    if (val.isEmpty || val.length <= 5) {
      return 'password too short!';
    }
    return null;
  }

  String validateEmail(val) {
    if (val.isEmpty || !val.contains('@')) {
      return 'Invalid email';
    }
    return null;
  }

  void customerSign(String email,String password) {
    if(!formStateKey.currentState.validate()){
      // vaidate=false;
      // notifyListeners();
      return;
    }

    formStateKey.currentState.save();
    // vaidate=true;
    AuthenticationApi.api.customerSign(email,password);

  }
}

enum AuthMode { signUp, login }
enum Language {English,Arabic}