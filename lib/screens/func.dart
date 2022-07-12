import 'package:flutter/material.dart';
import 'package:flutter_collection/constants/func_item.dart';
import 'package:flutter_collection/routes/navigation_service.dart';
import 'package:flutter_collection/routes/routes.dart';
import 'package:flutter_collection/utils/my_colors.dart';
import 'package:flutter_collection/widgets/general/header.dart';
import 'package:flutter_collection/widgets/general/helper.dart';
import 'package:get_it/get_it.dart';
import 'package:permission_handler/permission_handler.dart';

class FuncScreen extends StatefulWidget {
  FuncScreen({Key? key}) : super(key: key);

  @override
  State<FuncScreen> createState() => _FuncScreenState();
}

class _FuncScreenState extends State<FuncScreen> {
  final router = GetIt.I<NavigationService>();

  final items = [
    FuncItem(title: 'QR Scanner', route: RouteNames.QrScanner),
    FuncItem(title: 'My QR', route: RouteNames.MyQr),
    FuncItem(title: 'Riverpod', route: RouteNames.Riverpod),
    FuncItem(title: 'D-day Countdown', route: RouteNames.Dday),
  ];


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Header(
          title: 'Function Components',
        ),
        Container(
          padding: const EdgeInsets.all(25),
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: items.length,
              itemBuilder: (ctx, idx) => component(items[idx]),
            ),
          ),
      ],
    );
  }

  component(FuncItem item) => InkWell(
    onTap: () async {
      if(item.route == RouteNames.QrScanner) {
        if(await Permission.camera.request() != PermissionStatus.denied) {
          router.navigate(item.route);
        }
      } else {
        router.navigate(item.route);
      }
    },
    child: Container(
      width: Helper.width,
      padding: const EdgeInsets.symmetric(vertical: 25),
      margin: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        color: MyColors.mainScarlet.withOpacity(.38),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            item.title,
            textAlign: TextAlign.center,
            style: Helper.theme.headline1?.copyWith(
              color: Colors.white,
            ),
          ),
        ],
      ),
    ),
  );
}