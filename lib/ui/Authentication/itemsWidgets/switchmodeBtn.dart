// import 'package:flutter/cupertino.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:localize_and_translate/localize_and_translate.dart';
//
//
// class SwitchModeBtn extends StatelessWidget{
//
//   SwitchModeBtn();
//   @override
//   Widget build(BuildContext context) {
//    return Consumer<AuthProvider>(
//       builder: (ctx, provider, _) => RichText(
//         text:TextSpan(text:provider.authMode==AuthMode.login?translator.translate('haveAccount')
//             :translator.translate('haveNoAccount'),
//           style: MyStyles.descTextStyle,
//           children: [
//             TextSpan(text:provider.authMode==AuthMode.login?translator.translate('SignUp'):translator.translate('SignIn'),
//                 style: MyStyles.redTextStyle,
//                 recognizer: TapGestureRecognizer()
//                   ..onTap =provider.switchMode
//             ),
//
//
//           ],),
//         textAlign: TextAlign.center,
//       ),
//     );
//
//
//   }
//
// }