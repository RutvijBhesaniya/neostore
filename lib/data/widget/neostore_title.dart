import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class NeoStoreTitle extends StatelessWidget {
  NeoStoreTitle(
      {required this.text, this.color, this.style, this.maxLine, this.validation, this.overflow});

  final text;
  final maxLine;
  final color;
  final style;
  final validation;
  final overflow;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text.toString(),
        maxLines: maxLine,
        overflow: overflow,
        style: style,
      ),
    );
  }
}
