import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:neostore/data/model/response/table_category_response.dart';
import 'package:neostore/data/web_service/api_impl/table_category_api/table_category_api_impl.dart';
import 'package:neostore/data/web_service/repository/table_category_repository/table_category_repository_impl.dart';
import 'package:neostore/domain/table_category_use_case.dart';

class TableCategoryProvider extends ChangeNotifier {
  TableCategoryUseCase _tableCategoryUseCase =
      TableCategoryUseCase(TableCategoryRepositoryImpl(TableCategoryApiImpl()));

  late TableCategoryResponse _tableCategoryResponse;

  get tableCategoryResponse => _tableCategoryResponse;

  bool _isLoading = true;

  get isLoading => _isLoading;

  void getTableCategory(int productCategoryId) async {
    _isLoading = true;
    print("got is loading in line 22: " + _isLoading.toString());
    // var response = await Future.wait([_tableCategoryUseCase.callApi(productCategoryId)]);
    var response = await _tableCategoryUseCase.callApi(productCategoryId);
    print(response.runtimeType);
    _tableCategoryResponse = TableCategoryResponse.fromJson(jsonDecode(response));
    // print("got the table response in line 27: " + _tableCategoryResponse.toString());
    _isLoading = false;
    print("got is loading: " + _isLoading.toString());
    notifyListeners();
  }
}
