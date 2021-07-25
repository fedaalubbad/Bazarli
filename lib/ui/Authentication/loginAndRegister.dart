import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/providers/authentication_provider.dart';
import 'package:bazarli/ui/Authentication/utils/BottomWaveClipper.dart';
import 'package:bazarli/ui/Authentication/views_widgets/bottomWidget.dart';
import 'package:bazarli/ui/Authentication/views_widgets/midWidget.dart';
import 'package:bazarli/ui/Authentication/views_widgets/topWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    Provider.of<AuthenticationProvider>(context, listen: false).authMode =
        AuthMode.login;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CurveColor,
      body: SafeArea(
        child: Stack(
          children: [
            ClipPath(
              clipper: BottomWaveClipper(value: 5),
              child: Container(
                color: WhiteColor,
                height: ScreenUtil.defaultSize.height / 1.2,
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 30.h, left: 20.w, right: 20.w),
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
            if (Provider.of<AuthenticationProvider>(context).isLoading)
              Positioned(
                top: 0,
                bottom: 0,
                left: 0,
                right: 0,
                child: Center(
                  child: CircularProgressIndicator(
                    color: PrimaryColor,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
