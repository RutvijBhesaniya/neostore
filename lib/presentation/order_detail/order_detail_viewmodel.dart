import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:neostore/data/api/response/order_detail_response.dart';
import 'package:neostore/domain/use_case/order_detail_use_case.dart';

class OrderDetailProvider extends ChangeNotifier {

  OrderDetailUseCase _orderDetailUseCase;
  OrderDetailProvider(this._orderDetailUseCase);
  OrderDetailResponse? _orderDetailResponse;
  OrderDetailResponse? get orderDetailResponse => _orderDetailResponse;

  bool _isLoading = true;
  get isLoading => _isLoading;



  ///order detail method
  void getOrderDetail(int orderId) async{
    _isLoading = true;
    var response =await _orderDetailUseCase.callApi(orderId);
    _orderDetailResponse = OrderDetailResponse.fromJson(jsonDecode(response));
    _isLoading = false;
    notifyListeners();

  }
}
