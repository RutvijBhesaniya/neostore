import 'package:flutter/material.dart';
import 'package:neostore/data/model/request/edit_profile_request.dart';

abstract class EditProfileRepository {
  Future<dynamic> getEditProfileRepository(
      EditProfileRequest editProfileRequest, BuildContext context);
}
