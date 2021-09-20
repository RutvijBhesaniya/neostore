class RatingEntity {
  int? status;
  DatasEntity? dataEntity;
  String? message;
  String? userMsg;

  RatingEntity({
      this.status, 
      this.dataEntity,
      this.message, 
      this.userMsg});

  RatingEntity.fromJson(dynamic json) {
    status = json['status'];
    dataEntity = json['data'] != null ? DatasEntity.fromJson(json['data']) : null;
    message = json['message'];
    userMsg = json['user_msg'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['status'] = status;
    if (dataEntity != null) {
      map['data'] = dataEntity?.toJson();
    }
    map['message'] = message;
    map['user_msg'] = userMsg;
    return map;
  }

}

class DatasEntity {
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

  DatasEntity({
      this.id, 
      this.productCategoryId, 
      this.name, 
      this.producer, 
      this.description, 
      this.cost, 
      this.rating, 
      this.viewCount, 
      this.created, 
      this.modified});

  DatasEntity.fromJson(dynamic json) {
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
    return map;
  }

}