import 'package:neostore/data/api/entity/order_address_entity.dart';

class OrderAddress {
  int? status;
  String? message;
  String? userMsg;

  OrderAddress({this.status, this.message, this.userMsg});
}

extension OrderAddressEntityExt on OrderAddressEntity {
  OrderAddress mapToDomain() => OrderAddress(
        status: this.status,
        message: this.message,
        userMsg: this.userMsg,
      );
}

extension OrderAddressEntityExtList on List<OrderAddressEntity> {
  List<OrderAddress> mapToDomain() =>
      this.map((element) => element.mapToDomain()).toList();
}
