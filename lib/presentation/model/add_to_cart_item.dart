import 'package:neostore/domain/model/add_to_cart.dart';

class AddToCartItem {
  int? status;
  bool? data;
  int? totalCarts;
  String? message;
  String? userMsg;

  AddToCartItem(
      {this.status, this.data, this.totalCarts, this.message, this.userMsg});
}

extension AddToCartExt on AddToCart {
  AddToCartItem mapToPresentation() => AddToCartItem(
        status: this.status,
        data: this.data,
        totalCarts: this.totalCarts,
        message: this.message,
        userMsg: this.userMsg,
      );
}

extension AddToCartExtList on List<AddToCart> {
  List<AddToCartItem> mapToPresentation() =>
      this.map((element) => element.mapToPresentation()).toList();
}
