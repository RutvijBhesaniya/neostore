import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:neostore/data/model/response/add_to_cart_response.dart';
import 'package:neostore/data/model/response/delete_cart_response.dart';
import 'package:neostore/data/model/response/edit_cart_response.dart';
import 'package:neostore/data/model/response/list_cart_response.dart';
import 'package:neostore/data/model/response/table_detail_response.dart';
import 'package:neostore/data/web_service/api_impl/add_to_cart_api/add_to_cart_api_impl.dart';
import 'package:neostore/data/web_service/api_impl/delete_cart_api/delete_cart_api_impl.dart';
import 'package:neostore/data/web_service/api_impl/edit_cart_api/edit_cart_api_impl.dart';
import 'package:neostore/data/web_service/repository/add_to_cart_repository/add_to_cart_repository_impl.dart';
import 'package:neostore/data/web_service/repository/delete_cart_repository/delete_cart_repository_impl.dart';
import 'package:neostore/data/web_service/repository/edit_cart_repository/edit_cart_repository_impl.dart';
import 'package:neostore/domain/add_to_cart_use_case.dart';
import 'package:neostore/domain/delete_cart_use_case.dart';
import 'package:neostore/domain/edit_cart_use_case.dart';
import 'package:neostore/domain/cart_use_case.dart';
import 'package:neostore/domain/table_detail_use_case.dart';

class CartProvider extends ChangeNotifier {
  List<String> _items = ['1', '2', '3', '4', '5', '6', '7', '8'];

  CartUseCase _listCartUseCase;
  TableDetailUseCase _tableDetailUseCase;

  CartProvider(this._listCartUseCase, this._tableDetailUseCase);

  DeleteCartUseCase _deleteCartUseCase = DeleteCartUseCase(
    DeleteCartRepositoryImpl(
      DeleteCartApiImpl(),
    ),
  );

  // ListCartUseCase _listCartUseCase = ListCartUseCase(
  //   ListCartRepositoryImpl(
  //     ListCartApiImpl(),
  //   ),
  // );

  AddToCartUseCase _addToCartUseCase = AddToCartUseCase(
    AddToCartRepositoryImpl(
      AddToCartApiImpl(),
    ),
  );

  EditCartUseCase _editCartUseCase = EditCartUseCase(
    EditCartRepositoryImpl(
      EditCartApiImpl(),
    ),
  );

  ListCartResponse? _listCartResponse;

  ListCartResponse? get listCartResponse => _listCartResponse;

  DeleteCartResponse? _deleteCartResponse;

  DeleteCartResponse? get deleteCartResponse => _deleteCartResponse;

  TableDetailResponse? _tableDetailResponse;

  TableDetailResponse? get tableDetailResponse => _tableDetailResponse;

  AddToCartResponse? _addToCartResponse;

  AddToCartResponse? get addToCartResponse => _addToCartResponse;

  EditCartResponse? _editCartResponse;

  EditCartResponse? get editCartResponse => _editCartResponse;

  bool _isLoading = true;

  get isLoading => _isLoading;

  List<String> get items => _items;

  void selected(int index, String quantity) {
    listCartResponse?.data?[index].quantity = int.parse(quantity);
    notifyListeners();
  }

  void getListCart() async {
    _isLoading = true;
    var response = await _listCartUseCase.callApi();
    _listCartResponse = ListCartResponse.fromJson(jsonDecode(response));

    _isLoading = false;
    notifyListeners();
  }

  Future<dynamic> getDeleteCart(int productId) async {
    _isLoading = true;
    var deleteResponse = await _deleteCartUseCase.callApi(productId);
    _deleteCartResponse =
        DeleteCartResponse.fromJson(jsonDecode(deleteResponse));
    _isLoading = false;
    return deleteResponse;
  }

  void getEditCart(int productId, String quantity) async {
    _isLoading = true;
    var editCartResponse =
        await _editCartUseCase.callApi(productId, int.parse(quantity));
    _editCartResponse = EditCartResponse.fromJson(jsonDecode(editCartResponse));

    getListCart();
    _isLoading = false;
    notifyListeners();
    // return editCartResponse;
  }

  void getTableDetail(int productId) async {
    _isLoading = true;
    var response = await _tableDetailUseCase.callApi(productId);
    _tableDetailResponse = TableDetailResponse.fromJson(jsonDecode(response));
    _isLoading = false;
    return response;
  }

  Future<dynamic> getAddToCart(int productId, int quantity) async {
    _isLoading = true;
    var response = await _addToCartUseCase.callApi(productId, quantity);
    _addToCartResponse = AddToCartResponse.fromJson(jsonDecode(response));
    _isLoading = false;
    return response;
  }
}
