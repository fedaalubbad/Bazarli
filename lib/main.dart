import 'package:bazarli/providers/BrandProvider.dart';
import 'package:bazarli/providers/CategoriesProvider.dart';
import 'package:bazarli/providers/Product_provider.dart';
import 'package:bazarli/providers/authentication_provider.dart';
import 'package:bazarli/ui/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'navigation_service/navigation_service.dart';
import 'package:easy_localization/easy_localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
      EasyLocalization(
          supportedLocales: [Locale('en'), Locale('ar')],
          path: 'assets/translations', // <-- change the path of the translation files
          fallbackLocale: Locale('en'),
          // useOnlyLangCode: true,
          child:MyApp()
      )

  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      MultiProvider(
   providers: [
    ChangeNotifierProvider<AuthenticationProvider>(
    create: (context) => AuthenticationProvider(),
    ),
     ChangeNotifierProvider<ProductProvider>(
    create: (context) => ProductProvider(),
    ),
     ChangeNotifierProvider<BrandProvider>(
    create: (context) => BrandProvider(),
    ),
     ChangeNotifierProvider<CategoriesProvider>(
    create: (context) => CategoriesProvider(),
    ),
    ],
    child:
    MaterialApp(
     debugShowCheckedModeBanner: false,

     localizationsDelegates: context.localizationDelegates,
     supportedLocales: context.supportedLocales,
     locale: context.locale,

     title: 'Bazarli',
     theme: ThemeData(
        primarySwatch: Colors.blue,
           textTheme: context.locale == 'ar'
               ? GoogleFonts.tajawalTextTheme(Theme.of(context).textTheme)
               : GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
      ),
      navigatorKey: NavigationService.navigationService.navigatorKey,
     home: MyHomePage(),
     // routes: { '/': (context) => MyHomePage(),
     //  },

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
        orientation: Orientation.portrait
        );
    return   Scaffold(
      // appBar: AppBar(
      //   // Here we take the value from the MyHomePage object that was created by
      //   // the App.build method, and use it to set our appbar title.
      //   title: Text(widget.title),
      // ),
      body: SplashScreen(),
        // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
