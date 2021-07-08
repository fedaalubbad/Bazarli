import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/navigation_service/navigation_service.dart';
import 'package:bazarli/ui/Authentication/sign_screens/sign_screen.dart';
import 'package:bazarli/ui/slider_splash/slider_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return SplashState();
  }
}
class SplashState extends State<SplashScreen>{
  navigationTohome(context) async{
    await Future.delayed(Duration(seconds:5));
    // NavigationService.navigationService.navigateToWidget(SignScreen());
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>SignScreen()),
    );
  }
  @override
  Widget build(BuildContext context) {
    navigationTohome(context);
    return Scaffold(
      body: Center(
        child: Container(
          color:BackgroundColor,
            child: Image.asset("assets/images/app_logo.png")),
      ),
    );

  }

}