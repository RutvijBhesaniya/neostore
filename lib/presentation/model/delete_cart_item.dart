import 'package:neostore/domain/model/delete_cart.dart';

class DeleteCartItem {
  int? status;
  bool? data;
  int? totalCarts;
  String? message;
  String? userMsg;

  DeleteCartItem(
      {this.status, this.data, this.totalCarts, this.message, this.userMsg});
}

extension DeleteCartExt on DeleteCart {
  DeleteCartItem mapToPresentation() => DeleteCartItem(
    status: this.status,
    data: this.data,
    totalCarts: this.totalCarts,
    message: this.message,
    userMsg: this.userMsg,
  );
}

extension AddToCartExtList on List<DeleteCart> {
  List<DeleteCartItem> mapToPresentation() =>
      this.map((element) => element.mapToPresentation()).toList();
}

