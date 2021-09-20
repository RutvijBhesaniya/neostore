import 'package:neostore/data/api/entity/add_to_cart_entity.dart';

class AddToCart {
  int? status;
  bool? data;
  int? totalCarts;
  String? message;
  String? userMsg;

  AddToCart(
      {this.status, this.data, this.totalCarts, this.message, this.userMsg});
}

extension AddToCartEntityExt on AddToCartEntity {
  AddToCart mapToDomain() => AddToCart(
        status: this.status,
        data: this.data,
        totalCarts: this.totalCarts,
        message: this.message,
        userMsg: this.userMsg,
      );
}

extension AddToCartEntityListExt on List<AddToCartEntity> {
  List<AddToCart> mapToDomain() =>
      this.map((element) => element.mapToDomain()).toList();
}
