import 'package:neostore/data/api/entity/table_detail_entity.dart';

class TableDetail {
  int? status;
  Data? data;

  TableDetail({this.status, this.data});
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

  Data(
      {this.id,
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
}

class ProductImages {
  int? id;
  int? productId;
  String? image;
  String? created;
  String? modified;

  ProductImages(
      {this.id, this.productId, this.image, this.created, this.modified});
}

extension TableDetailEntityExt on TableDetailEntity {
  TableDetail mapToDomain() => TableDetail(
        status: this.status,
        data: this.dataEntity != null ? this.dataEntity?.mapToDomain() : null,
      );
}

extension TableDetailEntityExtList on List<TableDetailEntity> {
  List<TableDetail> mapToDomain() =>
      this.map((element) => element.mapToDomain()).toList();
}

extension DataEntityExt on DataEntity {
  Data mapToDomain() => Data(
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
      productImages: this.productImagesEntity != null
          ? this.productImagesEntity?.mapToDomain()
          : []);
}

extension DataEntityExtList on List<DataEntity> {
  List<Data> mapToDomain() =>
      this.map((element) => element.mapToDomain()).toList();
}

extension ProductImagesEntityExt on ProductImagesEntity {
  ProductImages mapToDomain() => ProductImages(
        id: this.id,
        productId: this.productId,
        image: this.image,
        created: this.created,
        modified: this.modified,
      );
}

extension ProductImagesEntityExtList on List<ProductImagesEntity> {
  List<ProductImages> mapToDomain() =>
      this.map((element) => element.mapToDomain()).toList();
}
