class ListCartResponse {
  int? status;
  List<Data>? data;
  int? count;
  int? total;

  ListCartResponse({
      this.status, 
      this.data, 
      this.count, 
      this.total});

  ListCartResponse.fromJson(dynamic json) {
    status = json['status'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
    count = json['count'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['status'] = status;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    map['count'] = count;
    map['total'] = total;
    return map;
  }

}

class Data {
  int? id;
  int? productId;
  int? quantity;
  Product? product;

  Data({
      this.id, 
      this.productId, 
      this.quantity, 
      this.product});

  Data.fromJson(dynamic json) {
    id = json['id'];
    productId = json['product_id'];
    quantity = json['quantity'];
    product = json['product'] != null ? Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = id;
    map['product_id'] = productId;
    map['quantity'] = quantity;
    if (product != null) {
      map['product'] = product?.toJson();
    }
    return map;
  }

}

class Product {
  int? id;
  String? name;
  int? cost;
  String? productCategory;
  String? productImages;
  int? subTotal;

  Product({
      this.id, 
      this.name, 
      this.cost, 
      this.productCategory, 
      this.productImages, 
      this.subTotal});

  Product.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    cost = json['cost'];
    productCategory = json['product_category'];
    productImages = json['product_images'];
    subTotal = json['sub_total'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['cost'] = cost;
    map['product_category'] = productCategory;
    map['product_images'] = productImages;
    map['sub_total'] = subTotal;
    return map;
  }

}