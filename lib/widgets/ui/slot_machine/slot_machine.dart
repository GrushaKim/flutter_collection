import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_collection/widgets/helper.dart';
import 'package:flutter_collection/widgets/ui/slot_machine/roll_slot_controller.dart';

class SlotMachine extends StatefulWidget {
  SlotMachine({Key? key}) : super(key: key);

  @override
  State<SlotMachine> createState() => _SlotMachineState();
}

class _SlotMachineState extends State<SlotMachine> {

  List<int> values = List.generate(10, (idx) => idx);

  late var _controller = RollSlotController();
  late var _controller1 = RollSlotController();
  late var _controller2 = RollSlotController();
  late var _controller3 = RollSlotController();

  final random = Random();

  final List<String> emojiList = [
    '😍',
    '🤩',
    '😘',
    '😗',
    '☺',
    '😚',
    '😙',
    '🥲',
    '😋',
    '😛',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Helper.height * .4,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text('Slot')
    );
  }
}