class MyAccountItem {
  int? status;
  DataItem? dataItem;

  MyAccountItem({this.status, this.dataItem});
}

class DataItem {
  UserDataItem? userDataItem;
  List<ProductCategoriesItem>? productCategoriesItem;
  int? totalCarts;
  int? totalOrders;

  DataItem(
      {this.userDataItem,
      this.productCategoriesItem,
      this.totalCarts,
      this.totalOrders});
}

class ProductCategoriesItem {
  int? id;
  String? name;
  String? iconImage;
  String? created;
  String? modified;

  ProductCategoriesItem(
      {this.id, this.name, this.iconImage, this.created, this.modified});
}

class UserDataItem {
  int? id;
  int? roleId;
  String? firstName;
  String? lastName;
  String? email;
  String? username;
  dynamic profilePic;
  dynamic countryId;
  String? gender;
  String? phoneNo;
  dynamic dob;
  bool? isActive;
  String? created;
  String? modified;
  String? accessToken;

  UserDataItem(
      {this.id,
      this.roleId,
      this.firstName,
      this.lastName,
      this.email,
      this.username,
      this.profilePic,
      this.countryId,
      this.gender,
      this.phoneNo,
      this.dob,
      this.isActive,
      this.created,
      this.modified,
      this.accessToken});
}
