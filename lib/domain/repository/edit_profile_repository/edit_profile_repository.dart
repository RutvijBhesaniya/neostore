import 'dart:typed_data';

abstract class EditProfileRepository {
  Future<dynamic> getEditProfileRepository(String email, String dob,
      String phoneNo, Uint8List profilePic, String firstName, String lastName);
}
