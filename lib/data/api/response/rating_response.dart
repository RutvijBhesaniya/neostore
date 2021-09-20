class RatingResponse {
  int? status;
  Datas? data;
  String? message;
  String? userMsg;

  RatingResponse({
      this.status, 
      this.data, 
      this.message, 
      this.userMsg});

  RatingResponse.fromJson(dynamic json) {
    status = json['status'];
    data = json['data'] != null ? Datas.fromJson(json['data']) : null;
    message = json['message'];
    userMsg = json['user_msg'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['status'] = status;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['message'] = message;
    map['user_msg'] = userMsg;
    return map;
  }

}

class Datas {
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

  Datas({
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

  Datas.fromJson(dynamic json) {
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