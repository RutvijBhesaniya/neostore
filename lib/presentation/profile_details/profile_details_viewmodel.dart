import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:neostore/data/model/response/my_account.dart';
import 'package:neostore/data/request/my_account_api_request.dart';
import 'package:neostore/data/web_service/api_impl/my_account_api/my_account_api_impl.dart';
import 'package:neostore/data/web_service/repository/my_account_repository/my_account_repository_impl.dart';
import 'package:neostore/domain/my_account_use_case.dart';
import 'package:neostore/utils/shared_preferences/memory_management.dart';

class ProfileDetailsProvider extends ChangeNotifier {
  MyAccountResponse? _myAccountResponse;

  MyAccountResponse? get myAccountResponse => _myAccountResponse;

  MyAccountUseCase _myAccountUseCase = MyAccountUseCase(
    MyAccountRepositoryImpl(
      MyAccountApiImpl(MyAccountApiRequest()),
    ),
  );

  bool _isLoading = true;

  get isLoading => _isLoading;

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
