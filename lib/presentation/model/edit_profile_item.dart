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
