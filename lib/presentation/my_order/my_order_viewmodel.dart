import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:neostore/data/api/response/order_list_response.dart';
import 'package:neostore/domain/use_case/order_list_use_case.dart';

class MyOrderProvider extends ChangeNotifier {
  MyOrderListUseCase _myOrderListUseCase;

  MyOrderProvider(this._myOrderListUseCase);

  OrderListResponse? _orderListResponse;

  OrderListResponse? get orderListResponse => _orderListResponse;

  bool _isLoading = true;

  get isLoading => _isLoading;


 ///order list method
  Future<dynamic> getOrderList() async {
    _isLoading = true;

    var response = await _myOrderListUseCase.callApi();

    _orderListResponse = OrderListResponse.fromJson(
      jsonDecode(response),
    );

    _isLoading = false;

    notifyListeners();
  }
}
