import 'package:neostore/domain/model/table_category.dart';

class TableCategoryItem {
  TableCategoryItem({
    this.status,
    this.dataItem,
  });

  int? status;
  List<DatumItem>? dataItem;
}

class DatumItem {
  DatumItem({
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

extension TableCategoryExt on TableCategory {
  TableCategoryItem mapToPresentation() => TableCategoryItem(
      status: this.status,
      dataItem: this.data != null ? this.data?.mapToPresentation() : []);
}

extension TableCategoryExtList on List<TableCategory> {
  List<TableCategoryItem> mapToPresentation() =>
      this.map((element) => element.mapToPresentation()).toList();
}

extension DatumExt on Datum {
  DatumItem mapToPresentation() => DatumItem(
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

extension DatumExtList on List<Datum> {
  List<DatumItem> mapToPresentation() =>
      this.map((element) => element.mapToPresentation()).toList();
}
