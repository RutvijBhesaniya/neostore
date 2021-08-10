import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class NeoStoreTitle extends StatelessWidget {
  NeoStoreTitle(
      {this.text,
      this.color,
      this.style,
      this.maxLine,
      this.validation});

  final String? text;
  final maxLine;
  final color;
  final style;
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
