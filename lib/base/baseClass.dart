import 'package:flutter/material.dart';

abstract class BaseClass extends StatefulWidget {
  const BaseClass({Key? key}) : super(key: key);

  @override
  BaseClassState createState() => getState();
  BaseClassState getState() ;
}

abstract class BaseClassState extends State<BaseClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      body: getBody(),
    );
  }

  AppBar? getAppBar(){
    return null;
  }

  Widget getBody() {
    return Container();
  }
}
