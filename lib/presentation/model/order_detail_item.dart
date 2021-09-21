import 'package:neostore/domain/model/order_detail.dart';

class OrderDetailItem {
  int? status;
  DataItem? dataItem;

  OrderDetailItem({this.status, this.dataItem});
}

class DataItem {
  int? id;
  int? cost;
  String? address;
  List<OrderDetailsItem>? orderDetailsItem;

  DataItem({this.id, this.cost, this.address, this.orderDetailsItem});
}

class OrderDetailsItem {
  int? id;
  int? orderId;
  int? productId;
  int? quantity;
  int? total;
  String? prodName;
  String? prodCatName;
  String? prodImage;

  OrderDetailsItem(
      {this.id,
      this.orderId,
      this.productId,
      this.quantity,
      this.total,
      this.prodName,
      this.prodCatName,
      this.prodImage});
}

extension OrderDetailExt on OrderDetail {
  OrderDetailItem mapToPresentation() => OrderDetailItem(
      status: this.status,
      dataItem: this.data != null ? this.data?.mapToPresentation() : null);
}

extension OrderDetailExtList on List<OrderDetail> {
  List<OrderDetailItem> mapToPresentation() =>
      this.map((element) => element.mapToPresentation()).toList();
}

extension DataExt on Data {
  DataItem mapToPresentation() => DataItem(
        id: this.id,
        cost: this.cost,
        address: this.address,
        orderDetailsItem: this.orderDetails != null
            ? this.orderDetails?.mapToPresentation()
            : [],
      );
}

extension DataExtList on List<Data> {
  List<DataItem> mapToPresentation() =>
      this.map((element) => element.mapToPresentation()).toList();
}

extension OrderDetailsExt on OrderDetails {
  OrderDetailsItem mapToPresentation() => OrderDetailsItem(
      id: this.id,
      orderId: this.orderId,
      productId: this.productId,
      quantity: this.quantity,
      total: this.total,
      prodName: this.prodName,
      prodCatName: this.prodCatName,
      prodImage: this.prodImage);
}

extension OrderDetailsExtList on List<OrderDetails> {
  List<OrderDetailsItem> mapToPresentation() =>
      this.map((element) => element.mapToPresentation()).toList();
}
