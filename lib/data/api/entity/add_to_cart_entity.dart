class AddToCartEntity {
  int? status;
  bool? data;
  int? totalCarts;
  String? message;
  String? userMsg;

  AddToCartEntity(

      {this.status, this.data, this.totalCarts, this.message, this.userMsg});

  AddToCartEntity.fromJson(dynamic json) {
    status = json['status'];
    data = json['data'];
    totalCarts = json['total_carts'];
    message = json['message'];
    userMsg = json['user_msg'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['status'] = status;
    map['data'] = data;
    map['total_carts'] = totalCarts;
    map['message'] = message;
    map['user_msg'] = userMsg;
    return map;
  }
}
