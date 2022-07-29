import 'package:flutter/material.dart';
import 'package:flutter_collection/widgets/func/dropdown_controller.dart';
import 'package:flutter_collection/widgets/func/dropdown_filter_tabs.dart';
import 'package:flutter_collection/widgets/general/custom_scaffold.dart';
import 'package:flutter_collection/widgets/general/header.dart';
import 'package:flutter_collection/widgets/general/helper.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

class DropdownFilterScreen extends StatelessWidget{
  const DropdownFilterScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DropdownController());
    return CustomScaffold(
      bgColor: Colors.black.withOpacity(0.18),
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.0, 1.0),
              end: Alignment(0.0, -0.27),
              colors: [
                Color(0xff004b81),
                Color(0xff004376),
                Color(0xff00325d),
                Color(0xff00254b),
                Color(0xff001e40),
                Color(0xff001c3d)
              ],
              stops: [0.0, 0.071, 0.284, 0.505, 0.738, 1.0],
            ),
          ),
        child: Column(
          children: [
            Header(
              canBack: true,
            ),
            title(),
            Flexible(
              child: GetBuilder<DropdownController>(
                builder: (_) => const DropdownFilterTabs(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  title() => Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
    margin: const EdgeInsets.only(bottom: 20),
    child: Text(
      'VALUABLE QUOTES',
      style: Helper.theme.headline1?.copyWith(color: Colors.white),
    ),
  );


}

