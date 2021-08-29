class EditProfileRequest {
  EditProfileRequest(
      {this.email,
      // this.dob,
      this.phoneNo,
      // this.profilePic,
      this.firstName,
      this.lastName});

  String? firstName;
  String? email;
  // String? dob;
  String? phoneNo;
  // String? profilePic;
  String? lastName;

  factory EditProfileRequest.fromJson(Map<String, dynamic> json) =>
      EditProfileRequest(
          email: json["email"],
          // dob: json["dob"],
          phoneNo: json["phone_no"],
          // profilePic: json["profile_pic"],
          firstName: json["first_name"],
          lastName: json["last_name"]);

  Map<String, dynamic> toJson() => {
        "email": email,
        // "dob": dob,
        "phone_no": phoneNo,
        // "profile_pic": profilePic,
        "first_name": firstName,
        "last_name": lastName
      };
}
