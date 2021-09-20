import 'package:flutter/material.dart';
import 'package:neostore/data/api/entity/order_address_entity.dart';
import 'package:neostore/domain/use_case/order_address_use_case.dart';

class OrderAddressListProvider extends ChangeNotifier {
  int? _value;
  String? address;

  OrderAddressUseCase _orderAddressUseCase;
  OrderAddressListProvider(this._orderAddressUseCase);

  int? get currentValue => _value;

  String? get currentAddress => address;

  OrderAddressEntity? _orderAddressEntity;

  OrderAddressEntity? get orderAddressEntity => _orderAddressEntity;

  bool _isLoading = true;

  get isLoading => _isLoading;

  void changeModel(int type, String s) {
    _value = type;
    address = s;
    notifyListeners();
  }

  ///get order address method
  Future<dynamic> getOrderAddress(String address) async {
    _isLoading = true;
    var response = await _orderAddressUseCase.callApi(address);

    _isLoading = false;
    return response;
  }
}
