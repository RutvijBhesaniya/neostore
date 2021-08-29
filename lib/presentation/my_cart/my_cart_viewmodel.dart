import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:neostore/data/model/response/add_to_cart_response.dart';
import 'package:neostore/data/model/response/delete_cart_response.dart';
import 'package:neostore/data/model/response/list_cart_response.dart';
import 'package:neostore/data/web_service/api_impl/add_to_cart_api/add_to_cart_api_impl.dart';
import 'package:neostore/data/web_service/api_impl/delete_cart_api/delete_cart_api_impl.dart';
import 'package:neostore/data/web_service/api_impl/list_cart_api/list_cart_api_impl.dart';
import 'package:neostore/data/web_service/repository/add_to_cart_repository/add_to_cart_repository_impl.dart';
import 'package:neostore/data/web_service/repository/delete_cart_repository/delete_cart_repository_impl.dart';
import 'package:neostore/data/web_service/repository/list_cart_repository/list_cart_repository_impl.dart';
import 'package:neostore/domain/add_to_cart_use_case.dart';
import 'package:neostore/domain/delete_cart_use_case.dart';
import 'package:neostore/domain/list_cart_use_case.dart';

class ListCartProvider extends ChangeNotifier {
  DeleteCartUseCase _deleteCartUseCase = DeleteCartUseCase(
    DeleteCartRepositoryImpl(
      DeleteCartApiImpl(),
    ),
  );

  ListCartUseCase _listCartUseCase = ListCartUseCase(
    ListCartRepositoryImpl(
      ListCartApiImpl(),
    ),
  );

  ListCartResponse? _listCartResponse;

  ListCartResponse? get listCartResponse => _listCartResponse;

  DeleteCartResponse? _deleteCartResponse;

  DeleteCartResponse? get deleteCartResponse => _deleteCartResponse;
  bool _isLoading = true;

  get isLoading => _isLoading;

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
}
