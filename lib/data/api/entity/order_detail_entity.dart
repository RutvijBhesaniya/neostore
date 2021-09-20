class OrderDetailEntity {
  int? status;
  DataEntity? dataEntity;

  OrderDetailEntity({
      this.status, 
      this.dataEntity});

  OrderDetailEntity.fromJson(dynamic json) {
    status = json['status'];
    dataEntity = json['data'] != null ? DataEntity.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['status'] = status;
    if (dataEntity != null) {
      map['data'] = dataEntity?.toJson();
    }
    return map;
  }

}

class DataEntity {
  int? id;
  int? cost;
  String? address;
  List<OrderDetailsEntity>? orderDetailsEntity;

  DataEntity({
      this.id, 
      this.cost, 
      this.address, 
      this.orderDetailsEntity});

  DataEntity.fromJson(dynamic json) {
    id = json['id'];
    cost = json['cost'];
    address = json['address'];
    if (json['order_details'] != null) {
      orderDetailsEntity = [];
      json['order_details'].forEach((v) {
        orderDetailsEntity?.add(OrderDetailsEntity.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = id;
    map['cost'] = cost;
    map['address'] = address;
    if (orderDetailsEntity != null) {
      map['order_details'] = orderDetailsEntity?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class OrderDetailsEntity {
  int? id;
  int? orderId;
  int? productId;
  int? quantity;
  int? total;
  String? prodName;
  String? prodCatName;
  String? prodImage;

  OrderDetailsEntity({
      this.id, 
      this.orderId, 
      this.productId, 
      this.quantity, 
      this.total, 
      this.prodName, 
      this.prodCatName, 
      this.prodImage});

  OrderDetailsEntity.fromJson(dynamic json) {
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