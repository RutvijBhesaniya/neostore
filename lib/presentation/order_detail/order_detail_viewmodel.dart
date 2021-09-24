import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/data/api/entity/order_detail_entity.dart';
import 'package:neostore/domain/use_case/order_detail_use_case.dart';
import 'package:neostore/presentation/model/order_detail_item.dart';

class OrderDetailProvider extends ChangeNotifier {
  OrderDetailUseCase _orderDetailUseCase;

  OrderDetailProvider(this._orderDetailUseCase);

  OrderDetailItem? _orderDetailItem;

  OrderDetailItem? get orderDetailItem => _orderDetailItem;

  ApiError? _getOrderDetailError;

  ApiError? get getOrderDetailError => _getOrderDetailError;

  bool _isLoading = true;

  get isLoading => _isLoading;

  ///order detail method
  Future<void> getOrderDetail(int orderId) async {
    _isLoading = true;
    var response = await _orderDetailUseCase.callApi(orderId);
    if (response.isLeft) {
      _orderDetailItem = response.left;
      _isLoading = false;

    } else {
      _isLoading = false;
      _getOrderDetailError = response.right;
    }
    notifyListeners();
  }
}
