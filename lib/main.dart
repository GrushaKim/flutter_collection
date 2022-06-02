import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_collection/routes/navigation_service.dart';
import 'package:flutter_collection/routes/routes.dart';
import 'package:flutter_collection/screens/splash.dart';
import 'package:flutter_collection/utils/locators.dart';
import 'package:flutter_collection/utils/my_colors.dart';
import 'package:get_it/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setUpLocators();
  await EasyLocalization.ensureInitialized();
  
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('en', 'RU'),
      ],
      fallbackLocale: const Locale('en', 'US'),
      path: 'assets/translations',
      child: MyApp(), 
    ),
  );
}

class MyApp extends StatelessWidget {
  final router = GetIt.I<NavigationService>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Collection by Grusha🥑',
      navigatorKey: router.navigatorKey,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      onGenerateRoute: Routes.generateRoute,
      onGenerateInitialRoutes: (_) => [
        Routes.generateRoute(RouteSettings(name: RouteNames.Splash)),
      ],
      theme: themeData(),
      home: const SplashScreen(),
    );
  }

  themeData() => ThemeData(
    textTheme: textTheme(),
  );

  textTheme() => const TextTheme(
    headline1: TextStyle(
      fontSize: 14,
      color: MyColors.txtBk,
      letterSpacing: -75,
    ),
    bodyText1: TextStyle(
      fontSize: 24,
      color: MyColors.txtBk,
      fontWeight: FontWeight.bold,
      letterSpacing: -1,
    ),
    caption: TextStyle(
      fontSize: 12,
      color:MyColors.hintGr,
      letterSpacing: -.7,
    ),
  );

}
