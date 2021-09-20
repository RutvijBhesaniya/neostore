class RatingItem {
  int? status;
  DatasItem? dataItem;
  String? message;
  String? userMsg;

  RatingItem({this.status, this.dataItem, this.message, this.userMsg});
}

class DatasItem {
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

  DatasItem(
      {this.id,
      this.productCategoryId,
      this.name,
      this.producer,
      this.description,
      this.cost,
      this.rating,
      this.viewCount,
      this.created,
      this.modified});
}
