import 'package:flutter/material.dart';
import 'package:neostore/presentation/register/register_view.dart';

class RadioListValue {
  final int key;
  final String label;

  RadioListValue(this.key, this.label);
}

class ChangeGender with ChangeNotifier {
  GenderTypes? _value;

  GenderTypes? get currentValue => _value;

  void changeModel(GenderTypes genderTypes) {
    _value = genderTypes;
    notifyListeners();
  }
}

