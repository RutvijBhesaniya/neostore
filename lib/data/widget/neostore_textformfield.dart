
import 'package:flutter/material.dart';

class NeoStoreTextFormField extends StatelessWidget {
  NeoStoreTextFormField({
    this.hintText,
    this.validation,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.controller,
    this.hintStyle,
    this.textStyle,
    this.errorStyle,
    this.maxLine,
    this.fillColor, this.inputFormatters,
  });


  final String? hintText;
  final validation;
  final bool obscureText;
  final prefixIcon;
  final suffixIcon;
  final controller;
  final hintStyle;
  final textStyle;
  final errorStyle;
  final maxLine;
  final fillColor;
  final inputFormatters;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: textStyle,
      inputFormatters: inputFormatters,
      controller: controller,
      validator: validation,
      obscureText: obscureText,
      maxLines: maxLine,
      decoration: new InputDecoration(
        filled: true,
        fillColor: fillColor,
        errorStyle: errorStyle,
        errorBorder: new OutlineInputBorder(
          borderSide: new BorderSide(
            color: Colors.white,
            width: 1,
          ),
        ),
        focusedErrorBorder: new OutlineInputBorder(
          borderSide: new BorderSide(
            color: Colors.white,
            width: 1,
          ),
        ),
        enabledBorder: new OutlineInputBorder(
          borderSide: new BorderSide(
            color: Colors.white,
            width: 1,
          ),
        ),
        focusedBorder: new OutlineInputBorder(
          borderSide: new BorderSide(
            color: Colors.white,
            width: 1,
          ),
        ),
        hintStyle: hintStyle,
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
