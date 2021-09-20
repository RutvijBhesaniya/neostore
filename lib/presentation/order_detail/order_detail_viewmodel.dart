import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:neostore/data/api/entity/order_detail_entity.dart';
import 'package:neostore/domain/use_case/order_detail_use_case.dart';

class OrderDetailProvider extends ChangeNotifier {

  OrderDetailUseCase _orderDetailUseCase;
  OrderDetailProvider(this._orderDetailUseCase);
  OrderDetailEntity? _orderDetailEntity;
  OrderDetailEntity? get orderDetailEntity => _orderDetailEntity;

  bool _isLoading = true;
  get isLoading => _isLoading;



  ///order detail method
  void getOrderDetail(int orderId) async{
    _isLoading = true;
    var response =await _orderDetailUseCase.callApi(orderId);
    _orderDetailEntity = OrderDetailEntity.fromJson(jsonDecode(response));
    _isLoading = false;
    notifyListeners();

  }
}
