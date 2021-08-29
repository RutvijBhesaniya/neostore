class AddAddressModel {
  List<Addresslist>? addresslist;

  AddAddressModel({
      this.addresslist});

  AddAddressModel.fromJson(dynamic json) {
    if (json['addresslist'] != null) {
      addresslist = [];
      json['addresslist'].forEach((v) {
        addresslist?.add(Addresslist.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (addresslist != null) {
      map['addresslist'] = addresslist?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Addresslist {
  String? address;

  Addresslist({
      this.address});

  Addresslist.fromJson(dynamic json) {
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['address'] = address;
    return map;
  }

}