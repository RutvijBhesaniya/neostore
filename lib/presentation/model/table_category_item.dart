class TableCategoryItem {
  TableCategoryItem({
    this.status,
    this.dataItem,
  });

  int? status;
  List<DatumItem>? dataItem;
}

class DatumItem {
  DatumItem({
    this.id,
    this.productCategoryId,
    this.name,
    this.producer,
    this.description,
    this.cost,
    this.rating,
    this.viewCount,
    this.created,
    this.modified,
    this.productImages,
  });

  int? id;
  int? productCategoryId;
  String? name;
  String? producer;
  String? description;
  int? cost;
  int? rating;
  int? viewCount;
  String? created;
  String? modified;
  String? productImages;
}
