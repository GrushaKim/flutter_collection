import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_collection/screens/func.dart';
import 'package:flutter_collection/screens/home.dart';
import 'package:flutter_collection/screens/profile.dart';
import 'package:flutter_collection/screens/ui.dart';
import 'package:flutter_collection/utils/methods.dart';
import 'package:flutter_collection/utils/my_colors.dart';
import 'package:flutter_collection/utils/translator.dart';
import 'package:flutter_collection/widgets/helper.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> 
  with SingleTickerProviderStateMixin {

  DateTime _lastExitTime = DateTime.now();
  TabController? _controller;

  Future<bool> onWillPop() async {
    if(DateTime.now().difference(_lastExitTime) >= const Duration(seconds: 2)) {
      await Fluttertoast.showToast(
        msg: Translator.pressToExit,
      );
      _lastExitTime = DateTime.now();
      return Future.value(false);
    } else {
      Platform.isIOS ? exit(0) : SystemNavigator.pop();
      return Future.value(true);
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = TabController(
      vsync: this,
      initialIndex: 0,
      length: 4,
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: onWillPop,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          bottomNavigationBar: Container(
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.16),
                  spreadRadius: 0,
                  blurRadius: 12,
                  offset: const Offset(0, 3),
                ),
              ],
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(50),
              ),
            ),
            child: SalomonBottomBar(
              currentIndex: _controller!.index,
              onTap: (idx) {
                setState(() {
                  _controller!.index = idx;
                });
              },
              selectedItemColor: MyColors.mainScarlet,
              selectedColorOpacity: 1,
              unselectedItemColor: MyColors.pastelPink,
              items: [
                barItem(icon: Icons.home, title: 'Home'),
                barItem(icon: Icons.color_lens, title: 'UI'),
                barItem(icon: Icons.functions, title: 'Func'),
                barItem(icon: Icons.face, title: 'Profile'),
              ],
            ),
          ),
          extendBody: true,
          body: tabView(),
        ),
      ),
    );
  }

  barItem({
    required IconData icon,
    required String title,
  }) => SalomonBottomBarItem(
    icon: Icon(icon),
    activeIcon: Icon(icon, color: Colors.white),
    title: Text(title, style: Helper.theme.bodyText1?.copyWith(
      color: Colors.white,
      fontSize: 12,
      fontWeight: FontWeight.bold,
    )),
  );

  tabView() => TabBarView(
    physics: NeverScrollableScrollPhysics(),
    controller: _controller,
    children: [
      HomeScreen(),
      UIScreen(),
      FuncScreen(),
      ProfileScreen(),
    ],
  );

}