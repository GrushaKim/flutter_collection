import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_collection/widgets/helper.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';

class Roulettes extends StatelessWidget {
  Roulettes({Key? key}) : super(key: key);

  StreamController<int> controller = StreamController<int>();
  List<FortuneItem> items = [
    FortuneItem(child: Text('Grusha')),
    FortuneItem(child: Text('Pasha')),
    FortuneItem(child: Text('Dasha')),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Helper.height * .4,
      child: FortuneWheel(
        selected: controller.stream,
        items: items,
      ),
    );
  }
}