import 'package:neostore/domain/model/order_address.dart';

class OrderAddressItem {
  int? status;
  String? message;
  String? userMsg;

  OrderAddressItem({this.status, this.message, this.userMsg});
}

extension OrderAddressExt on OrderAddress {
  OrderAddressItem mapToPresentation() => OrderAddressItem(
        status: this.status,
        message: this.message,
        userMsg: this.userMsg,
      );
}

extension OrderAddressExtList on List<OrderAddress> {
  List<OrderAddressItem> mapToPresentation() =>
      this.map((element) => element.mapToPresentation()).toList();
}
