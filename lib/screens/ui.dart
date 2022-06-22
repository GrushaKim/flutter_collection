import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_collection/constants/ui_item.dart';
import 'package:flutter_collection/routes/navigation_service.dart';
import 'package:flutter_collection/routes/routes.dart';
import 'package:flutter_collection/utils/my_colors.dart';
import 'package:flutter_collection/widgets/demo_popup.dart';
import 'package:flutter_collection/widgets/header.dart';
import 'package:flutter_collection/widgets/helper.dart';
import 'package:flutter_collection/widgets/ui/roulettes.dart';
import 'package:flutter_collection/widgets/ui/slot_machine.dart';
import 'package:get_it/get_it.dart';

class UIScreen extends StatefulWidget {
  const UIScreen({Key? key}) : super(key: key);

  @override
  State<UIScreen> createState() => _UIScreenState();
}

class _UIScreenState extends State<UIScreen> {

  final router = GetIt.I<NavigationService>();

  final items = [
    UIItem(title: 'Roulette', item: Roulettes()),
    UIItem(title: 'Numbers', item: Roulettes()),
    UIItem(title: 'Slot Machine', item: SlotMachine()),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Header(
          title: 'UI Components',
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

  component(UIItem ui) => InkWell(
    onTap: () {
      // router.navigate(item.route);
      popup(ui.item);
    },
    child: Container(
      width: Helper.width,
      padding: const EdgeInsets.symmetric(vertical: 25),
      margin: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
        color: MyColors.mainPurple.withOpacity(.5),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            ui.title,
            textAlign: TextAlign.center,
            style: Helper.theme.headline1?.copyWith(
              color: Colors.white,
            ),
          ),
        ],
      ),
    ),
  );

  popup(Widget widget) => showDialog(
    context: context, 
    builder: (ctx) => DemoPopup(
      item: widget,
    ),
  );


}