import 'package:flutter/cupertino.dart';

class Header extends StatefulWidget {
  Header({
    required this.title,
    this.canBack,
  });

  final String title;
  final bool? canBack;

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Container(
    );
  }
}