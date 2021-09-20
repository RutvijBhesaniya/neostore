import 'package:neostore/data/api/entity/edit_profile_entity.dart';

class EditProfile {
  int? status;
  Data? data;
  String? message;
  String? userMsg;

  EditProfile({this.status, this.data, this.message, this.userMsg});
}

class Data {
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

  Data(
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

extension EditProfileEntityExt on EditProfileEntity {
  EditProfile mapToDomain() => EditProfile(
        status: this.status,
        data: this.dataEntity != null ? this.dataEntity?.mapToDomain() : null,
        message: this.message,
        userMsg: this.userMsg,
      );
}

extension DataEntityExt on DataEntity {
  Data mapToDomain() => Data(
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

extension DataEntityListExt on List<DataEntity> {
  List<Data> mapToDomain() =>
      this.map((element) => element.mapToDomain()).toList();
}

extension EditProfileEntityListExt on List<EditProfileEntity> {
  List<EditProfile> mapToDomain() =>
      this.map((element) => element.mapToDomain()).toList();
}
