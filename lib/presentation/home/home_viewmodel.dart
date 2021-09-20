import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:neostore/data/api/entity/list_cart_entity.dart';
import 'package:neostore/data/api/entity/my_account_entity.dart';
import 'package:neostore/domain/use_case/cart_use_case.dart';
import 'package:neostore/domain/use_case/my_account_use_case.dart';
import 'package:neostore/utils/shared_preferences/memory_management.dart';

class HomeProvider extends ChangeNotifier {
  MyAccountUseCase _myAccountUseCase;
  CartUseCase _listCartUseCase;

  HomeProvider(this._myAccountUseCase, this._listCartUseCase);

  ListCartEntity? _listCartEntity;

  ListCartEntity? get listCartEntity => _listCartEntity;

  MyAccountEntity? _myAccountEntity;

  MyAccountEntity? get myAccountEntity => _myAccountEntity;

  bool _isLoading = true;

  get isLoading => _isLoading;

  bool collapsed = false;

  bool get getCurrentDrawer => collapsed;

  void setCurrentDrawer(bool drawer) {
    collapsed = drawer;
    notifyListeners();
  }


  ///list count method
  void getListCountCart() async {
    _isLoading = true;
    var response = await _listCartUseCase.callApi();
    _listCartEntity = ListCartEntity.fromJson(jsonDecode(response));

    _isLoading = false;
    notifyListeners();
  }


  ///get account details method
  void getMyAccount() async {
    _isLoading = true;
    var response = await _myAccountUseCase.callApi();
    _myAccountEntity = MyAccountEntity.fromJson(jsonDecode(response));
    MemoryManagement.setFirstName(
        firstName: _myAccountEntity!.dataEntity!.userDataEntity!.firstName);
    MemoryManagement.setLastName(
        lastName: _myAccountEntity!.dataEntity!.userDataEntity!.lastName);
    MemoryManagement.setEmail(email: _myAccountEntity!.dataEntity!.userDataEntity!.email);
    MemoryManagement.setPhoneNumber(
        phoneNumber: _myAccountEntity!.dataEntity!.userDataEntity!.phoneNo);

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
