import 'package:flutter/material.dart';

class NeoStoreAppBar extends StatefulWidget {
  NeoStoreAppBar({
    this.backgroundColour,
    this.text,
    this.leading,
    this.suffixIcon,
    this.onPressed,
    this.style,
    this.actions, this.elevation,
  });

  final backgroundColour;
  final String? text;
  final elevation;
  final leading;
  final suffixIcon;
  final onPressed;
  final style;
  final actions;

  @override
  _NeoStoreAppBarState createState() => _NeoStoreAppBarState();
}

class _NeoStoreAppBarState extends State<NeoStoreAppBar> {

  Size get preferredSize => const Size.fromHeight(50);

  Widget build(BuildContext context) {
    return AppBar(
      elevation: widget.elevation,
      backgroundColor: widget.backgroundColour,
      leading: widget.leading,
      title: Text(
        widget.text!,
        style: widget.style,
      ),
      actions: widget.actions,
    );
  }
}
