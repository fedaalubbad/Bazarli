import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/providers/authentication_provider.dart';
import 'package:bazarli/ui/Authentication/views_widgets/bottomWidget.dart';
import 'package:bazarli/ui/Authentication/views_widgets/midWidget.dart';
import 'package:bazarli/ui/Authentication/views_widgets/topWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {

  @override
  void initState() {
    Provider.of<AuthenticationProvider>(context, listen: false).authMode=AuthMode.login;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HomeBackgroundColor,
      body: SafeArea(
       child: Stack(
         children: [
           ClipPath(
             clipper: WaveClipperTwo(),
             child: Container(
               color: WhiteColor,
               height: ScreenUtil.defaultSize.height/1.2,
             ),
           ),

           Container(
            padding: EdgeInsets.only(top: 30.h,left: 20.w,right:20.w),
            // color: WhiteColor,
            child: SingleChildScrollView(
              child: Column(
                // mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                      LoginTopWigget(),
                      LoginMidWidget(),
                      LoginBottomWidget(),
                ],
              ),
            ),
      ),
         ],
       ),
      )
    );
  }
}