class OrderListResponse {
  int? status;
  List<Data>? data;
  String? message;
  String? userMsg;

  OrderListResponse({
      this.status, 
      this.data, 
      this.message, 
      this.userMsg});

  OrderListResponse.fromJson(dynamic json) {
    status = json['status'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
    message = json['message'];
    userMsg = json['user_msg'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['status'] = status;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    map['message'] = message;
    map['user_msg'] = userMsg;
    return map;
  }

}

class Data {
  int? id;
  int? cost;
  String? created;

  Data({
      this.id, 
      this.cost, 
      this.created});

  Data.fromJson(dynamic json) {
    id = json['id'];
    cost = json['cost'];
    created = json['created'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = id;
    map['cost'] = cost;
    map['created'] = created;
    return map;
  }

}