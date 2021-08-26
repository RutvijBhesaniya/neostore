class MyAccountResponse {
  int? status;
  Data? data;

  MyAccountResponse({
      this.status, 
      this.data});

  MyAccountResponse.fromJson(dynamic json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['status'] = status;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

class Data {
  User_data? userData;
  List<Product_categories>? productCategories;
  int? totalCarts;
  int? totalOrders;

  Data({
      this.userData, 
      this.productCategories, 
      this.totalCarts, 
      this.totalOrders});

  Data.fromJson(dynamic json) {
    userData = json['user_data'] != null ? User_data.fromJson(json['user_data']) : null;
    if (json['product_categories'] != null) {
      productCategories = [];
      json['product_categories'].forEach((v) {
        productCategories?.add(Product_categories.fromJson(v));
      });
    }
    totalCarts = json['total_carts'];
    totalOrders = json['total_orders'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (userData != null) {
      map['user_data'] = userData?.toJson();
    }
    if (productCategories != null) {
      map['product_categories'] = productCategories?.map((v) => v.toJson()).toList();
    }
    map['total_carts'] = totalCarts;
    map['total_orders'] = totalOrders;
    return map;
  }

}

class Product_categories {
  int? id;
  String? name;
  String? iconImage;
  String? created;
  String? modified;

  Product_categories({
      this.id, 
      this.name, 
      this.iconImage, 
      this.created, 
      this.modified});

  Product_categories.fromJson(dynamic json) {
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

class User_data {
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

  User_data({
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

  User_data.fromJson(dynamic json) {
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