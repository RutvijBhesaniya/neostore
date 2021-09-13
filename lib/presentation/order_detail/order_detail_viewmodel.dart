import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:neostore/data/model/response/order_detail_response.dart';
import 'package:neostore/data/web_service/api_impl/order_detail_api/order_detail_api_impl.dart';
import 'package:neostore/data/web_service/repository/order_detail_repository/order_detail_repository_impl.dart';
import 'package:neostore/domain/order_detail_use_case.dart';

class OrderDetailProvider extends ChangeNotifier {

  OrderDetailUseCase _orderDetailUseCase;
  OrderDetailProvider(this._orderDetailUseCase);
  OrderDetailResponse? _orderDetailResponse;
  OrderDetailResponse? get orderDetailResponse => _orderDetailResponse;

  bool _isLoading = true;
  get isLoading => _isLoading;


  void getOrderDetail(int orderId) async{
    _isLoading = true;
    var response =await _orderDetailUseCase.callApi(orderId);
    _orderDetailResponse = OrderDetailResponse.fromJson(jsonDecode(response));
    _isLoading = false;
    notifyListeners();

  }
}
