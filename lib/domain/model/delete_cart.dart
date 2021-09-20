import 'package:neostore/data/api/entity/delete_cart_entity.dart';

class DeleteCart {
  int? status;
  bool? data;
  int? totalCarts;
  String? message;
  String? userMsg;

  DeleteCart(
      {this.status, this.data, this.totalCarts, this.message, this.userMsg});
}

extension DeleteCartEntityExt on DeleteCartEntity {
  DeleteCart mapToDomain() =>
      DeleteCart(
        status: this.status,
        data: this.data,
        totalCarts: this.totalCarts,
        message: this.message,
        userMsg: this.userMsg,
      );
}

extension DeleteCartEntityExtList on List<DeleteCartEntity> {
  List<DeleteCart> mapToDomain() =>
      this.map((element) => element.mapToDomain()).toList();
}

