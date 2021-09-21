import 'package:neostore/domain/model/edit_profile.dart';

class EditProfileItem {
  int? status;
  DataItem? data;
  String? message;
  String? userMsg;

  EditProfileItem({this.status, this.data, this.message, this.userMsg});
}

class DataItem {
  int? id;
  int? roleId;
  String? firstName;
  String? lastName;
  String? email;
  String? username;
  dynamic profilePic;
  dynamic countryId;
  String? gender;
  String? phoneNo;
  String? dob;
  bool? isActive;
  String? created;
  String? modified;
  String? accessToken;

  DataItem(
      {this.id,
      this.roleId,
      this.firstName,
      this.lastName,
      this.email,
      this.username,
      this.profilePic,
      this.countryId,
      this.gender,
      this.phoneNo,
      this.dob,
      this.isActive,
      this.created,
      this.modified,
      this.accessToken});
}

extension EditProfileExt on EditProfile {
  EditProfileItem mapToPresentation() => EditProfileItem(
        status: this.status,
        data: this.data != null ? this.data?.mapToPresentation() : null,
        message: this.message,
        userMsg: this.userMsg,
      );
}

extension EditProfileExtList on List<EditProfile> {
  List<EditProfileItem> mapToPresentation() =>
      this.map((element) => element.mapToPresentation()).toList();
}

extension DataItemExt on Data {
  DataItem mapToPresentation() => DataItem(
      id: this.id,
      roleId: this.roleId,
      firstName: this.firstName,
      lastName: this.lastName,
      email: this.email,
      username: this.username,
      profilePic: this.profilePic,
      countryId: this.countryId,
      gender: this.gender,
      phoneNo: this.phoneNo,
      dob: this.dob,
      isActive: this.isActive,
      created: this.created,
      modified: this.modified,
      accessToken: this.accessToken);
}

extension DataItemExtList on List<Data> {
  List<DataItem> mapToPresentation() =>
      this.map((element) => element.mapToPresentation()).toList();
}
