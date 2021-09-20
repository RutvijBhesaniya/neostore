class AddAddressEntity {
  List<AddressListEntity>? addressListEntity;

  AddAddressEntity({
      this.addressListEntity});

  AddAddressEntity.fromJson(dynamic json) {
    if (json['addresslist'] != null) {
      addressListEntity = [];
      json['addresslist'].forEach((v) {
        addressListEntity?.add(AddressListEntity.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (addressListEntity != null) {
      map['addresslist'] = addressListEntity?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class AddressListEntity {
  String? address;

  AddressListEntity({
      this.address});

  AddressListEntity.fromJson(dynamic json) {
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['address'] = address;
    return map;
  }

}