import 'package:flutter/material.dart';
import 'package:flutter_collection/utils/my_colors.dart';
import 'package:flutter_collection/widgets/general/helper.dart';
import 'package:flutter_collection/widgets/general/spinner.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    this.onTap,
    this.vp,
    this.hp,
    this.margin,
    this.width,
    this.height,
    this.bgColor,
    this.borderRadius,
    this.border,
    this.spinner = false,
    required this.text,
  });

  final VoidCallback? onTap;
  final double? vp;
  final double? hp;
  final EdgeInsets? margin;
  final double? width;
  final double? height;
  final Color? bgColor;
  final double? borderRadius;
  final Border? border;
  final bool spinner;
  // final String text;
  final Widget text;
  


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () {},
      child: Container(
        constraints: const BoxConstraints(minWidth: 80),
        padding: EdgeInsets.symmetric(
          vertical: vp ?? 12,
          horizontal: hp ?? 0,
        ),
        margin: margin,
        width: width,
        height: height ?? 50,
        decoration: BoxDecoration(
          color: bgColor ?? MyColors.mainScarlet,
          borderRadius: BorderRadius.circular(borderRadius ?? 8),
          border: border,
        ),
        child: spinner 
        ? Spinner() 
        : text, 
        // : Text(text, style: Helper.theme.button),
        alignment: Alignment.center,
      ),
    );
  }
}