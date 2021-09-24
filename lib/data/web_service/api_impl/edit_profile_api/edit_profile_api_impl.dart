import 'dart:async';
import 'dart:typed_data';
import 'package:either_dart/either.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/data/request/edit_profile_api_request.dart';
import 'package:neostore/data/web_service/api_impl/edit_profile_api/edit_profile_api.dart';
import 'package:neostore/domain/model/edit_profile.dart';

class EditProfileApiImpl extends EditProfileApi {
  final EditProfileApiRequest _editProfileApiRequest;

  EditProfileApiImpl(this._editProfileApiRequest);

  @override
  Future<Either<EditProfile,ApiError>> getEditProfileApi(String email, String dob, String phoneNo,
      Uint8List profilePic, String firstName, String lastName) {
    return _editProfileApiRequest.getEditProfileApi(
        email, dob, phoneNo, profilePic, firstName, lastName);
  }
}
