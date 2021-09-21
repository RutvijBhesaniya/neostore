import 'package:neostore/domain/model/edit_cart.dart';

class EditCartItem {
  int? status;
  bool? data;
  int? totalCarts;
  String? message;
  String? userMsg;

  EditCartItem(
      {this.status, this.data, this.totalCarts, this.message, this.userMsg});

}

extension EditCartExt on EditCart {
  EditCartItem mapToPresentation() => EditCartItem(
    status: this.status,
    data: this.data,
    totalCarts: this.totalCarts,
    message: this.message,
    userMsg: this.userMsg,
  );
}

extension EditCartExtList on List<EditCart> {
  List<EditCartItem> mapToPresentation() =>
      this.map((element) => element.mapToPresentation()).toList();
}

