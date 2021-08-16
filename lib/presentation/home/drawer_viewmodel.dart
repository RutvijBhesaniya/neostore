import 'package:flutter/material.dart';

class DrawerProvider with ChangeNotifier {
  bool collapsed = false;

  bool get getCurrentDrawer => collapsed;

  void setCurrentDrawer(bool drawer) {
    collapsed = drawer;
    notifyListeners();
  }
}
