import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:neostore/utils/style.dart';

class NeoStoreTitleWithIcons extends StatelessWidget {
  NeoStoreTitleWithIcons(
      {this.text,
      this.color,
      this.style,
      this.maxLine,
      this.validation,
      this.icon,
      this.image});

  final String? text;
  final maxLine;
  final color;
  final style;
  final validation;
  final icon;
  final image;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 25,
          width: 30,

          child: Image(
            color: ColorStyles.white,
            fit: BoxFit.fill,
            image: AssetImage(image! ?? Container()),
          ),
        ),
        Icon(icon),
        Text(
          text!,
          maxLines: maxLine,
          overflow: TextOverflow.ellipsis,
          style: style,
        ),
      ],
    );
  }
}
