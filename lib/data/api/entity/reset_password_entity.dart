class ResetPasswordEntity {
  int? status;
  String? message;
  String? userMsg;

  ResetPasswordEntity({
      this.status, 
      this.message, 
      this.userMsg});

  ResetPasswordEntity.fromJson(dynamic json) {
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