import 'package:easy_localization/easy_localization.dart';

class Translator {
  // Splash 
  static String get welcome => 'welcome'.tr();
  
  // Home
  static String get chooseLang => 'chooseLang'.tr();
  static void langTxt(String lang) => 'langTxt'.tr(namedArgs: {'lang' : lang});

  static String get pressToExit => 'pressToExit'.tr();
}