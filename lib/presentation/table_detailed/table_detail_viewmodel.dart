import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:neostore/data/model/response/add_to_cart_response.dart';
import 'package:neostore/data/model/response/rating_response.dart';
import 'package:neostore/data/model/response/table_detail_response.dart';
import 'package:neostore/data/web_service/api_impl/add_to_cart_api/add_to_cart_api_impl.dart';
import 'package:neostore/data/web_service/api_impl/rating_api/rating_api_impl.dart';
import 'package:neostore/data/web_service/repository/add_to_cart_repository/add_to_cart_repository_impl.dart';
import 'package:neostore/data/web_service/repository/rating_repository/rating_repository_impl.dart';
import 'package:neostore/domain/add_to_cart_use_case.dart';
import 'package:neostore/domain/rating_use_case.dart';
import 'package:neostore/domain/table_detail_use_case.dart';

class TableDetailProvider extends ChangeNotifier {
  TableDetailUseCase _tableDetailUseCase;

  TableDetailProvider(this._tableDetailUseCase);

  RatingUseCase _ratingUseCase = RatingUseCase(
    RatingRepositoryImpl(
      RatingApiImpl(),
    ),
  );
  AddToCartUseCase _addToCartUseCase = AddToCartUseCase(
    AddToCartRepositoryImpl(
      AddToCartApiImpl(),
    ),
  );

  TableDetailResponse? _tableDetailResponse;
  RatingResponse? _ratingResponse;
  AddToCartResponse? _addToCartResponse;

  TableDetailResponse? get tableDetailResponse => _tableDetailResponse;

  AddToCartResponse? get addToCartResponse => _addToCartResponse;

  bool _isLoading = true;

  get isLoading => _isLoading;

  get ratingResponse => _ratingResponse;

  ///get table detail method
  void getTableDetail(int? productId) async {
    _isLoading = true;
    var response = await _tableDetailUseCase.callApi(productId);
    _tableDetailResponse = TableDetailResponse.fromJson(jsonDecode(response));
    _isLoading = false;
    notifyListeners();
  }

  ///get rating method
  void getRating(int productId) async {
    _isLoading = true;
    var response = await _ratingUseCase.callApi(productId);
    _ratingResponse = RatingResponse.fromJson(jsonDecode(response));
    _isLoading = false;
    notifyListeners();
  }

  ///get add to cart method
  Future<dynamic> getAddToCart(int productId, int quantity) async {
    _isLoading = true;
    var response = await _addToCartUseCase.callApi(productId, quantity);
    _addToCartResponse = AddToCartResponse.fromJson(jsonDecode(response));
    _isLoading = false;
    return response;
  }
}
