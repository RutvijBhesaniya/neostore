import 'package:flutter/material.dart';
import 'package:neostore/data/web_service/api_impl/order_detail_api/order_detail_api_impl.dart';
import 'package:neostore/data/web_service/repository/order_detail_repository/order_detail_repository_impl.dart';
import 'package:neostore/domain/order_detail_use_case.dart';

class OrderDetailProvider extends ChangeNotifier {
  OrderDetailUseCase _orderDetailUseCase = OrderDetailUseCase(
    OrderDetailRepositoryImpl(
      OrderDetailApiImpl(),
    ),
  );



}
