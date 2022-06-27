import 'package:easy_localization/easy_localization.dart';

class Translator {
  // Splash 
  static String get welcome => 'welcome'.tr();
  
  // Home
  static String get chooseLang => 'chooseLang'.tr();
  static void langTxt(String lang) => 'langTxt'.tr(namedArgs: {'lang' : lang});

  static String get confirm => 'yes'.tr();
  static String get no => 'no'.tr();
  static String get yes => 'yes'.tr();


  static String get pressToExit => 'pressToExit'.tr();
  static String get cameraPermission => 'cameraPermission'.tr();
}