class ResetPasswordResponse {
  int? status;
  String? message;
  String? userMsg;

  ResetPasswordResponse({
      this.status, 
      this.message, 
      this.userMsg});

  ResetPasswordResponse.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    userMsg = json['user_msg'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    map['user_msg'] = userMsg;
    return map;
  }

}