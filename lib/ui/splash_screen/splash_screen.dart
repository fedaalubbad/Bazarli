import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/navigation_service/navigation_service.dart';
import 'package:bazarli/providers/BrandProvider.dart';
import 'package:bazarli/ui/Authentication/sign_screens/sign_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return SplashState();
  }
}
class SplashState extends State<SplashScreen>{
  navigationTohome(context) async{
    await Future.delayed(Duration(seconds:4));
    NavigationService.navigationService.navigateToWidget(SignScreen());
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) =>SignScreen()),
    // );
  }
  @override
  void initState() {
    Provider.of<BrandProvider>(context, listen: false). getAllBrandss();
    super.initState();
  }
  @override
  void didChangeDependencies() {
    navigationTohome(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
          color:BackgroundColor,
            child: Center(
                child: Image.asset("assets/images/app_logo.png")
            ),
      ),

    );

  }

}