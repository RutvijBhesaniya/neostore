class AddAddressModel {
  List<AddressList>? addressList;

  AddAddressModel({
      this.addressList});

  AddAddressModel.fromJson(dynamic json) {
    if (json['addresslist'] != null) {
      addressList = [];
      json['addresslist'].forEach((v) {
        addressList?.add(AddressList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (addressList != null) {
      map['addresslist'] = addressList?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class AddressList {
  String? address;

  AddressList({
      this.address});

  AddressList.fromJson(dynamic json) {
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['address'] = address;
    return map;
  }

}