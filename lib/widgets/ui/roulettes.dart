import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_collection/utils/my_colors.dart';
import 'package:flutter_collection/widgets/general/helper.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Roulettes extends StatefulWidget {
  @override
  _RoulettesState createState() => _RoulettesState();
}

class _RoulettesState extends State<Roulettes> {
  final items = [
    '${r"$"} 1000',
    '${r"$"} 500',
    '${r"$"} 100',
    '${r"$"} 50',
    '${r"$"} 10',
  ];
  StreamController<int> controller = StreamController<int>();
  int? _target;
  String? _result;
  int _cntRotation = 0;

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
    return Column(
      children: [
        wheel(),
        result(),
      ],
    );
  }

  wheel() => GestureDetector(
    onTap: () {
      if(_cntRotation < 3) {
        _target = Fortune.randomInt(0, items.length);
        controller.add(_target!); 
        _cntRotation++;
        setState(() {});
      } else {
        Fluttertoast.showToast(msg: 'Try it tomorrow as your limit reached 3 times.');
      }
    },
    child: Container(
      height: Helper.height * .4,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: FortuneWheel(
        rotationCount: 3,
        animateFirst: false,
        selected: controller.stream,
        duration: const Duration(seconds: 3),
        items: items.map((e) => fortuneItem(e) as FortuneItem).toList(),
        onAnimationEnd: () {
          _result = items[_target!];
          setState(() {});
          // Fluttertoast.showToast(msg: 'msg');
        },
        indicators: const [
          FortuneIndicator(
            child: TriangleIndicator(
              color: MyColors.mainScarlet,
            ),
            alignment: Alignment.topCenter
          ),
        ],
      ),
    ),
  );

  fortuneItem(String text) => FortuneItem(
    child: Text(text),
    style: FortuneItemStyle(
      color: MyColors.mainYellow,
      borderColor: MyColors.neonYellow,
      borderWidth: 7,
      textStyle: Helper.theme.button!.copyWith(fontSize: 20),
    )
  );

  result() => Container(
    margin: const EdgeInsets.only(top: 25),
    child: Column(
      children: [
        Text(
          'Congratulations!!!\n',
          style: Helper.theme.headline1!,
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'You have got ',
                style: Helper.theme.headline1,
              ),
              Text(
                _result ?? '',
                style: Helper.theme.headline1!.copyWith(color: MyColors.mainScarlet),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}