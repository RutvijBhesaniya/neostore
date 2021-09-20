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
