import 'dart:typed_data';

import 'package:either_dart/either.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/data/web_service/api_impl/edit_profile_api/edit_profile_api.dart';
import 'package:neostore/domain/model/edit_profile.dart';
import 'package:neostore/domain/repository/edit_profile_repository/edit_profile_repository.dart';

class EditProfileRepositoryImpl implements EditProfileRepository {
  late EditProfileApi _editProfilePic;

  EditProfileRepositoryImpl(EditProfileApi _editProfileApi) {
    this._editProfilePic = _editProfileApi;
  }

  @override
  Future<Either<EditProfile,ApiError>> getEditProfileRepository(String email, String dob, String phoneNo,
      Uint8List profilePic, String firstName, String lastName) {
    return _editProfilePic.getEditProfileApi(
        email, dob, phoneNo, profilePic, firstName, lastName);
  }
}
