import 'package:flutter/material.dart';

class NeoStoreDivider extends StatelessWidget {

  final color;
  final thickness;

  NeoStoreDivider({this.color, this.thickness});

  @override
  Widget build(BuildContext context) {
    return Divider(color: color,
    thickness: thickness,);
  }
}
