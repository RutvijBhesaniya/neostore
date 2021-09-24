import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/data/api/entity/order_list_entity.dart';
import 'package:neostore/domain/use_case/order_list_use_case.dart';
import 'package:neostore/presentation/model/order_list_item.dart';

class MyOrderProvider extends ChangeNotifier {
  MyOrderListUseCase _myOrderListUseCase;

  MyOrderProvider(this._myOrderListUseCase);

  OrderListItem? _orderListItem;

  OrderListItem? get orderListItem => _orderListItem;

  ApiError? _getMyOrderError;

  ApiError? get getMyOrderError => _getMyOrderError;

  bool _isLoading = true;

  get isLoading => _isLoading;

  ///order list method
  Future<void> getOrderList() async {
    _isLoading = true;

    var response = await _myOrderListUseCase.callApi();
    if (response.isLeft) {
      _orderListItem = response.left;
      _isLoading = false;
    } else {
      _isLoading = false;
      _getMyOrderError = response.right;
    }
    notifyListeners();
  }
}
