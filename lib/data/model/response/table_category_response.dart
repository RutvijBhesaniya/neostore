// To parse this JSON data, do
//
//     final TableCategoryResponse = TableCategoryResponseFromJson(jsonString);

import 'dart:convert';

TableCategoryResponse TableCategoryResponseFromJson(String str) => TableCategoryResponse.fromJson(json.decode(str));

String TableCategoryResponseToJson(TableCategoryResponse data) => json.encode(data.toJson());

class TableCategoryResponse {
  TableCategoryResponse({
    this.status,
    this.data,
  });

  int? status;
  List<Datum>? data;

  factory TableCategoryResponse.fromJson(Map<String, dynamic> json) => TableCategoryResponse(
    status: json["status"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
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
    this.productImages,
  });

  int? id;
  int? productCategoryId;
  String? name;
  String? producer;
  String? description;
  int? cost;
  int? rating;
  int? viewCount;
  String? created;
  String? modified;
  String? productImages;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    productCategoryId: json["product_category_id"],
    name: json["name"],
    producer: json["producer"],
    description: json["description"],
    cost: json["cost"],
    rating: json["rating"],
    viewCount: json["view_count"],
    created: json["created"],
    modified: json["modified"],
    productImages: json["product_images"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product_category_id": productCategoryId,
    "name": name,
    "producer": producer,
    "description": description,
    "cost": cost,
    "rating": rating,
    "view_count": viewCount,
    "created": created,
    "modified": modified,
    "product_images": productImages,
  };
}
