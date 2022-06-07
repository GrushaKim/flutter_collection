import 'package:flutter/cupertino.dart';

class FuncScreen extends StatefulWidget {
  FuncScreen({Key? key}) : super(key: key);

  @override
  State<FuncScreen> createState() => _FuncScreenState();
}

class _FuncScreenState extends State<FuncScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Func')
    );
  }
}