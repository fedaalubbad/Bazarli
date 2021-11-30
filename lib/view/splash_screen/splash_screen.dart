import 'package:bazarli/ViewModel/home_provider.dart';
import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/navigation_service/navigation_service.dart';
import 'package:bazarli/ViewModel/authentication_provider.dart';
import 'package:bazarli/shared_preference/sp_helper.dart';
import 'package:bazarli/view/home/home_main_screen.dart';
import 'package:bazarli/view/slider_splash/slider_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashState();
  }
}

class SplashState extends State<SplashScreen> {
  navigationTohome(BuildContext context) async {

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

    await Future.delayed(Duration(seconds:5)).then((value) {
      Provider.of<AuthenticationProvider>(context, listen: false).setLanguage(context.locale.toString());
      if (!SPHelper.spHelper.isFirstLog()) {
        NavigationService.navigationService
            .navigateAndReplaceWidget(SliderScreen());
        SPHelper.spHelper.setFirstLog(true);
        Provider.of<AuthenticationProvider>(
          context,
          listen: false,
        ).getProfile(SPHelper.spHelper.getUSer().id);
      } else {
        NavigationService.navigationService
            .navigateAndReplaceWidget(HomeMainScreen(
          selectedPageIndex: 0,
        ));
      }
    });
  }

  @override
  void initState() {
    navigationTohome(context);
    super.initState();
  }

  // @override
  // void didChangeDependencies() {
  //   navigationTohome(context);
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width,
        maxHeight: MediaQuery.of(context).size.height,
      ),
      designSize: Size(360, 690),
      orientation: Orientation.portrait,
    );
    return SafeArea(
        child: Scaffold(
            body: Container(
      height: double.infinity,
      width: double.infinity,
      color: HomeBackgroundColor,
      child: Center(child: Image.asset("assets/images/app_logo.png")),
    )));
  }
}
