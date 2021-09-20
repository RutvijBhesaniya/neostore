import 'package:neostore/data/api/entity/order_list_entity.dart';

class OrderList {
  int? status;
  List<Data>? data;
  String? message;
  String? userMsg;

  OrderList({this.status, this.data, this.message, this.userMsg});
}

class Data {
  int? id;
  int? cost;
  String? created;

  Data({this.id, this.cost, this.created});
}

extension OrderListEntityExt on OrderListEntity {
  OrderList mapToDomain() => OrderList(
        status: this.status,
        data: this.dataEntity != null ? this.dataEntity?.mapToDomain() : null,
        message: this.message,
        userMsg: this.userMsg,
      );
}

extension OrderListEntityExtList on List<OrderListEntity> {
  List<OrderList> mapToDomain() =>
      this.map((element) => element.mapToDomain()).toList();
}

extension DataEntityExt on DataEntity {
  Data mapToDomain() => Data(
        id: this.id,
        cost: this.cost,
        created: this.created,
      );
}

extension DataEntityExtList on List<DataEntity> {
  List<Data> mapToDomain() =>
      this.map((element) => element.mapToDomain()).toList();
}
