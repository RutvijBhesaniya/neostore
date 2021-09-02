import 'package:flutter/material.dart';

abstract class BaseClass extends StatefulWidget {
  const BaseClass({Key? key}) : super(key: key);

  @override
  BaseClassState createState() => getState();

  BaseClassState getState();
}

abstract class BaseClassState extends State<BaseClass> {
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: getAppBar() ?? SizedBox.shrink(),
        preferredSize: preferredSize,
      ),
      body: getBody(),
    );
  }

  Widget? getAppBar() {
    return null;
  }

  Widget getBody() {
    return Container();
  }
}
