import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:neostore/data/model/request/edit_profile_request.dart';

abstract class EditProfileRepository {
  Future<dynamic> getEditProfileRepository(
      String email,
      String dob,
      String phoneNo,
      Uint8List profilePic,
      String firstName,String lastName);
}
