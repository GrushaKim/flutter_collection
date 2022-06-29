import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter_collection/utils/my_colors.dart';
import 'package:flutter_collection/widgets/general/custom_input.dart';
import 'package:flutter_collection/widgets/general/custom_scaffold.dart';
import 'package:flutter_collection/widgets/general/header.dart';
import 'package:flutter_collection/widgets/general/helper.dart';
import 'package:qr_flutter/qr_flutter.dart';

class RiverpodScreen extends StatefulWidget {
  RiverpodScreen({Key? key}) : super(key: key);

  @override
  State<RiverpodScreen> createState() => _RiverpodScreenState();
}

class _RiverpodScreenState extends State<RiverpodScreen> {

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
         
        ],
      )
    );
  }

}