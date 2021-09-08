import 'dart:convert';
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
    var response = await _tableCategoryUseCase.callApi(productCategoryId);
    _tableCategoryResponse = TableCategoryResponse.fromJson(jsonDecode(response));
    _isLoading = false;
    notifyListeners();
  }
}
