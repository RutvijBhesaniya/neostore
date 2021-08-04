import 'package:flutter/material.dart';

class NeoStoreAppBar extends AppBar implements PreferredSizeWidget {
  NeoStoreAppBar({
    this.backgroundColour,
    this.text,
    this.leading,
    this.suffixIcon,
    this.onPressed,
    this.style,
  });

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(50);

  final backgroundColour;
  final String? text;
  final leading;
  final suffixIcon;
  final onPressed;
  final style;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: preferredSize,
        child: AppBar(
          backgroundColor: backgroundColour,
          title: Text(
            text!,
            style: style,
          ),
          centerTitle: true,
          leading: leading,
        ),
      ),
    );
  }
}
