import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:neostore/data/api/response/my_account.dart';
import 'package:neostore/domain/use_case/my_account_use_case.dart';
import 'package:neostore/utils/shared_preferences/memory_management.dart';

class ProfileDetailsProvider extends ChangeNotifier {
  MyAccountUseCase _myAccountUseCase;

  ProfileDetailsProvider(this._myAccountUseCase);

  MyAccountResponse? _myAccountResponse;

  MyAccountResponse? get myAccountResponse => _myAccountResponse;

  bool _isLoading = true;

  get isLoading => _isLoading;


  ///my account detail method
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
    notifyListeners();
  }
}
