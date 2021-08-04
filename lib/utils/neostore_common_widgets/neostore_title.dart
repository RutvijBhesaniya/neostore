import 'package:flutter/material.dart';

class NeoStoreTitle extends StatelessWidget {
  NeoStoreTitle(
      {this.text,
      this.color,
      this.fontWeight,
      this.style,
      this.maxLine,
      this.fontFamily,
      this.validation});

  final String? text;
  final maxLine;
  final color;
  final fontWeight;
  final style;
  final fontFamily;
  final validation;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text!,
        maxLines: maxLine,
        overflow: TextOverflow.ellipsis,
        style: style,
      ),
    );
  }
}
