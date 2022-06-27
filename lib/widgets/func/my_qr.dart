import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_collection/utils/my_colors.dart';
import 'package:flutter_collection/widgets/general/custom_input.dart';
import 'package:flutter_collection/widgets/general/custom_scaffold.dart';
import 'package:flutter_collection/widgets/general/header.dart';
import 'package:flutter_collection/widgets/general/helper.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qr_flutter/qr_flutter.dart';

class MyQr extends StatefulWidget {
  MyQr({Key? key}) : super(key: key);

  @override
  State<MyQr> createState() => _MyQrState();
}

class _MyQrState extends State<MyQr> {

  final TextEditingController _controller = TextEditingController();
  String _errTxt = '';
  bool _switch = false;
  String? _email;


  bool checkRegex() {
    final reg =
        RegExp(r"^[a-z0-9._-]+@[a-z0-9._-]+\.[a-z]{2,}$", multiLine: false);
    final regResult = reg.hasMatch(_controller.text);

    return regResult;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Column(
        children: [
          Header(
            canBack: true,
          ),
          input(),
          btn(),
          _switch 
          ? Expanded(
            child: qrImage()
          )
          : const SizedBox()
        ],
      )
    );
  }

  input() => Container(
    padding: const EdgeInsets.only(top: 50, bottom: 25, left: 25, right: 25),
    child: CustomInput(
      controller: _controller,
      placeholder: "E-mail",
      showTitle: true,
      canClear: true,
      errorText: _errTxt,
      inputChange: (value) {
        if(!checkRegex()) {
          _errTxt = 'Invalid email address';
        } else {
          _errTxt = '';
        }
        setState(() {});
      },
      onClear: () {
        _controller.clear();
        _errTxt = '';
        setState(() {});
      }
    ),
  );

  btn() => GestureDetector(
    child: Container(
      margin: const EdgeInsets.only(top: 20, bottom: 30),
      child: CupertinoSwitch(
        value: _switch, 
        onChanged: (value) {
          _switch = value;
          log('vluae is $value');
          setState(() {});
        },
        activeColor: MyColors.mainScarlet,
      ),
    ),
  );

  double scanArea = Helper.width < 400 || Helper.height < 400 ? 300 : 350;
  
  qrImage() => Container(
    margin: const EdgeInsets.only(top: 25),
    child: QrImage(
      size: scanArea,
      data: _controller.toString(),
    ),
  );
}