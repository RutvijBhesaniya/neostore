import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:neostore/data/model/response/list_cart_response.dart';
import 'package:neostore/data/web_service/api_impl/list_cart_api/list_cart_api_impl.dart';
import 'package:neostore/data/web_service/repository/list_cart_repository/list_cart_repository_impl.dart';
import 'package:neostore/domain/list_cart_use_case.dart';

class HomeProvider extends ChangeNotifier {
  ListCartUseCase _listCartUseCase = ListCartUseCase(
    ListCartRepositoryImpl(
      ListCartApiImpl(),
    ),
  );


  ListCartResponse? _listCartResponse;

  ListCartResponse? get listCartResponse => _listCartResponse;

  bool _isLoading = true;

  get isLoading => _isLoading;


  void getListCountCart() async {
    _isLoading = true;
    var response = await _listCartUseCase.callApi();
    _listCartResponse = ListCartResponse.fromJson(jsonDecode(response));

    _isLoading = false;
    notifyListeners();
  }
}
