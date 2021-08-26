import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:neostore/data/model/response/rating_response.dart';
import 'package:neostore/data/model/response/table_detail_response.dart';
import 'package:neostore/data/web_service/api_impl/rating_api/rating_api_impl.dart';
import 'package:neostore/data/web_service/api_impl/table_detail_api/table_detail_api_impl.dart';
import 'package:neostore/data/web_service/repository/rating_repository/rating_repository_impl.dart';
import 'package:neostore/data/web_service/repository/table_detail_repository/table_detail_repository_impl.dart';
import 'package:neostore/domain/rating_use_case.dart';
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
    _tableDetailResponse = TableDetailResponse.fromJson(jsonDecode(response));
    _isLoading = false;
    notifyListeners();
  }
}

class RatingProvider extends ChangeNotifier {
  RatingUseCase _ratingUseCase =
      RatingUseCase(RatingRepositoryImpl(RatingApiImpl()));

  RatingResponse? _ratingResponse;

  get ratingResponse => _ratingResponse;
  bool _isLoading = true;

  get isLoading => _isLoading;

  void getRating(int productid) async {
    _isLoading = true;
    var response = await _ratingUseCase.callApi(productid);
    print("abcdef=>$response");

    _ratingResponse = RatingResponse.fromJson(jsonDecode(response));
    _isLoading = false;
    // return response;

    notifyListeners();
  }
}
