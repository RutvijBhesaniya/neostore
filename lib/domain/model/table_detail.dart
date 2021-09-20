class TableDetail {
  int? status;
  Data? data;

  TableDetail({this.status, this.data});
}

class Data {
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
  List<ProductImages>? productImages;

  Data(
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
      this.productImages});
}

class ProductImages {
  int? id;
  int? productId;
  String? image;
  String? created;
  String? modified;

  ProductImages(
      {this.id, this.productId, this.image, this.created, this.modified});
}
