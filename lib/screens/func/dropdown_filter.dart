import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_collection/model/func/quote.dart';
import 'package:flutter_collection/utils/my_colors.dart';
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
      child: Column(
        children: [
          Header(
            canBack: true,
          ),
          title(),
          GetBuilder<DropdownController>(
            builder: (_) => DropdownFilterTabs(),
          )
        ],
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

