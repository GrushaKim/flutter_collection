
import 'package:flutter/material.dart';
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

class _MainScreenState extends State<MainScreen> {

  int _selectedNavIdx = 0;
  DateTime _lastExitTime = DateTime.now();

  //FIXME: not back to the previous screen, but exit fully from the app.
  Future<bool> onWillPop() {
    if(DateTime.now().difference(_lastExitTime) >= Duration(seconds: 2)) {
      Fluttertoast.showToast(
        msg: Translator.pressToExit,
      );
      _lastExitTime = DateTime.now();
      return Future.value(false);
    }
    return Future.value(true);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: onWillPop,
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
            currentIndex: _selectedNavIdx,
            onTap: (idx) {
              setState(() {
                _selectedNavIdx = idx;
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

}