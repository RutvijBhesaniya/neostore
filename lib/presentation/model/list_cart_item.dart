import 'package:neostore/domain/model/list_cart.dart';

class ListCartItem {
  int? status;
  List<DataItem>? dataItem;
  int? count;
  int? total;

  ListCartItem({this.status, this.dataItem, this.count, this.total});
}

class DataItem {
  int? id;
  int? productId;
  int? quantity;
  ProductItem? productItem;

  DataItem({this.id, this.productId, this.quantity, this.productItem});
}

class ProductItem {
  int? id;
  String? name;
  int? cost;
  String? productCategory;
  String? productImages;
  int? subTotal;

  ProductItem(
      {this.id,
      this.name,
      this.cost,
      this.productCategory,
      this.productImages,
      this.subTotal});
}

extension ListCartExt on ListCart {
  ListCartItem mapToPresentation() => ListCartItem(
      status: this.status,
      dataItem: this.data != null ? this.data?.mapToPresentation() : [],
      total: this.total,
      count: this.count);
}

extension ListCartExtList on List<ListCart> {
  List<ListCartItem> mapToPresentation() =>
      this.map((element) => element.mapToPresentation()).toList();
}

extension DataExt on Data {
  DataItem mapToPresentation() => DataItem(
      id: this.id,
      productId: this.productId,
      quantity: this.quantity,
      productItem:
          this.product != null ? this.product?.mapToPresentation() : null);
}

extension DataExtList on List<Data> {
  List<DataItem> mapToPresentation() =>
      this.map((element) => element.mapToPresentation()).toList();
}

extension ProductExt on Product {
  ProductItem mapToPresentation() => ProductItem(
      id: this.id,
      name: this.name,
      cost: this.cost,
      productCategory: this.productCategory,
      productImages: this.productImages,
      subTotal: this.subTotal);
}

extension ProductExtList on List<Product> {
  List<ProductItem> mapToPresentation() =>
      this.map((element) => element.mapToPresentation()).toList();
}
