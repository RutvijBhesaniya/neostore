import 'dart:convert';

RegisterRequest RegisterRequestFromJson(String str) =>
    RegisterRequest.fromJson(json.decode(str));

String RegisterRequestToJson(RegisterRequest data) => json.encode(data.toJson());

class RegisterRequest {
  RegisterRequest({
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.password,
    this.confirmPassword,
  });

  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? password;
  String? confirmPassword;

  factory RegisterRequest.fromJson(Map<String, dynamic> json) => RegisterRequest(
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        phone: json["phone"],
        password: json["password"],
        confirmPassword: json["confirmPassword"],
      );

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "phone": phone,
        "password": password,
        "confirmPassword": confirmPassword
      };
}
