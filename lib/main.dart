import 'package:bazarli/ViewModel/get_attribute_filter_provider.dart';
import 'package:bazarli/constants/MyColors.dart';
import 'package:bazarli/ViewModel/home_provider.dart';
import 'package:bazarli/ViewModel/Product_provider.dart';
import 'package:bazarli/ViewModel/addresses_provider.dart';
import 'package:bazarli/ViewModel/authentication_provider.dart';
import 'package:bazarli/ViewModel/orders_provider.dart';
import 'package:bazarli/ViewModel/reviews_provider.dart';
import 'package:bazarli/ViewModel/wishlist_provider.dart';
import 'package:bazarli/shared_preference/sp_helper.dart';
import 'package:bazarli/view/splash_screen/splash_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'api_helper/dio_settings.dart';
import 'navigation_service/navigation_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SPHelper.spHelper.initSharedPrefences();
  await Settings.settings.initDio();

  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: [
        Locale('en'),
        Locale('ar'),
      ],
      path:
          'assets/translations', // <-- change the path of the translation files
      fallbackLocale: Locale('ar'),
      // useOnlyLangCode: true,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthenticationProvider>(
          create: (context) => AuthenticationProvider(),
        ),
        ChangeNotifierProvider<ProductProvider>(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider<HomeProvider>(
          create: (context) => HomeProvider(),
        ),
        ChangeNotifierProvider<WishListProvider>(
          create: (context) => WishListProvider(),
        ),
        ChangeNotifierProvider<ReviewsProvider>(
          create: (context) => ReviewsProvider(),
        ),
        ChangeNotifierProvider<AddressesProvider>(
          create: (context) => AddressesProvider(),
        ),
        ChangeNotifierProvider<OrdersProvider>(
          create: (context) => OrdersProvider(),
        ),
        ChangeNotifierProvider<AttributeFilterProvider>(
          create: (context) => AttributeFilterProvider(),
        ),
        // ChangeNotifierProvider<TestProvider>(
        //   create: (context) => TestProvider(),
        // ),
      ],
      child: RefreshConfiguration(
        footerTriggerDistance: 15,
        dragSpeedRatio: 0.91,
        headerBuilder: () => MaterialClassicHeader(),
        footerBuilder: () => ClassicFooter(),
        enableLoadingWhenNoData: false,
        enableRefreshVibrate: false,
        enableLoadMoreVibrate: false,
        shouldFooterFollowWhenNotFull: (state) {
          // If you want load more with noMoreData state ,may be you should return false
          return false;
        },
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          title: 'Bazarli',
          theme: ThemeData(
            primaryColor: PrimaryColor,
            accentColor: CurveColor,
            indicatorColor: PrimaryColor,
            // primarySwatch: Colors.blue,
            textTheme: context.locale == 'ar'
                ? GoogleFonts.tajawalTextTheme(Theme.of(context).textTheme)
                : GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
          ),
          builder: (context, widget) {
            return MediaQuery(
              ///Setting font does not change with system font size
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: widget,
            );
          },
          navigatorKey: NavigationService.navigationService.navigatorKey,
          home: SplashScreen(),
          // home: ProductScreen(),
          // routes: { '/': (context) => MyHomePage(),
          //  },
        ),
      ),
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
        maxWidth: MediaQuery.of(context).size.width,
        maxHeight: MediaQuery.of(context).size.height,
      ),
      designSize: Size(360, 690),
      orientation: Orientation.portrait,
    );
    return Scaffold(
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
