
import 'package:flutter/material.dart';
import 'package:flutter_collection/constants/nav_menu.dart';
import 'package:flutter_collection/utils/my_colors.dart';
import 'package:flutter_collection/widgets/helper.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<NavMenu> menu = [
    NavMenu(icon: Icons.home, label: 'Home'),
    NavMenu(icon: Icons.color_lens, label: 'UI'),
    NavMenu(icon: Icons.functions, label: 'Functions'),
    NavMenu(icon: Icons.face, label: 'Profile'),
  ];

  int _selectedNavIdx = 0;

  willPopScope() {

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

    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        height: 70,
        padding: const EdgeInsets.symmetric(horizontal: 25),
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
            top: Radius.circular(24),
          ),
        ),
        child: navbar(),
        
        // BottomNavigationBar(
        //   items: options,
        //   type: BottomNavigationBarType.fixed,
        //   selectedItemColor: MyColors.mainScarlet,
        //   unselectedItemColor: MyColors.mainScarlet.withOpacity(.2),
        // ),
      ),
      // body: SafeArea(
    );
  }

  Widget navbar() => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [...menu]
      .asMap()
      .map(
        (idx, menu) => MapEntry(
          idx, 
          GestureDetector(
            onTap: () {
              setState(() {
                _selectedNavIdx = idx;
              });
            },
            behavior: HitTestBehavior.translucent,
            child: 
            
            AnimatedContainer(
              duration: const Duration(seconds: 1),
              curve: Curves.fastOutSlowIn,
              decoration: _selectedNavIdx == idx 
                ? BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  gradient: const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      MyColors.mainScarlet,
                      MyColors.pastelPink,
                    ]
                  ),
                )
                : null,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                child: Row(
                  children: [
                    Icon(
                      menu.icon,
                      size: 32,
                      color: _selectedNavIdx == idx
                      ? Colors.white
                      : MyColors.mainScarlet.withOpacity(.38),
                    ),
                    const SizedBox(width: 2),
                    _selectedNavIdx == idx
                    ? Text(
                      menu.label, 
                      style: Helper.theme.bodyText1?.copyWith(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                      ),
                    )
                    : Container()
                  ],
                ),
              ),
            ),
          ),
        ),
      )
      .values
      .toList(),
  );

}