class TableDetailEntity {
  int? status;
  DataEntity? dataEntity;

  TableDetailEntity({
      this.status, 
      this.dataEntity});

  TableDetailEntity.fromJson(dynamic json) {
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
  int? productCategoryId;
  String? name;
  String? producer;
  String? description;
  int? cost;
  var rating;
  int? viewCount;
  String? created;
  String? modified;
  List<ProductImagesEntity>? productImagesEntity;

  DataEntity({
      this.id, 
      this.productCategoryId, 
      this.name, 
      this.producer, 
      this.description, 
      this.cost, 
      this.rating, 
      this.viewCount, 
      this.created, 
      this.modified, 
      this.productImagesEntity});

  DataEntity.fromJson(dynamic json) {
    id = json['id'];
    productCategoryId = json['product_category_id'];
    name = json['name'];
    producer = json['producer'];
    description = json['description'];
    cost = json['cost'];
    rating = json['rating'];
    viewCount = json['view_count'];
    created = json['created'];
    modified = json['modified'];
    if (json['product_images'] != null) {
      productImagesEntity = [];
      json['product_images'].forEach((v) {
        productImagesEntity?.add(ProductImagesEntity.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = id;
    map['product_category_id'] = productCategoryId;
    map['name'] = name;
    map['producer'] = producer;
    map['description'] = description;
    map['cost'] = cost;
    map['rating'] = rating;
    map['view_count'] = viewCount;
    map['created'] = created;
    map['modified'] = modified;
    if (productImagesEntity != null) {
      map['product_images'] = productImagesEntity?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class ProductImagesEntity {
  int? id;
  int? productId;
  String? image;
  String? created;
  String? modified;

  ProductImagesEntity({
      this.id, 
      this.productId, 
      this.image, 
      this.created, 
      this.modified});

  ProductImagesEntity.fromJson(dynamic json) {
    id = json['id'];
    productId = json['product_id'];
    image = json['image'];
    created = json['created'];
    modified = json['modified'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = id;
    map['product_id'] = productId;
    map['image'] = image;
    map['created'] = created;
    map['modified'] = modified;
    return map;
  }

}