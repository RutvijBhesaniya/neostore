import 'package:neostore/data/api/entity/list_cart_entity.dart';

class ListCart {
  int? status;
  List<Data>? data;
  int? count;
  int? total;

  ListCart({this.status, this.data, this.count, this.total});
}

class Data {
  int? id;
  int? productId;
  int? quantity;
  Product? product;

  Data({this.id, this.productId, this.quantity, this.product});
}

class Product {
  int? id;
  String? name;
  int? cost;
  String? productCategory;
  String? productImages;
  int? subTotal;

  Product(
      {this.id,
      this.name,
      this.cost,
      this.productCategory,
      this.productImages,
      this.subTotal});
}

extension ListCartEntityExt on ListCartEntity {
  ListCart mapToDomain() => ListCart(
      status: this.status,
      data: this.dataEntity != null ? this.dataEntity?.mapToDomain() : [],
      count: this.count,
      total: this.total);
}

extension ListCartEntityListExt on List<ListCartEntity> {
  List<ListCart> mapToDomain() =>
      this.map((element) => element.mapToDomain()).toList();
}

extension DataEntityExt on DataEntity {
  Data mapToDomain() => Data(
      id: this.id,
      productId: this.productId,
      quantity: this.quantity,
      product: this.productEntity != null
          ? this.productEntity?.mapToDomain()
          : null);
}

extension DataEntityListExt on List<DataEntity> {
  List<Data> mapToDomain() =>
      this.map((element) => element.mapToDomain()).toList();
}

extension ProductEntityExt on ProductEntity {
  Product mapToDomain() => Product(
      id: this.id,
      name: this.name,
      cost: this.cost,
      productCategory: this.productCategory,
      productImages: this.productImages,
      subTotal: this.subTotal);
}

extension ProductEntityListExt on List<ProductEntity> {
  List<Product> mapToDomain() =>
      this.map((element) => element.mapToDomain()).toList();
}
