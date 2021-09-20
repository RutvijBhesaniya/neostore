import 'dart:convert';

RegisterRequest registerRequestFromJson(String str) =>
    RegisterRequest.fromJson(json.decode(str));

String registerRequestToJson(RegisterRequest data) =>
    json.encode(data.toJson());

class RegisterRequest {
  RegisterRequest(
      {this.firstName,
      this.lastName,
      this.email,
      this.phone,
      this.password,
      this.confirmPassword,
      this.gender});

  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? password;
  String? confirmPassword;
  String? gender;

  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      RegisterRequest(
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        phone: json["phone_no"],
        password: json["password"],
        confirmPassword: json["confirm_password"],
        gender: json["gender"],
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "phone_no": phone,
        "password": password,
        "confirm_password": confirmPassword,
        "gender": gender
      };
}
