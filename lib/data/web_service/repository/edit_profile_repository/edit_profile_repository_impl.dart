import 'package:flutter/material.dart';
import 'package:neostore/data/model/request/edit_profile_request.dart';
import 'package:neostore/data/web_service/api_impl/edit_profile_api/edit_profile_api.dart';
import 'package:neostore/data/web_service/repository/edit_profile_repository/edit_profile_repository.dart';

class EditProfileRepositoryImpl implements EditProfileRepository {
  late EditProfileApi _editProfilePic;

  EditProfileRepositoryImpl(EditProfileApi _editProfileApi) {
    this._editProfilePic = _editProfileApi;
  }

  @override
  Future getEditProfileRepository(
      EditProfileRequest editProfileRequest, BuildContext context) {
    return _editProfilePic.getEditProfileApi(
        editProfileRequest,context);
  }
}
