class OrderDetailResponse {
  int? status;
  Data? data;

  OrderDetailResponse({
      this.status, 
      this.data});

  OrderDetailResponse.fromJson(dynamic json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['status'] = status;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

class Data {
  int? id;
  int? cost;
  String? address;
  List<OrderDetails>? orderDetails;

  Data({
      this.id, 
      this.cost, 
      this.address, 
      this.orderDetails});

  Data.fromJson(dynamic json) {
    id = json['id'];
    cost = json['cost'];
    address = json['address'];
    if (json['order_details'] != null) {
      orderDetails = [];
      json['order_details'].forEach((v) {
        orderDetails?.add(OrderDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = id;
    map['cost'] = cost;
    map['address'] = address;
    if (orderDetails != null) {
      map['order_details'] = orderDetails?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class OrderDetails {
  int? id;
  int? orderId;
  int? productId;
  int? quantity;
  int? total;
  String? prodName;
  String? prodCatName;
  String? prodImage;

  OrderDetails({
      this.id, 
      this.orderId, 
      this.productId, 
      this.quantity, 
      this.total, 
      this.prodName, 
      this.prodCatName, 
      this.prodImage});

  OrderDetails.fromJson(dynamic json) {
    id = json['id'];
    orderId = json['order_id'];
    productId = json['product_id'];
    quantity = json['quantity'];
    total = json['total'];
    prodName = json['prod_name'];
    prodCatName = json['prod_cat_name'];
    prodImage = json['prod_image'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = id;
    map['order_id'] = orderId;
    map['product_id'] = productId;
    map['quantity'] = quantity;
    map['total'] = total;
    map['prod_name'] = prodName;
    map['prod_cat_name'] = prodCatName;
    map['prod_image'] = prodImage;
    return map;
  }

}