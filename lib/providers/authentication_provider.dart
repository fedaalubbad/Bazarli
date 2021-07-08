import 'package:flutter/cupertino.dart';

class AuthenticationProvider extends ChangeNotifier {
  bool isObscure = true;
  bool vaidate = true;
  final passwordContraller =TextEditingController();
  final nameContraller =TextEditingController();
  final emailContraller =TextEditingController();
  Map<String, dynamic> authData = {
    'email': '',
    'pass': '',
    'name': '',
  };
  GlobalKey<FormState> formStateKey = GlobalKey<FormState>();

  switchObscure() {
    isObscure = !isObscure;
    notifyListeners();
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
    authData['pass'] = val;
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

  void Sign() {
 if(onValidate()) {


 }
  }
}

enum AuthMode { signUp, login }
