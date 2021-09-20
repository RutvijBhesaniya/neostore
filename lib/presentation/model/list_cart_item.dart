class ListCartItem {
  int? status;
  List<DataItem>? dataItem;
  int? count;
  int? total;

  ListCartItem({this.status, this.dataItem, this.count, this.total});
}

class DataItem {
  int? id;
  int? productId;
  int? quantity;
  ProductItem? productItem;

  DataItem({this.id, this.productId, this.quantity, this.productItem});
}

class ProductItem {
  int? id;
  String? name;
  int? cost;
  String? productCategory;
  String? productImages;
  int? subTotal;

  ProductItem(
      {this.id,
      this.name,
      this.cost,
      this.productCategory,
      this.productImages,
      this.subTotal});
}
