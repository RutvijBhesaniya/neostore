import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:neostore/data/model/response/edit_profile_response.dart';
import 'package:neostore/data/web_service/api_impl/edit_profile_api/edit_profile_api_impl.dart';
import 'package:neostore/data/web_service/repository/edit_profile_repository/edit_profile_repository_impl.dart';
import 'package:neostore/domain/edit_profile_use_case.dart';

class EditProfileProvider extends ChangeNotifier {
  EditProfileResponse? _editProfileResponse;

  EditProfileResponse? get editProfileResponse => _editProfileResponse;

  EditProfileUseCase _editProfileUseCase = EditProfileUseCase(
    EditProfileRepositoryImpl(
      EditProfileApiImpl(),
    ),
  );

  bool _isLoading = true;

  get isLoading => _isLoading;

  void getEditProfile() async {
    _isLoading = true;
    var response = await _editProfileUseCase.callApi();
    _editProfileResponse = EditProfileResponse.fromJson(jsonDecode(response));

    _isLoading = false;
    notifyListeners();
  }
}
