// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:localize_and_translate/localize_and_translate.dart';
//
//
// class LoginBtn extends StatelessWidget{
//
//   LoginBtn();
//   @override
//   Widget build(BuildContext context) {
//    return Container(
//      margin: EdgeInsets.symmetric(horizontal:25,vertical: 16),
//      width: double.infinity,
//      height: 40,
//      child: ElevatedButton(
//        child: Text(Provider.of<AuthProvider>(context,listen: false).authMode == AuthMode.login? translator.translate('SignIn').toUpperCase() : translator.translate('SignUp').toUpperCase(),),
//        style: ButtonStyle(
//          // padding: EdgeInsets.symmetric(horizontal: 30.0,vertical: 8),
//          backgroundColor:MaterialStateProperty.all(MyColors.redAccentColor),
//          textStyle:MaterialStateProperty.all(MyStyles.loginBtnStyle),
//            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                RoundedRectangleBorder(
//                    borderRadius: BorderRadius.circular(20.0),
//                    side: BorderSide(color: Colors.red)
//                ),
//            ),
//        ),
//        onPressed: ()async {
//          if (Provider.of<AuthProvider>(context,listen: false).authMode == AuthMode.login) {
//               await Provider.of<AuthProvider>(context, listen: false).submitLogin();
//            if (!Provider.of<AuthProvider>(context, listen: false).loginStatus['status']) {
//              Provider.of<AuthProvider>(context, listen: false).showErrorDialog(context,
//                  Provider.of<AuthProvider>(context,listen: false).errorMsg);
//            } else {
//
//            }
//          } else {
//            await Provider.of<AuthProvider>(context, listen: false).submitRegister();
//            if (!Provider.of<AuthProvider>(context, listen: false).registerStatus['status']) {
//              Provider.of<AuthProvider>(context, listen: false).showErrorDialog(context,
//                  Provider.of<AuthProvider>(context,listen: false).errorMsg);
//            } else {
//
//            }
//          }
//        }
//    ),
//    );
//   }
//
// }