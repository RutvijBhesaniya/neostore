class OrderListEntity {
  int? status;
  List<DataEntity>? dataEntity;
  String? message;
  String? userMsg;

  OrderListEntity({
      this.status, 
      this.dataEntity,
      this.message, 
      this.userMsg});

  OrderListEntity.fromJson(dynamic json) {
    status = json['status'];
    if (json['data'] != null) {
      dataEntity = [];
      json['data'].forEach((v) {
        dataEntity?.add(DataEntity.fromJson(v));
      });
    }
    message = json['message'];
    userMsg = json['user_msg'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['status'] = status;
    if (dataEntity != null) {
      map['data'] = dataEntity?.map((v) => v.toJson()).toList();
    }
    map['message'] = message;
    map['user_msg'] = userMsg;
    return map;
  }

}

class DataEntity {
  int? id;
  int? cost;
  String? created;

  DataEntity({
      this.id, 
      this.cost, 
      this.created});

  DataEntity.fromJson(dynamic json) {
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