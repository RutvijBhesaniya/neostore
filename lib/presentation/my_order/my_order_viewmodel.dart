import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:neostore/data/model/response/order_list_response.dart';
import 'package:neostore/data/web_service/api_impl/order_list_api/order_list_api_impl.dart';
import 'package:neostore/data/web_service/repository/order_list_repository/order_list_repository_impl.dart';
import 'package:neostore/domain/order_list_use_case.dart';

class MyOrderProvider extends ChangeNotifier {
  OrderListUseCase _orderListUseCase = OrderListUseCase(
    OrderListRepositoryImpl(
      OrderListApiImpl(),
    ),
  );

  OrderListResponse? _orderListResponse;

  OrderListResponse? get orderListResponse => _orderListResponse;

  bool _isLoading = true;

  get isLoading => _isLoading;

  Future<dynamic> getOrderList() async {
    _isLoading = true;

    var response = await _orderListUseCase.callApi();
    print('orderrrrrrr=>${response.runtimeType}');

    _orderListResponse = OrderListResponse.fromJson(
      jsonDecode(response),
    );

    _isLoading = false;
    print('orderrrrrrrloading=>${_isLoading}');
    // return response;

    notifyListeners();
  }
}
