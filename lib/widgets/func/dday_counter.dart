import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_collection/utils/my_colors.dart';

class DdayCounter extends StatefulWidget {
  DdayCounter({Key? key}) : super(key: key);

  @override
  State<DdayCounter> createState() => _DdayCounterState();
}

class _DdayCounterState extends State<DdayCounter> {

  showDatePicker() async {
    await showCupertinoDialog(
      context: context, 
      builder: (ctx) => CupertinoDatePicker(
        maximumYear: 2030,
        minimumYear: 2022,
        dateOrder: DatePickerDateOrder.dmy,
        backgroundColor: MyColors.hintGr,
        onDateTimeChanged: (value) {

        },
        initialDateTime: DateTime.now().toLocal(),
      )
    );
  }


  @override
  void initState() {
    super.initState();
    showDatePicker();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}