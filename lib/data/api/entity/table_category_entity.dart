import 'dart:convert';

TableCategoryEntity tableCategoryFromJson(String str) => TableCategoryEntity.fromJson(json.decode(str));

String tableCategoryToJson(TableCategoryEntity data) => json.encode(data.toJson());

class TableCategoryEntity {
  TableCategoryEntity({
    this.status,
    this.dataEntity,
  });

  int? status;
  List<DatumEntity>? dataEntity;

  factory TableCategoryEntity.fromJson(Map<String, dynamic> json) => TableCategoryEntity(
    status: json["status"],
    dataEntity: List<DatumEntity>.from(json["data"].map((x) => DatumEntity.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(dataEntity!.map((x) => x.toJson())),
  };
}

class DatumEntity {
  DatumEntity({
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

  factory DatumEntity.fromJson(Map<String, dynamic> json) => DatumEntity(
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
