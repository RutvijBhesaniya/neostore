import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:neostore/data/model/request/edit_profile_request.dart';
import 'package:neostore/data/model/response/edit_profile_response.dart';
import 'package:neostore/data/web_service/api_impl/edit_profile_api/edit_profile_api_impl.dart';
import 'package:neostore/data/web_service/repository/edit_profile_repository/edit_profile_repository_impl.dart';
import 'package:neostore/domain/edit_profile_use_case.dart';

class EditProfileProvider extends ChangeNotifier {

  var image;

  Future setImage(var file)async{
    this.image =file;
    this.notifyListeners();
  }
  EditProfileResponse? _editProfileResponse;

  EditProfileResponse? get editProfileResponse => _editProfileResponse;

  EditProfileUseCase _editProfileUseCase = EditProfileUseCase(
    EditProfileRepositoryImpl(
      EditProfileApiImpl(),
    ),
  );

  bool _isLoading = true;

  get isLoading => _isLoading;

  Future<dynamic> getEditProfile(
      EditProfileRequest editProfileRequest, BuildContext context) async {
    _isLoading = true;
    var response = await _editProfileUseCase.callApi(editProfileRequest,context);
    _editProfileResponse = EditProfileResponse.fromJson(jsonDecode(response));
     print(response);
    _isLoading = false;
    // return response;
    notifyListeners();
  }
}
