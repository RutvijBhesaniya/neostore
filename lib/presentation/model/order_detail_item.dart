class OrderDetailItem {
  int? status;
  Data? data;

  OrderDetailItem({this.status, this.data});
}

class Data {
  int? id;
  int? cost;
  String? address;
  List<OrderDetailsItem>? orderDetailsItem;

  Data({this.id, this.cost, this.address, this.orderDetailsItem});
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
