import 'package:neostore/domain/model/order_list.dart';

class OrderListItem {
  int? status;
  List<DataItem>? dataItem;
  String? message;
  String? userMsg;

  OrderListItem({this.status, this.dataItem, this.message, this.userMsg});
}

class DataItem {
  int? id;
  int? cost;
  String? created;

  DataItem({this.id, this.cost, this.created});
}

extension OrderListExt on OrderList {
  OrderListItem mapToPresentation() => OrderListItem(
        status: this.status,
        dataItem: this.data != null ? this.data?.mapToPresentation() : [],
        message: this.message,
        userMsg: this.userMsg,
      );
}

extension OrderListExtList on List<OrderList> {
  List<OrderListItem> mapToPresentation() =>
      this.map((element) => element.mapToPresentation()).toList();
}

extension DataExt on Data {
  DataItem mapToPresentation() => DataItem(
        id: this.id,
        cost: this.cost,
        created: this.created,
      );
}

extension DataExtList on List<Data> {
  List<DataItem> mapToPresentation() =>
      this.map((element) => element.mapToPresentation()).toList();
}
