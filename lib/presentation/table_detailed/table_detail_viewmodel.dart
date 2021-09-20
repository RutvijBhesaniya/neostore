import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:neostore/data/api/entity/add_to_cart_entity.dart';
import 'package:neostore/data/api/entity/rating_entity.dart';
import 'package:neostore/data/api/entity/table_detail_entity.dart';
import 'package:neostore/data/web_service/api_impl/add_to_cart_api/add_to_cart_api_impl.dart';
import 'package:neostore/data/web_service/api_impl/rating_api/rating_api_impl.dart';
import 'package:neostore/domain/repository/add_to_cart_repository/add_to_cart_repository_impl.dart';
import 'package:neostore/domain/repository/rating_repository/rating_repository_impl.dart';
import 'package:neostore/domain/use_case/add_to_cart_use_case.dart';
import 'package:neostore/domain/use_case/rating_use_case.dart';
import 'package:neostore/domain/use_case/table_detail_use_case.dart';

class TableDetailProvider extends ChangeNotifier {
  TableDetailUseCase _tableDetailUseCase;
  AddToCartUseCase _addToCartUseCase;

  TableDetailProvider(this._tableDetailUseCase, this._addToCartUseCase);

  RatingUseCase _ratingUseCase = RatingUseCase(
    RatingRepositoryImpl(
      RatingApiImpl(),
    ),
  );

  TableDetailEntity? _tableDetailEntity;
  RatingEntity? _ratingEntity;

  AddToCartEntity? _addToCartEntity;

  TableDetailEntity? get tableDetailEntity => _tableDetailEntity;

  AddToCartEntity? get addToCartEntity => _addToCartEntity;

  bool _isLoading = true;

  get isLoading => _isLoading;

  get ratingResponse => _ratingEntity;

  ///get table detail method
  void getTableDetail(int? productId) async {
    _isLoading = true;
    var response = await _tableDetailUseCase.callApi(productId);
    _tableDetailEntity = TableDetailEntity.fromJson(jsonDecode(response));
    _isLoading = false;
    notifyListeners();
  }

  ///get rating method
  void getRating(int productId) async {
    _isLoading = true;
    var response = await _ratingUseCase.callApi(productId);
    _ratingEntity = RatingEntity.fromJson(jsonDecode(response));
    _isLoading = false;
    notifyListeners();
  }

  ///get add to cart method
  Future<dynamic> getAddToCart(int productId, int quantity) async {
    _isLoading = true;
    var response = await _addToCartUseCase.callApi(productId, quantity);
    _addToCartEntity = AddToCartEntity.fromJson(jsonDecode(response));
    _isLoading = false;
    return response;
  }
}
