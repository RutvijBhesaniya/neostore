import 'package:neostore/data/api/entity/my_account_entity.dart';

class MyAccount {
  int? status;
  Data? data;

  MyAccount({this.status, this.data});
}

class Data {
  UserData? userData;
  List<ProductCategories>? productCategories;
  int? totalCarts;
  int? totalOrders;

  Data({
    this.userData,
    this.productCategories,
    this.totalCarts,
    this.totalOrders,
  });
}

class ProductCategories {
  int? id;
  String? name;
  String? iconImage;
  String? created;
  String? modified;

  ProductCategories(
      {this.id, this.name, this.iconImage, this.created, this.modified});
}

class UserData {
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

  UserData(
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

extension MyAccountEntityExt on MyAccountEntity {
  MyAccount mapToDomain() => MyAccount(
        status: this.status,
        data: this.dataEntity != null ? this.dataEntity?.mapToDomain() : null,
      );
}

extension MyAccountEntityExtList on List<MyAccountEntity> {
  List<MyAccount> mapToDomain() =>
      this.map((element) => element.mapToDomain()).toList();
}

extension DataEntityExt on DataEntity {
  Data mapToDomain() => Data(
      userData: this.userDataEntity != null
          ? this.userDataEntity?.mapToDomain()
          : null,
      productCategories: this.productCategoriesEntity != null
          ? this.productCategoriesEntity?.mapToDomain()
          : null,
      totalCarts: this.totalCarts,
      totalOrders: this.totalOrders);
}

extension DataEntityExtList on List<DataEntity> {
  List<Data> mapToDomain() =>
      this.map((element) => element.mapToDomain()).toList();
}

extension ProductCategoriesExt on ProductCategoriesEntity {
  ProductCategories mapToDomain() => ProductCategories(
        id: this.id,
        name: this.name,
        iconImage: this.iconImage,
        created: this.created,
        modified: this.modified,
      );
}

extension ProductCategoriesExtList on List<ProductCategoriesEntity> {
  List<ProductCategories> mapToDomain() =>
      this.map((element) => element.mapToDomain()).toList();
}

extension UserDataEntityExt on UserDataEntity {
  UserData mapToDomain() => UserData(
      roleId: this.roleId,
      firstName: this.firstName,
      lastName: this.lastName,
      email: this.email,
      username: this.username,
      profilePic: this.profilePic,
      countryId: this.countryId,
      gender: this.gender,
      phoneNo: this.phoneNo,
      dob: this.dob,
      isActive: this.isActive,
      created: this.created,
      modified: this.modified,
      accessToken: this.accessToken);
}

extension UserDataEntityExtList on List<UserDataEntity> {
  List<UserData> mapToDomain() =>
      this.map((element) => element.mapToDomain()).toList();
}
