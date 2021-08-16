class LoginRequest {
  LoginRequest({
    this.email,
    this.password,
  });

  String? email;
  String? password;
  String? gender;

  factory LoginRequest.fromJson(Map<String, dynamic> json) => LoginRequest(
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}
