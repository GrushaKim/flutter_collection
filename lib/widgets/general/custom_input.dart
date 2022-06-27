import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_collection/utils/my_colors.dart';
import 'package:flutter_collection/widgets/general/helper.dart';


class CustomInput extends StatefulWidget {
  CustomInput({
    this.placeholder,
    this.controller,
    this.width,
    this.topPadding = 20,
    this.maxLength,
    this.focus,
    this.nextFocus,
    this.inputChange,
    this.obscure = false,
    this.disable = false,
    this.onTap,
    this.showBorder = true,
    this.showTitle = false,
    this.labelStyle,
    this.contentPadding,
    this.canClear = true,
    this.onClear,
    this.errorText,
    this.formatters,
    this.next = true,
    this.hint,
    this.fontSize,
  });

  final String? placeholder;
  final TextEditingController? controller;
  final double? width;
  final double? topPadding;
  final int? maxLength;
  final FocusNode? focus;
  final FocusNode? nextFocus;
  final ValueChanged<String>? inputChange;
  final bool obscure;
  final VoidCallback? onClear;
  final bool disable;
  final VoidCallback? onTap;
  final bool showBorder;
  final bool showTitle;
  final TextStyle? labelStyle;
  final EdgeInsets? contentPadding;
  final bool canClear;
  final String? errorText;
  final List<FilteringTextInputFormatter>? formatters;
  final bool next;
  final String? hint;
  final double? fontSize;

  @override
  _CustomInputState createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [input(), widget.errorText != null ? errMsg() : Container()],
      ),
    );
  }

  errMsg() => Container(
        margin: const EdgeInsets.only(top: 5),
        child: Text(
          widget.errorText ?? '',
          style: const TextStyle(
            color: MyColors.txtRed,
            fontSize: 14,
          ),
        ),
      );

  input() => TextFormField(
        onTap: widget.onTap,
        enabled: !widget.disable,
        controller: widget.controller,
        focusNode: widget.focus,
        cursorColor: Colors.transparent,
        cursorWidth: 0,
        decoration: InputDecoration(
          hintText: widget.hint,
          hintStyle: TextStyle(
            color: MyColors.hintGr.withOpacity(.4),
            fontSize: 24,
          ),
          labelText: widget.showTitle ? widget.placeholder : '',
          labelStyle: widget.labelStyle ?? const TextStyle(
            color: MyColors.mainScarlet,
            fontSize: 18,
          ),
          focusedBorder: inputBorder(focus: true),
          enabledBorder: inputBorder(),
          border: inputBorder(),
          counterText: '',
          contentPadding:
              widget.contentPadding ?? const EdgeInsets.only(left: 0.5, bottom: 5),
          suffix: widget.canClear && widget.controller!.text != '' && widget.controller!.text != ''
              ? GestureDetector(
                  onTap: widget.onClear ??  () =>
                      widget.controller!.clear(),
                  child: const Icon(Icons.highlight_off, color: MyColors.pastelPink)
                )
              : const SizedBox(),
        ),
        style: const TextStyle(
          color: MyColors.txtBk,
          fontSize: 24,
        ),
        inputFormatters: widget.formatters,
        maxLength: widget.maxLength,
        keyboardType: TextInputType.number,
        onChanged: widget.inputChange,
        obscureText: widget.obscure,
        textInputAction:
            widget.next ? TextInputAction.next : TextInputAction.done,
      );

  inputBorder({focus = false}) => UnderlineInputBorder(
        borderSide: widget.showBorder
            ? BorderSide(
                color: focus
                    ? widget.errorText != null
                        ? MyColors.hintGr.withOpacity(.4)
                        : MyColors.mainScarlet
                    : MyColors.hintGr.withOpacity(.4),
                width: 1,
              )
            : BorderSide.none,
      );
}
