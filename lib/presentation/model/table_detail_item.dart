import 'package:neostore/domain/model/table_detail.dart';

class TableDetailItem {
  int? status;
  DataItem? dataItem;

  TableDetailItem({this.status, this.dataItem});
}

class DataItem {
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
  List<ProductImagesItem>? productImagesItem;

  DataItem(
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
      this.productImagesItem});
}

class ProductImagesItem {
  int? id;
  int? productId;
  String? image;
  String? created;
  String? modified;

  ProductImagesItem(
      {this.id, this.productId, this.image, this.created, this.modified});
}

extension TableDetailExt on TableDetail {
  TableDetailItem mapToPresentation() => TableDetailItem(
      status: this.status,
      dataItem: this.data != null ? this.data?.mapToPresentation() : null);
}

extension TableDetailExtList on List<TableDetail> {
  List<TableDetailItem> mapToPresentation() =>
      this.map((element) => element.mapToPresentation()).toList();
}

extension DataExt on Data {
  DataItem mapToPresentation() => DataItem(
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
      productImagesItem: this.productImages != null
          ? this.productImages?.mapToPresentation()
          : []);
}

extension DataExtList on List<Data> {
  List<DataItem> mapToPresentation() =>
      this.map((element) => element.mapToPresentation()).toList();
}

extension ProductImagesExt on ProductImages {
  ProductImagesItem mapToPresentation() => ProductImagesItem(
        id: this.id,
        productId: this.productId,
        image: this.image,
        created: this.created,
        modified: this.modified,
      );
}

extension ProductImagesExtList on List<ProductImages> {
  List<ProductImagesItem> mapToPresentation() =>
      this.map((element) => element.mapToPresentation()).toList();
}
