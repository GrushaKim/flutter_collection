import 'package:flutter/material.dart';
import 'package:flutter_collection/routes/navigation_service.dart';
import 'package:get_it/get_it.dart';

class Helper {
  static final router = GetIt.I<NavigationService>();

  static double get width => MediaQuery.of(router.getContext()).size.width;
  static double get height => MediaQuery.of(router.getContext()).size.height;
  static TextTheme get theme => Theme.of(router.getContext()).textTheme;
}