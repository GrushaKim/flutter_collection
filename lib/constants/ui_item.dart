import 'package:flutter/material.dart';

class UIItem {
  final String title;
  final bool popup;
  final Widget? item;
  final String? route;

  UIItem({
    required this.title,
    this.popup = true,
    this.item,
    this.route,
  });
}