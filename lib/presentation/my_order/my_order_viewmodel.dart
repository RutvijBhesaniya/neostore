import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:neostore/data/api/entity/order_list_entity.dart';
import 'package:neostore/domain/use_case/order_list_use_case.dart';

class MyOrderProvider extends ChangeNotifier {
  MyOrderListUseCase _myOrderListUseCase;

  MyOrderProvider(this._myOrderListUseCase);

  OrderListEntity? _orderListEntity;

  OrderListEntity? get orderListEntity => _orderListEntity;

  bool _isLoading = true;

  get isLoading => _isLoading;


 ///order list method
  Future<dynamic> getOrderList() async {
    _isLoading = true;

    var response = await _myOrderListUseCase.callApi();

    _orderListEntity = OrderListEntity.fromJson(
      jsonDecode(response),
    );

    _isLoading = false;

    notifyListeners();
  }
}
