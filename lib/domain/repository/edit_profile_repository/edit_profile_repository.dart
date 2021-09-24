import 'dart:typed_data';

import 'package:either_dart/either.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/domain/model/edit_profile.dart';

abstract class EditProfileRepository {
  Future<Either<EditProfile,ApiError>> getEditProfileRepository(String email, String dob,
      String phoneNo, Uint8List profilePic, String firstName, String lastName);
}
