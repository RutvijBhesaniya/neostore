import 'dart:convert';

import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/data/api/entity/add_address_entity.dart';
import 'package:neostore/data/api/entity/order_address_entity.dart';
import 'package:neostore/domain/use_case/order_address_use_case.dart';
import 'package:neostore/presentation/model/order_address_item.dart';
import 'package:neostore/utils/shared_preferences/memory_management.dart';

class OrderAddressListProvider extends ChangeNotifier {
  int? _value;
  String? address;

  OrderAddressUseCase _orderAddressUseCase;

  OrderAddressListProvider(this._orderAddressUseCase);

  int? get currentValue => _value;

  String? get currentAddress => address;

  bool _isLoading = true;

  get isLoading => _isLoading;

  List<AddressListEntity> _addAddressList = [];

  get addAddressList => _addAddressList;

  void changeModel(int type, String s) {
    _value = type;
    address = s;
    notifyListeners();
  }

  void getaddress(){
    if (MemoryManagement.getAddress() != null) {
      AddAddressEntity addAddressModel = AddAddressEntity.fromJson(
        jsonDecode(MemoryManagement.getAddress()!),
      );

      _addAddressList.addAll(addAddressModel.addressListEntity!);
    }
  }


  ///get order address method
  Future<Either<OrderAddressItem, ApiError>> getOrderAddress(
      String address) async {
    _isLoading = true;
    var response = await _orderAddressUseCase.callApi(address);

    if (response.isLeft) {
      OrderAddressItem _orderAddressItem = response.left;
      _isLoading = false;
      return Left(_orderAddressItem);
    } else {
      _isLoading = false;
      return Right(response.right);
    }
  }
}
