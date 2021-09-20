class MyAccountEntity {
  int? status;
  DataEntity? dataEntity;

  MyAccountEntity({
      this.status, 
      this.dataEntity});

  MyAccountEntity.fromJson(dynamic json) {
    status = json['status'];
    dataEntity = json['data'] != null ? DataEntity.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['status'] = status;
    if (dataEntity != null) {
      map['data'] = dataEntity?.toJson();
    }
    return map;
  }

}

class DataEntity {
  UserDataEntity? userDataEntity;
  List<ProductCategoriesEntity>? productCategoriesEntity;
  int? totalCarts;
  int? totalOrders;

  DataEntity({
      this.userDataEntity,
      this.productCategoriesEntity,
      this.totalCarts, 
      this.totalOrders});

  DataEntity.fromJson(dynamic json) {
    userDataEntity = json['user_data'] != null ? UserDataEntity.fromJson(json['user_data']) : null;
    if (json['product_categories'] != null) {
      productCategoriesEntity = [];
      json['product_categories'].forEach((v) {
        productCategoriesEntity?.add(ProductCategoriesEntity.fromJson(v));
      });
    }
    totalCarts = json['total_carts'];
    totalOrders = json['total_orders'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (userDataEntity != null) {
      map['user_data'] = userDataEntity?.toJson();
    }
    if (productCategoriesEntity != null) {
      map['product_categories'] = productCategoriesEntity?.map((v) => v.toJson()).toList();
    }
    map['total_carts'] = totalCarts;
    map['total_orders'] = totalOrders;
    return map;
  }

}

class ProductCategoriesEntity {
  int? id;
  String? name;
  String? iconImage;
  String? created;
  String? modified;

  ProductCategoriesEntity({
      this.id, 
      this.name, 
      this.iconImage, 
      this.created, 
      this.modified});

  ProductCategoriesEntity.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    iconImage = json['icon_image'];
    created = json['created'];
    modified = json['modified'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['icon_image'] = iconImage;
    map['created'] = created;
    map['modified'] = modified;
    return map;
  }

}

class UserDataEntity {
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

  UserDataEntity({
      this.id, 
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

  UserDataEntity.fromJson(dynamic json) {
    id = json['id'];
    roleId = json['role_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    username = json['username'];
    profilePic = json['profile_pic'];
    countryId = json['country_id'];
    gender = json['gender'];
    phoneNo = json['phone_no'];
    dob = json['dob'];
    isActive = json['is_active'];
    created = json['created'];
    modified = json['modified'];
    accessToken = json['access_token'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = id;
    map['role_id'] = roleId;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['email'] = email;
    map['username'] = username;
    map['profile_pic'] = profilePic;
    map['country_id'] = countryId;
    map['gender'] = gender;
    map['phone_no'] = phoneNo;
    map['dob'] = dob;
    map['is_active'] = isActive;
    map['created'] = created;
    map['modified'] = modified;
    map['access_token'] = accessToken;
    return map;
  }

}