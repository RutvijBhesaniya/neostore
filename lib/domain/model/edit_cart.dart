import 'package:neostore/data/api/entity/edit_cart_entity.dart';

class EditCart {
  int? status;
  bool? data;
  int? totalCarts;
  String? message;
  String? userMsg;

  EditCart(
      {this.status, this.data, this.totalCarts, this.message, this.userMsg});
}

extension EditCartEntityExt on EditCartEntity {
  EditCart mapToDomain() => EditCart(
        status: this.status,
        data: this.data,
        totalCarts: this.totalCarts,
        message: this.message,
        userMsg: this.userMsg,
      );
}

extension EditCartEntityExtList on List<EditCartEntity> {
  List<EditCart> mapToDomain() =>
      this.map((element) => element.mapToDomain()).toList();
}
