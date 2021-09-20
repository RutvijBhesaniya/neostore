import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:neostore/data/api/entity/edit_profile_entity.dart';
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

  EditProfileEntity? _editProfileEntity;

  EditProfileEntity? get editProfileEntity => _editProfileEntity;

  bool _isLoading = true;

  get isLoading => _isLoading;

  ///get edit profile method
  Future<dynamic> getEditProfile(String email, String dob, String phoneNo,
      Uint8List profilePic, String firstName, String lastName) async {
    _isLoading = true;
    var response = await _editProfileUseCase.callApi(
        email, dob, phoneNo, profilePic, firstName, lastName);

    _editProfileEntity = EditProfileEntity.fromJson(
      jsonDecode(response),
    );

    _isLoading = false;
    return response;
  }
}
