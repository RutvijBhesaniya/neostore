import 'package:neostore/data/api/entity/table_category_entity.dart';

class TableCategory {
  TableCategory({
    this.status,
    this.data,
  });

  int? status;
  List<Datum>? data;
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
}

extension TableCategoryEntityExt on TableCategoryEntity {
  TableCategory mapToDomain() => TableCategory(
        status: this.status,
        data: this.dataEntity != null ? this.dataEntity?.mapToDomain() : null,
      );
}

extension TableCategoryEntityExtList on List<TableCategoryEntity> {
  List<TableCategory> mapToDomain() =>
      this.map((element) => element.mapToDomain()).toList();
}

extension DatumEntityExt on DatumEntity {
  Datum mapToDomain() => Datum(
        id: this.id,
        productCategoryId: this.productCategoryId,
        name: this.name,
        producer: this.producer,
        description: this.description,
        cost: this.cost,
        rating: this.rating,
        viewCount: this.viewCount,
        created: this.created,
        modified: this.modified,
        productImages: this.productImages,
      );
}

extension DatumEntityExtList on List<DatumEntity> {
  List<Datum> mapToDomain() =>
      this.map((element) => element.mapToDomain()).toList();
}
