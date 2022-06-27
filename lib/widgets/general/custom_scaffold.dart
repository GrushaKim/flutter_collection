import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    required this.child,
    this.bgColor,
  });

  final Widget child;
  final Color? bgColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor ?? Colors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: child,
      ),
    );
  }
}