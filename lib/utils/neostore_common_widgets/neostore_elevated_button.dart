import 'package:flutter/material.dart';

class NeoStoreElevatedButton extends StatelessWidget {
  const NeoStoreElevatedButton(
      {Key? key, this.text, this.textStyle, this.buttonStyle, this.onPressed})
      : super(key: key);

  final String? text;
  final textStyle;
  final buttonStyle;
  final onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Text(
          text!,
          style: textStyle,
        ),
      ),
      style: buttonStyle,
    );
  }
}
