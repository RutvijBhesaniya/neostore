import 'dart:io';
import 'dart:typed_data';
import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/domain/use_case/edit_profile_use_case.dart';
import 'package:neostore/presentation/model/edit_profile_item.dart';

class EditProfileProvider extends ChangeNotifier {
  File? _imageFile;

  EditProfileUseCase _editProfileUseCase;

  EditProfileProvider(this._editProfileUseCase);

  File? get imageFile => _imageFile;

  void setImage(File? file) {
    _imageFile = file;
    notifyListeners();
  }

  bool _isLoading = true;

  get isLoading => _isLoading;

  ///get edit profile method
  Future<Either<EditProfileItem, ApiError>> getEditProfile(
      String email,
      String dob,
      String phoneNo,
      Uint8List profilePic,
      String firstName,
      String lastName) async {
    _isLoading = true;
    var response = await _editProfileUseCase.callApi(
        email, dob, phoneNo, profilePic, firstName, lastName);

    if (response.isLeft) {
      EditProfileItem _editProfileItem = response.left;
      _isLoading = false;
      return Left(_editProfileItem);
    } else {
      _isLoading = false;
      return Right(response.right);
    }
  }
}
