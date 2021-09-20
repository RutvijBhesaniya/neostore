import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:neostore/data/api/response/edit_profile_response.dart';
import 'package:neostore/domain/use_case/edit_profile_use_case.dart';

class EditProfileProvider extends ChangeNotifier {
  File? _imageFile;

  EditProfileUseCase _editProfileUseCase;

  EditProfileProvider(this._editProfileUseCase);

  File? get imageFile => _imageFile;

  void setImage(File? file) {
    _imageFile = file;
    notifyListeners();
  }

  EditProfileResponse? _editProfileResponse;

  EditProfileResponse? get editProfileResponse => _editProfileResponse;

  bool _isLoading = true;

  get isLoading => _isLoading;

  ///get edit profile method
  Future<dynamic> getEditProfile(String email, String dob, String phoneNo,
      Uint8List profilePic, String firstName, String lastName) async {
    _isLoading = true;
    var response = await _editProfileUseCase.callApi(
        email, dob, phoneNo, profilePic, firstName, lastName);

    _editProfileResponse = EditProfileResponse.fromJson(
      jsonDecode(response),
    );

    _isLoading = false;
    return response;
  }
}
