import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/navigation_service/navigation_service.dart';
import 'package:bazarli/ui/slider_splash/slider_screen.dart';
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
    NavigationService.navigationService.navigateToWidget(SliderScreen());

  }
  @override
  Widget build(BuildContext context) {
    navigationTohome(context);
    return Scaffold(
      backgroundColor: BackgroundColor,
      body: Center(
        child: Container(
            child: Image.asset("assets/images/app_logo.png")),
      ),
    );

  }

}