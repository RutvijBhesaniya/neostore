import 'package:neostore/domain/model/rating.dart';

class RatingItem {
  int? status;
  DatasItem? dataItem;
  String? message;
  String? userMsg;

  RatingItem({this.status, this.dataItem, this.message, this.userMsg});
}

class DatasItem {
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

  DatasItem(
      {this.id,
      this.productCategoryId,
      this.name,
      this.producer,
      this.description,
      this.cost,
      this.rating,
      this.viewCount,
      this.created,
      this.modified});
}

extension RatingExt on Rating {
  RatingItem mapToPresentation() => RatingItem(
        status: this.status,
        dataItem: this.data != null ? this.data?.mapToPresentation() : null,
        message: this.message,
        userMsg: this.userMsg,
      );
}

extension RatingExtList on List<Rating> {
  List<RatingItem> mapToPresentation() =>
      this.map((element) => element.mapToPresentation()).toList();
}

extension DatasExt on Datas {
  DatasItem mapToPresentation() => DatasItem(
      id: this.id,
      productCategoryId: this.productCategoryId,
      name: this.name,
      producer: this.producer,
      description: this.description,
      cost: this.cost,
      rating: this.rating,
      viewCount: this.viewCount,
      created: this.created,
      modified: this.modified);
}

extension DatasExtList on List<Datas> {
  List<DatasItem> mapToPresentation() =>
      this.map((element) => element.mapToPresentation()).toList();
}
