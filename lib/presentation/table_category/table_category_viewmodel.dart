import 'package:flutter/material.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/domain/use_case/table_category_use_case.dart';
import 'package:neostore/presentation/model/table_category_item.dart';

class TableCategoryProvider extends ChangeNotifier {
  TableCategoryUseCase _tableCategoryUseCase;

  TableCategoryProvider(this._tableCategoryUseCase);

  late TableCategoryItem _tableCategoryItem;

  TableCategoryItem get tableCategoryItem => _tableCategoryItem;

  ApiError? _getTableCategoryError;

  ApiError? get getTableCategoryError => _getTableCategoryError;

  bool _isLoading = true;

  get isLoading => _isLoading;

  Future<void> getTableCategory(int productCategoryId) async {
    _isLoading = true;
    var response = await _tableCategoryUseCase.callApi(productCategoryId);
    if (response.isLeft) {
      _tableCategoryItem = response.left;
      _isLoading = false;
    } else {
      _isLoading = false;
      _getTableCategoryError = response.right;
    }
    notifyListeners();
  }
}
