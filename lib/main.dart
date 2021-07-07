import 'package:bazarli/ui/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';

import 'package:localize_and_translate/localize_and_translate.dart';

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
    return MaterialApp(
      title: 'Bazarli',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: translator.delegates, // Android + iOS Delegates
      locale: translator.locale, // Active locale
      supportedLocales: translator.locals(), // Locals list
      theme: ThemeData(
        primarySwatch: Colors.blue,

      ),
      home: SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, @required this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Container(), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
