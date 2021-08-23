class RatingRequest {
  RatingRequest({
    this.productId,
  });

  String? productId;

  factory RatingRequest.fromJson(Map<String, dynamic> json) => RatingRequest(
        productId: json["product_id"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
      };
}
