import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/ui/Authentication/views_widgets/bottomWidget.dart';
import 'package:bazarli/ui/Authentication/views_widgets/midWidget.dart';
import 'package:bazarli/ui/Authentication/views_widgets/topWidget.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> _homeKey ;

  @override
  void initState() {
    super.initState();
    _homeKey = GlobalKey<FormState>(debugLabel: '_homeScreenkey');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: WhiteColor,
        child: SingleChildScrollView(
          child: Column(
            // mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
                  LoginTopWigget(),
                  LoginMidWidget(_homeKey),
                  LoginBottomWidget(),
            ],
          ),
        ),
      ),

    );
  }
}