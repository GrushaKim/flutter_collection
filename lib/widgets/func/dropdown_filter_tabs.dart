import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_collection/model/func/quote.dart';
import 'package:flutter_collection/utils/my_colors.dart';
import 'package:flutter_collection/widgets/func/dropdown_controller.dart';
import 'package:flutter_collection/widgets/general/helper.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class DropdownFilterTabs extends GetView<DropdownController> {
  const DropdownFilterTabs({Key ? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        filters(),
        collapsed(),
      ],
    );
  }

  filters() => Container(
    height: 50,
    alignment: Alignment.centerRight,
    child: Obx(() => DropdownButton<dynamic>(
        value: controller.sort.value,
        borderRadius: BorderRadius.circular(8),
        elevation: 20,
        underline: const SizedBox.shrink(),
        dropdownColor: MyColors.dropdownBk,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        items: const [
          DropdownMenuItem(child: Text('All'), value: 'All'),
          DropdownMenuItem(child: Text('Dostoevsky'), value: 'Dostoevsky'),
          DropdownMenuItem(child: Text('Kuprin'), value: 'Kuprin'),
          DropdownMenuItem(child: Text('Gorky'), value: 'Gorky'),
        ],
        isDense: true,
        onChanged: (value) {
          if(value != null) {
            controller.resort(value);
          }
        },
      ),
    ),
  );

  collapsed() => Expanded(
    child: Obx(() => ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
        itemCount: controller.items.length,
        shrinkWrap: true,
        itemBuilder: (ctx, idx) {
          return quote(controller.items[idx]);
        },
      ),
    ),
  );





  quote(QuoteModel e) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
    margin: const EdgeInsets.symmetric(vertical: 15),
    decoration: BoxDecoration(
      color: MyColors.dropdownBk.withOpacity(0.4),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          e.quote,
          style: Helper.theme.bodyText1?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
            letterSpacing: -.8,
            height: 1.3,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          DateFormat('dd-MM-yyyy').format(e.createdAt).toString(),
          style: Helper.theme.caption?.copyWith(color: Colors.white.withOpacity(.5)),
        ),
      ],
    )
  );
}