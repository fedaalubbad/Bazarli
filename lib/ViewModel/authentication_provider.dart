import 'package:bazarli/api_helper/authentication_helper.dart';
import 'package:bazarli/models/user_model/customer_status.dart';
import 'package:bazarli/navigation_service/navigation_service.dart';
import 'package:bazarli/shared_preference/sp_helper.dart';
import 'package:bazarli/view/Authentication/loginAndRegister.dart';
import 'package:bazarli/view/Authentication/widgets/FormError.dart';
import 'package:bazarli/view/home/home_main_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AuthenticationProvider extends ChangeNotifier {
  final GlobalKey<FormState> formStateKey = GlobalKey<FormState>();
  final GlobalKey<FormState> formStateKey2 = GlobalKey<FormState>();
  final GlobalKey<FormState> profileFormStateKey = GlobalKey<FormState>();
  String editFName;
  String editLName;
  bool isLoading = false;
  bool isObscure = true;
  bool checkValue=false;
  bool vaidate = true;
  AuthMode authMode;
  Language language;
  int languageId=0;
  final passwordContraller = TextEditingController();
  final confirmPasswordContraller = TextEditingController();
  final fNameContraller = TextEditingController();
  final lNameContraller = TextEditingController();
  final emailContraller = TextEditingController();
  final emailForgetPassContraller = TextEditingController();
  final fNameContraller2 = TextEditingController();
  final lNameContraller2 = TextEditingController();
  String email2='';


  Map<String, dynamic> authData = {
    'fName': '',
    'lName': '',
    'email': '',
    'password': '',
    'confirmPassword': '',
  };
  switchObscure() {
    isObscure = !isObscure;
    notifyListeners();
  }


  switchCheckVal(val) {
    checkValue = !checkValue;
    notifyListeners();
  }

  setLanguage(String lang) {
    if (lang == 'en') {
      language = Language.English;
      // notifyListeners();
    } else {
      language = Language.Arabic;
      // notifyListeners();
    }
  }
  selectLanguage(String lang) {
    if (lang == 'en') {
      languageId=0;
      notifyListeners();
    } else {
      languageId=1;
      notifyListeners();
    }
  }

  switchLanguage(BuildContext context) {
    if (language == Language.English) {
      language = Language.Arabic;
      context.locale = Locale('ar');
      notifyListeners();
    } else {
      language = Language.English;
      context.locale = Locale('en');
      notifyListeners();
    }
  }
  changeLanguage(BuildContext context,int lang){
    if (lang ==5) {
      language = Language.Arabic;
      context.locale = Locale('ar');
      notifyListeners();
    } else {
      language = Language.English;
      context.locale = Locale('en');
      notifyListeners();
    }
  }

  switchMode() {
    if (authMode == AuthMode.login) {
      authMode = AuthMode.signUp;
      notifyListeners();
    } else {
      authMode = AuthMode.login;
      notifyListeners();
    }
  }

  bool onValidate() {
    if (!formStateKey.currentState.validate()) {
      vaidate = false;
      notifyListeners();
      return false;
    }

    formStateKey.currentState.save();
    vaidate = true;
    notifyListeners();
    return true;
  }

  saveEmail(val) {
    authData['email'] = val;
    notifyListeners();
  }

  saveEmail2(val) {
    email2 = val;
    notifyListeners();
  }

  savePassword(val) {
    authData['password'] = val;
    notifyListeners();
  }

  saveConfirmPassword(val) {
    authData['confirmPassword'] = val;
    notifyListeners();
  }

  saveFName(val) {
    authData['fName'] = val;
    notifyListeners();
  }

  saveLName(val) {
    authData['lName'] = val;
    notifyListeners();
  }
  saveFName2(val) {
    editFName = val;
    notifyListeners();
  }

  saveLName2(val) {
    editLName = val;
    notifyListeners();
  }

  String validateFName(val) {
    if (val.isEmpty) {
      return 'enter your first name';
    } else if (val.length < 2) {
      return ' first  name too short';
    }
    return null;
  }

  String validateLName(val) {
    if (val.isEmpty) {
      return 'enter your last name';
    } else if (val.length < 3) {
      return ' last name too short';
    }
    return null;
  }

  String validatePassword(val) {
    if (val.isEmpty || val.length <= 5) {
      return 'password too short!';
    }
    return null;
  }

  String validateConfirmPassword(val) {
    if (val.isEmpty || val.length <= 5) {
      return 'repeat password';
    } else if (val != passwordContraller.text) {
      return "password don't match";
    }
    return null;
  }

  String validateEmail(val) {
    if (val.isEmpty || !val.contains('@')) {
      return 'Invalid email';
    }
    return null;
  }
  String validateEmail2(val) {
    if (val.isEmpty || !val.contains('@')) {
      return 'Invalid email';
    }
    return null;
  }

  void customerSign(BuildContext context) async {
    this.isLoading = true;
    notifyListeners();
    if (!formStateKey.currentState.validate()) {
      this.isLoading = false;
      notifyListeners();
      // vaidate=false;
      // notifyListeners();
      return;
    }
  else if(!checkValue){
  _showToast(context,'you should accept privacy policy first');
  this.isLoading = false;
  notifyListeners();
  return;
  }
    formStateKey.currentState.save();
    // vaidate=true;
    Map<String,dynamic> response = await AuthenticationApi.api
        .customerSign(authData['email'], authData['password']);
    if (response['status'] == true) {
    LoginResponse loginStatus = response['loginResponse'];
    SPHelper.spHelper.setUSer(loginStatus.data.toJson());
    SPHelper.spHelper.setToken(loginStatus.token);
    _showToast(context, 'login successfully');

    this.isLoading = false;
    notifyListeners();
    SPHelper.spHelper.setLoged(true);
    NavigationService.navigationService
        .navigateAndReplaceWidget(HomeMainScreen(selectedPageIndex:0 ,));
    } else {
      this.isLoading = false;
      notifyListeners();
      print(response['errorMessage']);
      showErrorDialog(context, response['errorMessage']);
    }
  }

  void customerRegister(BuildContext context) async {
    this.isLoading = true;
    notifyListeners();
    if (!formStateKey.currentState.validate()) {
      this.isLoading = false;
      notifyListeners();

      return;
    }else if(!checkValue){
      _showToast(context,'you should accept privacy policy first');
      return;
    }

    formStateKey.currentState.save();
    // vaidate=true;
    Map<String, dynamic> response = await AuthenticationApi.api
        .customerRedister(
            authData['fName'],
            authData['lName'],
            authData['email'],
            authData['password'],
            authData['confirmPassword']);
    if (response['status'] == true) {
      print(response['response']);
      _showToast(context, response['response']);
      this.isLoading = false;
      notifyListeners();
      authMode = AuthMode.login;
    } else if (response['errorResponse'] != null) {
      showErrorDialog(context, response['errorResponse'].toString());
      print(response['errorResponse'].toString());
      this.isLoading = false;
      notifyListeners();
    } else {
      showErrorDialog(context, response['catchResponse'].toString());
      print(response['catchResponse'].toString());
      this.isLoading = false;
      notifyListeners();
    }
  }

  void forgetPassword(BuildContext context) async {
    this.isLoading = true;
    notifyListeners();
    if (!formStateKey2.currentState.validate()) {
      this.isLoading = false;
      notifyListeners();
      // vaidate=false;
      // notifyListeners();
      return;
    }

    formStateKey2.currentState.save();
    // vaidate=true;
    Map<String, dynamic> response = await AuthenticationApi.api
        .forgetPassword(context, email2,);
    this.isLoading = false;
    notifyListeners();
     }


    void editProfile(BuildContext context)async{
      if (!profileFormStateKey.currentState.validate()) {
        // this.isLoading = false;
        // notifyListeners();
        return;

      }
      profileFormStateKey.currentState.save();

      await AuthenticationApi.api.editProfile(context,firstName:editFName,
          lastName:editLName,languageId:languageId==0? 1:5);

    }

  void logout(context) async{
    await AuthenticationApi.api
        .logout(context);

  }

// user defined function
  void showErrorDialog(BuildContext context, errorMsg) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("Continue"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Error"),
      content: FormError(
        errors: [errorMsg],
      ),
      actions: [
        cancelButton,
      ],
    );
    showDialog(builder: (context) => alert, context: context);
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

enum AuthMode { signUp, login }
enum Language { English, Arabic }
