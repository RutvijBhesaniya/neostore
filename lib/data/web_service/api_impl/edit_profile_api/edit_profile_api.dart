import 'dart:typed_data';

abstract class EditProfileApi {
  Future<dynamic> getEditProfileApi(String email, String dob, String phoneNo,
      Uint8List profilePic, String firstName, String lastName);
}
