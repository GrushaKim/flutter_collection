import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_collection/widgets/helper.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';

class Roulettes extends StatefulWidget {
  @override
  _RoulettesState createState() => _RoulettesState();
}

class _RoulettesState extends State<Roulettes> {

  StreamController<int> controller = StreamController<int>();
  List<FortuneItem> items = [
    FortuneItem(child: Text('${r"$"}1000')),
    FortuneItem(child: Text('${r"$"}500')),
    FortuneItem(child: Text('${r"$"}100')),
    FortuneItem(child: Text('${r"$"}50')),
    FortuneItem(child: Text('${r"$"}10')),
    FortuneItem(child: Text('${r"$"}10')),
    FortuneItem(child: Text('${r"$"}1')),
    FortuneItem(child: Text('${r"$"}1')),
    FortuneItem(child: Text('${r"$"}1')),
  ];

  @override
  void initState() {
    items.shuffle();
    super.initState();
  }

  @override
  void dispose() {
    controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Helper.height * .4,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: FortuneWheel(
        selected: controller.stream,
        items: items,
      ),
    );
  }
}