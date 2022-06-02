
import 'package:flutter/material.dart';
import 'package:flutter_collection/widgets/custom_scaffold.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with SingleTickerProviderStateMixin {
  TabController? _controller;

  @override
  void initState() {
    super.initState();
    
    _controller = TabController(
      vsync: this,
      initialIndex: 0,
      length: 1, 
    );

  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(
      child: Text('hi'),
    );
  }
}