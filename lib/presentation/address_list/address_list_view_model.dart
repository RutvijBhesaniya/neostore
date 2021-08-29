import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:neostore/data/model/response/order_address_response.dart';
import 'package:neostore/data/web_service/api_impl/order_address_api/order_address_api_impl.dart';
import 'package:neostore/data/web_service/repository/order_address_repository/order_address_repository_impl.dart';
import 'package:neostore/domain/order_address_use_case.dart';
import 'package:neostore/presentation/address_list/address_list_view.dart';

class AddressListProvider extends ChangeNotifier {
  OrderAddressUseCase _orderAddressUseCase = OrderAddressUseCase(
    OrderAddressRepositoryImpl(
      OrderAddressApiImpl(),
    ),
  );

  OrderAddressResponse? _orderAddressResponse;

  OrderAddressResponse? get orderAddressResponse => _orderAddressResponse;

  bool _isLoading = true;

  get isLoading => _isLoading;

  Future<dynamic> getOrderAddress(String address) async {
    _isLoading = true;
    var response = await _orderAddressUseCase.callApi(address);

    _isLoading = false;
    return response;

  }
}



class ChangeAddress with ChangeNotifier {
  int? _value;
  String? address;


  int? get currentValue => _value;
  String? get currentAddress => address;

  void changeModel(int type, String s) {
    _value = type;
    address = s;
    notifyListeners();
  }
}

