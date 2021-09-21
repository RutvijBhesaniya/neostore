import 'package:neostore/domain/model/my_account.dart';

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

extension MyAccountExt on MyAccount {
  MyAccountItem mapToPresentation() => MyAccountItem(
      status: this.status,
      dataItem: this.data != null ? this.data?.mapToPresentation() : null);
}

extension MyAccountExtList on List<MyAccount> {
  List<MyAccountItem> mapToPresentation() =>
      this.map((element) => element.mapToPresentation()).toList();
}

extension DataExt on Data {
  DataItem mapToPresentation() => DataItem(
      userDataItem:
          this.userData != null ? this.userData?.mapToPresentation() : null,
      productCategoriesItem: this.productCategories != null
          ? this.productCategories?.mapToPresentation()
          : [],
      totalCarts: this.totalCarts,
      totalOrders: this.totalOrders);
}

extension DataExtList on List<Data> {
  List<DataItem> mapToPresentation() =>
      this.map((element) => element.mapToPresentation()).toList();
}

extension ProductCategoriesExt on ProductCategories {
  ProductCategoriesItem mapToPresentation() => ProductCategoriesItem(
     id:   this.id,
     name:   this.name,
      iconImage:  this.iconImage,
       created: this.created,
      modified:  this.modified,
      );
}

extension ProductCategoriesExtList on List<ProductCategories> {
  List<ProductCategoriesItem> mapToPresentation() =>
      this.map((element) => element.mapToPresentation()).toList();
}


extension UserDataExt on UserData {
  UserDataItem mapToPresentation() => UserDataItem(
     id: this.id,
     roleId: this.roleId,
     firstName: this.firstName,
     lastName: this.lastName,
    email:  this.email,
    username:  this.username,
    profilePic:  this.profilePic,
    countryId:  this.countryId,
     gender: this.gender,
    phoneNo:  this.phoneNo,
     dob: this.dob,
     isActive: this.isActive,
    created:  this.created,
     modified: this.modified,
     accessToken: this.accessToken
  );
}

extension UserDataExtList on List<UserData> {
  List<UserDataItem> mapToPresentation() =>
      this.map((element) => element.mapToPresentation()).toList();
}

