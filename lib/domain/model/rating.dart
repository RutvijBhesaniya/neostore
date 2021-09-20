import 'package:neostore/data/api/entity/rating_entity.dart';

class Rating {
  int? status;
  Datas? data;
  String? message;
  String? userMsg;

  Rating({this.status, this.data, this.message, this.userMsg});
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

  Datas(
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

extension RatingEntityExt on RatingEntity {
  Rating mapToDomain() => Rating(
        status: this.status,
        data: this.dataEntity != null ? this.dataEntity?.mapToDomain() : null,
        message: this.message,
        userMsg: this.userMsg,
      );
}

extension RatingEntityExtList on List<RatingEntity> {
  List<Rating> mapToDomain() =>
      this.map((element) => element.mapToDomain()).toList();
}

extension DatasEntityExt on DatasEntity {
  Datas mapToDomain() => Datas(
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

extension DatasEntityExtList on List<DatasEntity> {
  List<Datas> mapToDomain() =>
      this.map((element) => element.mapToDomain()).toList();
}
