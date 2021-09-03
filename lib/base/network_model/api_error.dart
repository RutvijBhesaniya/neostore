class ApiError {
  int? status;
  bool? data;
  String? message;
  String? userMsg;

  ApiError({
      this.status, 
      this.data, 
      this.message, 
      this.userMsg});

  ApiError.fromJson(dynamic json) {
    status = json['status'];
    data = json['data'];
    message = json['message'];
    userMsg = json['user_msg'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['status'] = status;
    map['data'] = data;
    map['message'] = message;
    map['user_msg'] = userMsg;
    return map;
  }

}