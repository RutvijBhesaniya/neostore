class TableDetailItem {
  int? status;
  DataItem? dataItem;

  TableDetailItem({this.status, this.dataItem});
}

class DataItem {
  int? id;
  int? productCategoryId;
  String? name;
  String? producer;
  String? description;
  int? cost;
  var rating;
  int? viewCount;
  String? created;
  String? modified;
  List<ProductImagesItem>? productImagesItem;

  DataItem(
      {this.id,
      this.productCategoryId,
      this.name,
      this.producer,
      this.description,
      this.cost,
      this.rating,
      this.viewCount,
      this.created,
      this.modified,
      this.productImagesItem});
}

class ProductImagesItem {
  int? id;
  int? productId;
  String? image;
  String? created;
  String? modified;

  ProductImagesItem(
      {this.id, this.productId, this.image, this.created, this.modified});
}
