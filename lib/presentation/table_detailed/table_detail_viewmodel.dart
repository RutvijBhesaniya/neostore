import 'dart:convert';
import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:neostore/base/network_model/api_error.dart';
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
import 'package:neostore/presentation/model/add_to_cart_item.dart';
import 'package:neostore/presentation/model/rating_item.dart';
import 'package:neostore/presentation/model/table_detail_item.dart';

class TableDetailProvider extends ChangeNotifier {
  TableDetailUseCase _tableDetailUseCase;
  AddToCartUseCase _addToCartUseCase;
  RatingUseCase _ratingUseCase;

  TableDetailProvider(
      this._tableDetailUseCase, this._addToCartUseCase, this._ratingUseCase);

  RatingItem? _ratingItem;

  RatingItem? get ratingItem => _ratingItem;

  AddToCartEntity? _addToCartEntity;

  AddToCartEntity? get addToCartEntity => _addToCartEntity;

  TableDetailItem? _tableDetailItem;

  TableDetailItem? get tableDetailItem => _tableDetailItem;

  ApiError? _getTableDetailError;

  ApiError? get getTableDetailError => _getTableDetailError;

  ApiError? _getRatingError;

  ApiError? get getRatingError => _getRatingError;

  bool _isLoading = true;

  get isLoading => _isLoading;

  ///get table detail method
  Future<void> getTableDetail(int? productId) async {
    _isLoading = true;
    var response = await _tableDetailUseCase.callApi(productId);
    if (response.isLeft) {
      _tableDetailItem = response.left;
      _isLoading = false;
    } else {
      _isLoading = false;
      _getTableDetailError = response.right;
    }
    notifyListeners();
  }

  ///get rating method
  Future<void> getRating(int productId) async {
    _isLoading = true;
    var response = await _ratingUseCase.callApi(productId);
    if (response.isLeft) {
      _ratingItem = response.left;
      _isLoading = false;
    } else {
      _isLoading = false;
      _getRatingError = response.right;
    }

    notifyListeners();
  }

  ///get add to cart method
  Future<Either<AddToCartItem, ApiError>> getAddToCart(
      int productId, int quantity) async {
    _isLoading = true;
    var response = await _addToCartUseCase.callApi(productId, quantity);
    if(response.isLeft){
      AddToCartItem _addToCartItem = response.left;
      _isLoading = false;
      return Left(_addToCartItem);
    }else{
      _isLoading = false;
      return Right(response.right);
    }
    // _addToCartEntity = AddToCartEntity.fromJson(jsonDecode(response));
    // _isLoading = false;
    // return response;
  }
}
