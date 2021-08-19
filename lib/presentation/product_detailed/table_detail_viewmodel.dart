import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:neostore/data/model/response/table_detail_response.dart';
import 'package:neostore/data/web_service/api_impl/table_detail_api/table_detail_api_impl.dart';
import 'package:neostore/data/web_service/repository/table_detail_repository/table_detail_repository_impl.dart';
import 'package:neostore/domain/table_detail_use_case.dart';

class TableDetailProvider extends ChangeNotifier {
  TableDetailUseCase _tableDetailUseCase = TableDetailUseCase(
    TableDetailRepositoryImpl(TableDetailApiImpl()),
  );
  late TableDetailResponse _tableDetailResponse;

  get tableDetailResponse => _tableDetailResponse;

  bool _isLoading = true;

  get isLoading => _isLoading;

  void getTableDetail(int productId) async {
    _isLoading = true;
    var response = await _tableDetailUseCase.callApi(productId);
    _tableDetailResponse = TableDetailResponse.fromJson(jsonDecode(response.toString()));
    _isLoading = false; 
    notifyListeners();
  }
}
