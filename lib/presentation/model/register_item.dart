import 'package:neostore/domain/model/register.dart';

class RegisterItem {
  int? status;
  DataItem? dataItem;
  String? message;
  String? userMsg;

  RegisterItem({this.status, this.dataItem, this.message, this.userMsg});
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
  dynamic dob;
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

extension RegisterExt on Register {
  RegisterItem mapToPresentation() => RegisterItem(
        status: this.status,
        dataItem: this.data != null ? this.data?.mapToPresentation() : null,
        message: this.message,
        userMsg: this.userMsg,
      );
}

extension RegisterExtList on List<Register> {
  List<RegisterItem> mapToPresentation() =>
      this.map((element) => element.mapToPresentation()).toList();
}

extension DataExt on Data {
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

extension DataExtList on List<Data> {
  List<DataItem> mapToPresentation() =>
      this.map((element) => element.mapToPresentation()).toList();
}
