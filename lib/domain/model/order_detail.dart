import 'package:neostore/data/api/entity/order_detail_entity.dart';

class OrderDetail {
  int? status;
  Data? data;

  OrderDetail({this.status, this.data});
}

class Data {
  int? id;
  int? cost;
  String? address;
  List<OrderDetails>? orderDetails;

  Data({this.id, this.cost, this.address, this.orderDetails});
}

class OrderDetails {
  int? id;
  int? orderId;
  int? productId;
  int? quantity;
  int? total;
  String? prodName;
  String? prodCatName;
  String? prodImage;

  OrderDetails(
      {this.id,
      this.orderId,
      this.productId,
      this.quantity,
      this.total,
      this.prodName,
      this.prodCatName,
      this.prodImage});
}

extension OrderDetailEntityExt on OrderDetailEntity {
  OrderDetail mapToDomain() => OrderDetail(
        status: this.status,
        data: this.dataEntity != null ? this.dataEntity?.mapToDomain() : null,
      );
}

extension OrderDetailEntityExtList on List<OrderDetailEntity> {
  List<OrderDetail> mapToDomain() =>
      this.map((element) => element.mapToDomain()).toList();
}

extension DataEntityExt on DataEntity {
  Data mapToDomain() => Data(
        id: this.id,
        cost: this.cost,
        address: this.address,
        orderDetails: this.orderDetailsEntity != null
            ? this.orderDetailsEntity?.mapToDomain()
            : [],
      );
}

extension DataEntityExtList on List<DataEntity> {
  List<Data> mapToDomain() =>
      this.map((element) => element.mapToDomain()).toList();
}

extension OrderDetailsEntityExt on OrderDetailsEntity {
  OrderDetails mapToDomain() => OrderDetails(
      id: this.id,
      orderId: this.orderId,
      productId: this.productId,
      quantity: this.quantity,
      total: this.total,
      prodName: this.prodName,
      prodCatName: this.prodCatName,
      prodImage: this.prodImage);
}

extension OrderDetailsEntityExtList on List<OrderDetailsEntity> {
  List<OrderDetails> mapToDomain() =>
      this.map((element) => element.mapToDomain()).toList();
}
