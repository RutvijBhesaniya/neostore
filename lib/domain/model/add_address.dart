import 'package:neostore/data/api/entity/add_address_entity.dart';

class AddAddress {
  List<AddressList>? addressList;

  AddAddress({this.addressList});
}

class AddressList {
  String? address;

  AddressList({this.address});
}

extension AddAddressEntityExt on AddAddressEntity {
  AddAddress mapToDomain() => AddAddress(
      addressList: this.addressListEntity != null
          ? this.addressListEntity?.mapToDomain()
          : []);
}

extension AddAddressEntityExtList on List<AddAddressEntity> {
  List<AddAddress> mapToDomain() =>
      this.map((element) => element.mapToDomain()).toList();
}

extension AddressListEntityExt on AddressListEntity {
  AddressList mapToDomain() => AddressList(address: this.address);
}

extension AddressListEntityExtList on List<AddressListEntity> {
  List<AddressList> mapToDomain() =>
      this.map((element) => element.mapToDomain()).toList();
}
