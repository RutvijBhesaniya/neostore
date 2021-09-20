class ListCartEntity {
  int? status;
  List<DataEntity>? dataEntity;
  int? count;
  int? total;

  ListCartEntity({
      this.status, 
      this.dataEntity,
      this.count, 
      this.total});

  ListCartEntity.fromJson(dynamic json) {
    status = json['status'];
    if (json['data'] != null) {
      dataEntity = [];
      json['data'].forEach((v) {
        dataEntity?.add(DataEntity.fromJson(v));
      });
    }
    count = json['count'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['status'] = status;
    if (dataEntity != null) {
      map['data'] = dataEntity?.map((v) => v.toJson()).toList();
    }
    map['count'] = count;
    map['total'] = total;
    return map;
  }

}

class DataEntity {
  int? id;
  int? productId;
  int? quantity;
  ProductEntity? productEntity;

  DataEntity({
      this.id, 
      this.productId, 
      this.quantity, 
      this.productEntity});

  DataEntity.fromJson(dynamic json) {
    id = json['id'];
    productId = json['product_id'];
    quantity = json['quantity'];
    productEntity = json['product'] != null ? ProductEntity.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = id;
    map['product_id'] = productId;
    map['quantity'] = quantity;
    if (productEntity != null) {
      map['product'] = productEntity?.toJson();
    }
    return map;
  }

}

class ProductEntity {
  int? id;
  String? name;
  int? cost;
  String? productCategory;
  String? productImages;
  int? subTotal;

  ProductEntity({
      this.id, 
      this.name, 
      this.cost, 
      this.productCategory, 
      this.productImages, 
      this.subTotal});

  ProductEntity.fromJson(dynamic json) {
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