import 'package:neostore/domain/model/order_list.dart';

class OrderListItem {
  int? status;
  List<DataItems>? dataItems;
  String? message;
  String? userMsg;

  OrderListItem({this.status, this.dataItems, this.message, this.userMsg});
}

class DataItems {
  int? id;
  int? cost;
  String? created;

  DataItems({this.id, this.cost, this.created});
}

extension OrderListExt on OrderList {
  OrderListItem mapToPresentation() => OrderListItem(
        status: this.status,
        dataItems: this.data != null ? this.data?.mapToPresentation() : [],
        message: this.message,
        userMsg: this.userMsg,
      );
}

extension OrderListExtList on List<OrderList> {
  List<OrderListItem> mapToPresentation() =>
      this.map((element) => element.mapToPresentation()).toList();
}

extension DataExt on Data {
  DataItems mapToPresentation() => DataItems(
        id: this.id,
        cost: this.cost,
        created: this.created,
      );
}

extension DataExtList on List<Data> {
  List<DataItems> mapToPresentation() =>
      this.map((element) => element.mapToPresentation()).toList();
}
