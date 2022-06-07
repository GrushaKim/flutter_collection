import 'package:flutter/cupertino.dart';
import 'package:flutter_collection/widgets/custom_scaffold.dart';

class UIScreen extends StatefulWidget {
  UIScreen({Key? key}) : super(key: key);

  @override
  State<UIScreen> createState() => _UIScreenState();
}

class _UIScreenState extends State<UIScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('UI')
    );
  }
}