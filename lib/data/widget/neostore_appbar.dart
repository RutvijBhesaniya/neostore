import 'package:flutter/material.dart';

class NeoStoreAppBar extends StatefulWidget {
  NeoStoreAppBar({
    this.backgroundColour,
    this.text,
    this.leading,
    this.suffixIcon,
    this.onPressed,
    this.style,
  });

  final backgroundColour;
  final String? text;
  final leading;
  final suffixIcon;
  final onPressed;
  final style;

  @override
  _NeoStoreAppBarState createState() => _NeoStoreAppBarState();
}

class _NeoStoreAppBarState extends State<NeoStoreAppBar> {
  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(50);

  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: widget.backgroundColour,
      leading: widget.leading,
      title: Text(
        widget.text!,
        style: widget.style,
      ),
    );
  }
}
