import 'dart:convert';
import 'package:either_dart/either.dart';
import 'package:flutter/cupertino.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/data/api/entity/add_to_cart_entity.dart';
import 'package:neostore/data/api/entity/delete_cart_entity.dart';
import 'package:neostore/data/api/entity/edit_cart_entity.dart';
import 'package:neostore/data/api/entity/list_cart_entity.dart';
import 'package:neostore/data/api/entity/table_detail_entity.dart';
import 'package:neostore/data/web_service/api_impl/add_to_cart_api/add_to_cart_api_impl.dart';
import 'package:neostore/data/web_service/api_impl/delete_cart_api/delete_cart_api_impl.dart';
import 'package:neostore/data/web_service/api_impl/edit_cart_api/edit_cart_api_impl.dart';
import 'package:neostore/domain/repository/add_to_cart_repository/add_to_cart_repository_impl.dart';
import 'package:neostore/domain/repository/delete_cart_repository/delete_cart_repository_impl.dart';
import 'package:neostore/domain/repository/edit_cart_repository/edit_cart_repository_impl.dart';
import 'package:neostore/domain/use_case/add_to_cart_use_case.dart';
import 'package:neostore/domain/use_case/delete_cart_use_case.dart';
import 'package:neostore/domain/use_case/edit_cart_use_case.dart';
import 'package:neostore/domain/use_case/cart_use_case.dart';
import 'package:neostore/domain/use_case/table_detail_use_case.dart';
import 'package:neostore/presentation/model/add_to_cart_item.dart';
import 'package:neostore/presentation/model/delete_cart_item.dart';
import 'package:neostore/presentation/model/edit_cart_item.dart';
import 'package:neostore/presentation/model/list_cart_item.dart';
import 'package:neostore/presentation/model/table_detail_item.dart';

class CartProvider extends ChangeNotifier {
  List<String> _items = ['1', '2', '3', '4', '5', '6', '7', '8'];

  CartUseCase _listCartUseCase;
  TableDetailUseCase _tableDetailUseCase;
  AddToCartUseCase _addToCartUseCase;
  DeleteCartUseCase _deleteCartUseCase;
  EditCartUseCase _editCartUseCase;

  CartProvider(
    this._listCartUseCase,
    this._tableDetailUseCase,
    this._addToCartUseCase,
    this._deleteCartUseCase,
    this._editCartUseCase,
  );


  ListCartItem? _listCartItem;

  ListCartItem? get listCartItem => _listCartItem;

  TableDetailItem? _tableDetailItem;

  TableDetailItem? get tableDetailItem => _tableDetailItem;

  EditCartItem? _editCartItem;

  EditCartItem? get editCartItem => _editCartItem;

  ApiError? _getListCartError;

  ApiError? get getListCartError => _getListCartError;

  // EditCartEntity? _editCartEntity;
  //
  // EditCartEntity? get editCartEntity => _editCartEntity;

  ApiError? _getTableDetailError;

  ApiError? get getTableDetailError => _getTableDetailError;

  ApiError? _getEditCartError;

  ApiError? get getEditCartError => _getEditCartError;

  bool _isLoading = true;

  get isLoading => _isLoading;

  List<String> get items => _items;

  void selected(int index, String quantity) {
    listCartItem?.dataItem?[index].quantity = int.parse(quantity);
    notifyListeners();
  }

  ///list cart method
  Future<void> getListCart() async {
    _isLoading = true;
    var response = await _listCartUseCase.callApi();

    if (response.isLeft) {
      _listCartItem = response.left;
      _isLoading = false;
    } else {
      _isLoading = false;
      _getListCartError = response.right;
    }
    notifyListeners();
  }

  ///delete cart method
  Future<Either<DeleteCartItem, ApiError>> getDeleteCart(int productId) async {
    _isLoading = true;
    var deleteResponse = await _deleteCartUseCase.callApi(productId);
    if (deleteResponse.isLeft) {
      DeleteCartItem _deleteCartItem = deleteResponse.left;
      _isLoading = false;
      return Left(_deleteCartItem);
    } else {
      _isLoading = false;
      return Right(deleteResponse.right);
    }
  }

  ///edit cart method
  Future<void> getEditCart(int productId, String quantity) async {
    _isLoading = true;
    var editCartResponse =
        await _editCartUseCase.callApi(productId, int.parse(quantity));
    if (editCartResponse.isLeft) {
      getListCart();

      _editCartItem = editCartResponse.left;
    } else {
      _isLoading = false;
      _getEditCartError = editCartResponse.right;
    }

    notifyListeners();
  }

  ///table detail method
  Future<void> getTableDetail(int? productId) async {
    _isLoading = true;
    var response = await _tableDetailUseCase.callApi(productId);
    if (response.isLeft) {
      _tableDetailItem = response.left;
    } else {
      _isLoading = false;
      _getTableDetailError = response.right;
    }
    notifyListeners();
  }

  ///add to cart method
  Future<Either<AddToCartItem, ApiError>> getAddToCart(
      int productId, int quantity) async {
    _isLoading = true;
    var response = await _addToCartUseCase.callApi(productId, quantity);
    if (response.isLeft) {
      AddToCartItem _addToCartItem = response.left;
      _isLoading = false;
      return Left(_addToCartItem);
    } else {
      _isLoading = false;
      return Right(response.right);
    }
  }
}
