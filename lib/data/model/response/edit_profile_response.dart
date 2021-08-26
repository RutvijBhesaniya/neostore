class EditProfileResponse {
  int? status;
  Data? data;
  String? message;
  String? userMsg;

  EditProfileResponse({
      this.status, 
      this.data, 
      this.message, 
      this.userMsg});

  EditProfileResponse.fromJson(dynamic json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
    userMsg = json['user_msg'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['status'] = status;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['message'] = message;
    map['user_msg'] = userMsg;
    return map;
  }

}

class Data {
  int? id;
  int? roleId;
  String? firstName;
  String? lastName;
  String? email;
  String? username;
  dynamic? profilePic;
  dynamic? countryId;
  String? gender;
  String? phoneNo;
  String? dob;
  bool? isActive;
  String? created;
  String? modified;
  String? accessToken;

  Data({
      this.id, 
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

  Data.fromJson(dynamic json) {
    id = json['id'];
    roleId = json['role_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    username = json['username'];
    profilePic = json['profile_pic'];
    countryId = json['country_id'];
    gender = json['gender'];
    phoneNo = json['phone_no'];
    dob = json['dob'];
    isActive = json['is_active'];
    created = json['created'];
    modified = json['modified'];
    accessToken = json['access_token'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = id;
    map['role_id'] = roleId;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['email'] = email;
    map['username'] = username;
    map['profile_pic'] = profilePic;
    map['country_id'] = countryId;
    map['gender'] = gender;
    map['phone_no'] = phoneNo;
    map['dob'] = dob;
    map['is_active'] = isActive;
    map['created'] = created;
    map['modified'] = modified;
    map['access_token'] = accessToken;
    return map;
  }

}