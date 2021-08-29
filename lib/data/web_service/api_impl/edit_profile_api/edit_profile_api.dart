import 'package:flutter/material.dart';
import 'package:neostore/data/model/request/edit_profile_request.dart';

abstract class EditProfileApi {
  Future<dynamic> getEditProfileApi(
      EditProfileRequest editProfileRequest, BuildContext context);
}
