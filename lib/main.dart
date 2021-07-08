import 'package:bazarli/providers/authentication_provider.dart';
import 'package:bazarli/ui/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';
import 'navigation_service/navigation_service.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await translator.init(
    localeDefault: LocalizationDefaultType.device,
    languagesList: <String>['ar', 'en'],
    assetsDirectory: 'assets/langs/',
    apiKeyGoogle: '<Key>', // NOT YET TESTED
  );
  runApp(
      LocalizedApp(
          child:MyApp()
      ));
}

class MyApp extends StatelessWidget {
  final locales = [
    Locale('en', 'EN'),
    Locale('ar', 'AR'),
  ];
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
   providers: [
    ChangeNotifierProvider<AuthenticationProvider>(
    create: (context) => AuthenticationProvider(),
    ),
    ],
    child: MaterialApp(
      title: 'Bazarli',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: translator.delegates, // Android + iOS Delegates
      locale: translator.locale, // Active locale
      supportedLocales: translator.locals(), // Locals list
      theme: ThemeData(
        primarySwatch: Colors.blue,

      ),
      // home: MyHomePage(),
      navigatorKey: NavigationService.navigationService.navigatorKey,
      routes: { '/': (context) => MyHomePage(), },

    )
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery
                .of(context)
                .size
                .width,
            maxHeight: MediaQuery
                .of(context)
                .size
                .height),
        designSize: Size(360, 690),
        orientation: Orientation.portrait);
    return Scaffold(
      // appBar: AppBar(
      //   // Here we take the value from the MyHomePage object that was created by
      //   // the App.build method, and use it to set our appbar title.
      //   title: Text(widget.title),
      // ),
      body: SplashScreen(), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
