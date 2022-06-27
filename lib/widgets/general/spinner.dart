import 'package:flutter/material.dart';
import 'package:flutter_collection/utils/my_colors.dart';

class Spinner extends StatelessWidget {
  Spinner({this.color});

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 16,
      width: 16,
      child: Center(
        child: CircularProgressIndicator(
          strokeWidth: 3,
          backgroundColor: Colors.transparent,
          valueColor:
              AlwaysStoppedAnimation<Color>(color ?? MyColors.hintGr),
        ),
      ),
    );
  }
}
