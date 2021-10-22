import 'package:bazarli/ViewModel/home_provider.dart';
import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/navigation_service/navigation_service.dart';
import 'package:bazarli/ViewModel/authentication_provider.dart';
import 'package:bazarli/shared_preference/sp_helper.dart';
import 'package:bazarli/view/home/home_main_screen.dart';
import 'package:bazarli/view/slider_splash/slider_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

class SplashScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return SplashState();
  }
}
class SplashState extends State<SplashScreen>{
  navigationTohome(BuildContext context) async{

    Provider.of<AuthenticationProvider>(context, listen: false).setLanguage(context.locale.toString());
    Provider.of<HomeProvider>(
      context,
      listen: false,
    ).getAllCategories(context);

    Provider.of<HomeProvider>(
      context,
      listen: false,
    ).getAllHomeCategories(context);

   Provider.of<HomeProvider>(
      context,
      listen: false,
    ).getSliders(context);
     Provider.of<HomeProvider>(
      context,
      listen: false,
    ).getAllBrandss(context);

    await Future.delayed(Duration(seconds:4));
    if(SPHelper.spHelper.isLoged())
      // NavigationService.navigationService.navigateAndReplaceWidget(LoginPage());
      NavigationService.navigationService.navigateAndReplaceWidget(HomeMainScreen(selectedPageIndex: 0,));
    else
      NavigationService.navigationService.navigateAndReplaceWidget(SliderScreen());



    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) =>SignScreen()),
    // );
  }
  @override
  void initState() {
    // Provider.of<HomeProvider>(context, listen: false). getAllCategories();

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
          color:HomeBackgroundColor,
            child: Center(
                child: Image.asset("assets/images/app_logo.png")
            ),
      ),

    );

  }

}