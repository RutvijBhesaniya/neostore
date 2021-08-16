import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neostore/base/base_class.dart';
import 'package:neostore/utils/style.dart';

class ProductDetailed extends BaseClass {
  @override
  BaseClassState getState() {
    return _ProductDetailedState();
  }
}

class _ProductDetailedState extends BaseClassState {
  @override
  Widget getBody() {
    return SafeArea(
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 5,
            color: ColorStyles.dark_grey,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: MediaQuery.of(context).size.height / 1.7,
            color: Colors.pink,
          ),
          Flexible(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height/7,
                color: ColorStyles.light_red,
              ),
            ),
          )
        ],
      ),
    );
  }
}
