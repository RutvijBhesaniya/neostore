import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:neostore/data/model/response/list_cart_response.dart';
import 'package:neostore/data/model/response/my_account.dart';
import 'package:neostore/domain/use_case/cart_use_case.dart';
import 'package:neostore/domain/use_case/my_account_use_case.dart';
import 'package:neostore/utils/shared_preferences/memory_management.dart';

class HomeProvider extends ChangeNotifier {
  MyAccountUseCase _myAccountUseCase;
  CartUseCase _listCartUseCase;

  HomeProvider(this._myAccountUseCase, this._listCartUseCase);

  ListCartResponse? _listCartResponse;

  ListCartResponse? get listCartResponse => _listCartResponse;

  MyAccountResponse? _myAccountResponse;

  MyAccountResponse? get myAccountResponse => _myAccountResponse;

  bool _isLoading = true;

  get isLoading => _isLoading;

  bool collapsed = false;

  bool get getCurrentDrawer => collapsed;

  void setCurrentDrawer(bool drawer) {
    collapsed = drawer;
    notifyListeners();
  }

  void getListCountCart() async {
    _isLoading = true;
    var response = await _listCartUseCase.callApi();
    _listCartResponse = ListCartResponse.fromJson(jsonDecode(response));

    _isLoading = false;
    notifyListeners();
  }

  void getMyAccount() async {
    _isLoading = true;
    var response = await _myAccountUseCase.callApi();
    _myAccountResponse = MyAccountResponse.fromJson(jsonDecode(response));
    MemoryManagement.setFirstName(
        firstName: _myAccountResponse!.data!.userData!.firstName);
    MemoryManagement.setLastName(
        lastName: _myAccountResponse!.data!.userData!.lastName);
    MemoryManagement.setEmail(email: _myAccountResponse!.data!.userData!.email);
    MemoryManagement.setPhoneNumber(
        phoneNumber: _myAccountResponse!.data!.userData!.phoneNo);

    _isLoading = false;

    // return response;
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
