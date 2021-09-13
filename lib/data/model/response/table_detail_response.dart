class TableDetailResponse {
  int? status;
  Data? data;

  TableDetailResponse({
      this.status, 
      this.data});

  TableDetailResponse.fromJson(dynamic json) {
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
  int? productCategoryId;
  String? name;
  String? producer;
  String? description;
  int? cost;
  var rating;
  int? viewCount;
  String? created;
  String? modified;
  List<ProductImages>? productImages;

  Data({
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
      this.productImages});

  Data.fromJson(dynamic json) {
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
      productImages = [];
      json['product_images'].forEach((v) {
        productImages?.add(ProductImages.fromJson(v));
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
    if (productImages != null) {
      map['product_images'] = productImages?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class ProductImages {
  int? id;
  int? productId;
  String? image;
  String? created;
  String? modified;

  ProductImages({
      this.id, 
      this.productId, 
      this.image, 
      this.created, 
      this.modified});

  ProductImages.fromJson(dynamic json) {
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