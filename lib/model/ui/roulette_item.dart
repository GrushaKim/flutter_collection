import 'package:flutter/material.dart';

class RouletteItem {
  final String? image;
  final int id;
  final String? text;
  final Color? color;

  RouletteItem({
    this.image,
    required this.id,
    this.text,
    this.color,
  });
}