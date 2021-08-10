import 'package:flutter/material.dart';
import 'package:neostore/presentation/registerScreen/register_screen.dart';
import 'package:provider/provider.dart';

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

