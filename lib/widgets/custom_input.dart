import 'package:flutter/material.dart';
import 'package:flutter_collection/widgets/helper.dart';

class CustomInput extends StatelessWidget {
  CustomInput({
    this.onTap,
    this.errTxt,
    this.controller,
    this.focus,
  });

  VoidCallback? onTap;
  String? errTxt;
  TextEditingController? controller;
  FocusNode? focus;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          input(),
          errMsg(),
        ],
      ),
    );
  }

  input() => TextFormField(
    onTap: onTap,
    controller: controller,
    focusNode: focus,
    style: Helper.theme.bodyText1,
    // decoration: InputDecoration(

    // ),

  );

  errMsg() => Container(
    margin: EdgeInsets.only(top: 6),
    child: Text(
        errTxt ?? '',
        style: Helper.theme.caption?.copyWith(

        )
      )
  );
}