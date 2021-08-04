import 'package:flutter/material.dart';

class NeoStoreTextFormField extends StatelessWidget {
  NeoStoreTextFormField(
      {this.hintText,
      this.validation,
      this.obscureText = false,
      this.prefixIcon,
      this.suffixIcon,
      this.controller,
      this.hintstyle});

  final String? hintText;
  final validation;
  final bool obscureText;
  final prefixIcon;
  final suffixIcon;
  final controller;
  final hintstyle;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validation,
      obscureText: obscureText,
      decoration: new InputDecoration(
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
        // hintStyle: TextStyles.titleHeadline!.copyWith(
        //   color: ColorStyles.white,
        //   fontFamily: 'WorksSans',
        // ),
        hintStyle: hintstyle,
        hintText: hintText,

        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
