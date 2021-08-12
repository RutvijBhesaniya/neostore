import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neostore/base/base_class.dart';

class StoreLocator extends BaseClass {
  @override
  BaseClassState getState() {
    return _StoreLocatorState();
  }
}

class _StoreLocatorState extends BaseClassState {
  @override
  Widget getBody() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        image: new DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('assets/images/storelocator.png'),
        ),
      ),
    );
  }
}
