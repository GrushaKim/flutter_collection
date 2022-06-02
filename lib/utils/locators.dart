
import 'package:flutter_collection/routes/navigation_service.dart';
import 'package:get_it/get_it.dart';

void setUpLocators() {
  GetIt locator = GetIt.instance;

  locator.registerSingleton<NavigationService>(NavigationService());
    
}