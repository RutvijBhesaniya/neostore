import 'dart:convert';

import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/data/api/entity/list_cart_entity.dart';
import 'package:neostore/data/api/entity/my_account_entity.dart';
import 'package:neostore/domain/use_case/cart_use_case.dart';
import 'package:neostore/domain/use_case/my_account_use_case.dart';
import 'package:neostore/presentation/model/list_cart_item.dart';
import 'package:neostore/presentation/model/my_account_item.dart';
import 'package:neostore/utils/shared_preferences/memory_management.dart';

class HomeProvider extends ChangeNotifier {
  MyAccountUseCase _myAccountUseCase;
  CartUseCase _listCartUseCase;

  HomeProvider(this._myAccountUseCase, this._listCartUseCase);

  ListCartItem? _listCartItem;

  ListCartItem? get listCartItem => _listCartItem;

  MyAccountItem? _myAccountItem;

  MyAccountItem? get myAccountItem => _myAccountItem;

  bool _isLoading = true;

  get isLoading => _isLoading;

  bool collapsed = false;

  ApiError? _getListCountCartError;

  ApiError? get getListCountCartError => _getListCountCartError;

  bool get getCurrentDrawer => collapsed;

  ApiError? _getMyAccountError;

  ApiError? get getMyAccountError => _getMyAccountError;

  void setCurrentDrawer(bool drawer) {
    collapsed = drawer;
    notifyListeners();
  }

  ///list count method
  Future<void> getListCountCart() async {
    _isLoading = true;
    var response = await _listCartUseCase.callApi();
    if (response.isLeft) {
      _listCartItem = response.left;
      _isLoading = false;
    } else {
      _isLoading = false;
      _getListCountCartError = response.right;
    }

    notifyListeners();
  }

  ///get account details method
  Future<void> getMyAccount() async {
    _isLoading = true;
    var response = await _myAccountUseCase.callApi();
    if (response.isLeft) {
      _myAccountItem = response.left;

      MemoryManagement.setFirstName(
          firstName: _myAccountItem?.dataItem?.userDataItem?.firstName);
      MemoryManagement.setLastName(
          lastName: _myAccountItem?.dataItem?.userDataItem?.lastName);
      MemoryManagement.setEmail(
          email: _myAccountItem?.dataItem?.userDataItem?.email);
      MemoryManagement.setPhoneNumber(
          phoneNumber: _myAccountItem?.dataItem?.userDataItem?.phoneNo);

      _isLoading = false;
    } else {
      _isLoading = false;
      _getMyAccountError = response.right;
    }

    notifyListeners();
  }
}

class CarouselSliderProvider extends ChangeNotifier {
  List? indexList;
  List<String> imgList = [
    'assets/images/slider_img1.jpg',
    'assets/images/slider_img2.jpg',
    'assets/images/slider_img3.jpg',
    'assets/images/slider_img4.jpg',
  ];

  CarouselSliderProvider() {
    indexList = List.generate(imgList.length, (index) {
      if (index == 0) {
        return 1;
      } else {
        return 0;
      }
    });
  }

  void setIndex(int index) {
    for (int i = 0; i < indexList!.length; i++) {
      indexList![i] = 0;
    }

    indexList![index] = 1;
    notifyListeners();
  }
}
