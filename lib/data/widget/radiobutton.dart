import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RadioListValue {
  final int key;
  final String label;

  RadioListValue(this.key, this.label);
}

class ChangeColorModel with ChangeNotifier {
  RadioListValue _value = new RadioListValue(0, "Male");

  RadioListValue get currentValue => _value;

  void chageModel(RadioListValue m) {
    _value = m;
    notifyListeners();
  }
}

