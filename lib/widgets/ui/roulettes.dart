import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_collection/model/ui/roulette_item.dart';
import 'package:flutter_collection/utils/my_colors.dart';
import 'package:flutter_collection/widgets/general/helper.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';

class Roulettes extends StatefulWidget {
  @override
  _RoulettesState createState() => _RoulettesState();
}

class _RoulettesState extends State<Roulettes> {

  final items = [
    RouletteItem(id: 1, text: '${r"$"} 1000', color: MyColors.mainScarlet),
    RouletteItem(id: 2, text: '${r"$"} 500', color: MyColors.mainPurple),
    RouletteItem(id: 3, text: '${r"$"} 100', color: MyColors.neonYellow),
    RouletteItem(id: 4, text: '${r"$"} 50', color: MyColors.mainBlue),
    RouletteItem(id: 5, text: '${r"$"} 10', color: MyColors.pastelPink),
    RouletteItem(id: 6, image: 'assets/dog.json', color: MyColors.mainYellow),
  ];
  // final items = [
  //   '${r"$"} 1000',
  //   '${r"$"} 500',
  //   'assets/dog.json',
  //   '${r"$"} 50',
  //   '${r"$"} 10',
  // ];

  StreamController<int> controller = StreamController<int>();
  int? _target;
  RouletteItem? _result;
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
        _cntRotation > 0 
        ? result()
        : const SizedBox(),
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
        rotationCount: 15,
        animateFirst: false,
        selected: controller.stream,
        duration: const Duration(seconds: 5),
        items: items
          .asMap()
          .map((idx, e) => MapEntry(idx, fortuneItem(idx, e) as FortuneItem))
          .values
          .toList(),
        onAnimationEnd: () {
          _result = items[_target!];
          setState(() {});
          // Fluttertoast.showToast(msg: 'msg');
        },
        indicators: const [
          FortuneIndicator(
            child: TriangleIndicator(
              color: Colors.black,
            ),
            alignment: Alignment.topCenter
          ),
        ],
      ),
    ),
  );

  fortuneItem(int idx, RouletteItem item) => FortuneItem(
    child: item.image != null
    ? Lottie.asset(item.image!, height: 74)
    : Text(item.text!),
    style: FortuneItemStyle(
      color: item.color ?? MyColors.mainScarlet,
      borderColor: Colors.white,
      borderWidth: 7,
      textStyle: Helper.theme.button!.copyWith(fontSize: 20),
    ),
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
                _result?.text ?? 'Nothing' ,
                style: Helper.theme.headline1!.copyWith(color: MyColors.mainScarlet),
              ),
              Text(' !', style: Helper.theme.headline1)
            ],
          ),
        ),
      ],
    ),
  );
}