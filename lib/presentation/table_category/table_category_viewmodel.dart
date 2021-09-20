import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:neostore/data/api/entity/table_category_entity.dart';
import 'package:neostore/domain/use_case/table_category_use_case.dart';

class TableCategoryProvider extends ChangeNotifier {
  TableCategoryUseCase _tableCategoryUseCase;

  TableCategoryProvider(this._tableCategoryUseCase);

  late TableCategoryEntity _tableCategoryEntity;

  get tableCategoryEntity => _tableCategoryEntity;

  bool _isLoading = true;

  get isLoading => _isLoading;

  void getTableCategory(int productCategoryId) async {
    _isLoading = true;
    var response = await _tableCategoryUseCase.callApi(productCategoryId);
    _tableCategoryEntity =
        TableCategoryEntity.fromJson(jsonDecode(response));
    _isLoading = false;
    notifyListeners();
  }
}
