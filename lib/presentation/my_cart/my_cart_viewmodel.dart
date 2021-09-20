import 'dart:convert';
import 'package:flutter/cupertino.dart';
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

class CartProvider extends ChangeNotifier {
  List<String> _items = ['1', '2', '3', '4', '5', '6', '7', '8'];

  CartUseCase _listCartUseCase;
  TableDetailUseCase _tableDetailUseCase;
  AddToCartUseCase _addToCartUseCase;

  CartProvider(
      this._listCartUseCase, this._tableDetailUseCase, this._addToCartUseCase);

  DeleteCartUseCase _deleteCartUseCase = DeleteCartUseCase(
    DeleteCartRepositoryImpl(
      DeleteCartApiImpl(),
    ),
  );

  EditCartUseCase _editCartUseCase = EditCartUseCase(
    EditCartRepositoryImpl(
      EditCartApiImpl(),
    ),
  );

  ListCartEntity? _listCartEntity;

  ListCartEntity? get listCartEntity => _listCartEntity;

  DeleteCartEntity? _deleteCartEntity;

  DeleteCartEntity? get deleteCartEntity => _deleteCartEntity;

  TableDetailEntity? _tableDetailEntity;

  TableDetailEntity? get tableDetailEntity => _tableDetailEntity;

  AddToCartEntity? _addToCartEntity;

  AddToCartEntity? get addToCartEntity => _addToCartEntity;

  EditCartEntity? _editCartEntity;

  EditCartEntity? get editCartEntity => _editCartEntity;

  bool _isLoading = true;

  get isLoading => _isLoading;

  List<String> get items => _items;

  void selected(int index, String quantity) {
    listCartEntity?.dataEntity?[index].quantity = int.parse(quantity);
    notifyListeners();
  }

  ///list cart method
  void getListCart() async {
    _isLoading = true;
    var response = await _listCartUseCase.callApi();
    _listCartEntity = ListCartEntity.fromJson(jsonDecode(response));

    _isLoading = false;
    notifyListeners();
  }

  ///delete cart method
  Future<dynamic> getDeleteCart(int productId) async {
    _isLoading = true;
    var deleteResponse = await _deleteCartUseCase.callApi(productId);
    _deleteCartEntity = DeleteCartEntity.fromJson(jsonDecode(deleteResponse));
    _isLoading = false;
    return deleteResponse;
  }

  ///edit cart method
  void getEditCart(int productId, String quantity) async {
    _isLoading = true;
    var editCartResponse =
        await _editCartUseCase.callApi(productId, int.parse(quantity));
    _editCartEntity = EditCartEntity.fromJson(jsonDecode(editCartResponse));

    getListCart();
    _isLoading = false;
    notifyListeners();
    // return editCartResponse;
  }

  ///table detail method
  void getTableDetail(int productId) async {
    _isLoading = true;
    var response = await _tableDetailUseCase.callApi(productId);
    _tableDetailEntity = TableDetailEntity.fromJson(jsonDecode(response));
    _isLoading = false;
    return response;
  }

  ///add to cart method
  Future<dynamic> getAddToCart(int productId, int quantity) async {
    _isLoading = true;
    var response = await _addToCartUseCase.callApi(productId, quantity);
    _addToCartEntity = AddToCartEntity.fromJson(jsonDecode(response));
    _isLoading = false;
    return response;
  }
}
