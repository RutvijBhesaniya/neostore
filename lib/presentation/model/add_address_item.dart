import 'package:neostore/domain/model/add_address.dart';

class AddAddressItem {
  List<AddressListItem>? addressListItem;

  AddAddressItem({this.addressListItem});
}

class AddressListItem {
  String? address;

  AddressListItem({this.address});
}

extension AddAddressExt on AddAddress {
  AddAddressItem mapToPresentation() => AddAddressItem(
      addressListItem: this.addressList != null
          ? this.addressList?.mapToPresentation()
          : []);
}

extension AddAddressExtList on List<AddAddress> {
  List<AddAddressItem> mapToPresentation() =>
      this.map((element) => element.mapToPresentation()).toList();
}

extension AddressListExt on AddressList {
  AddressListItem mapToPresentation() => AddressListItem(address: this.address);
}

extension AddressListExtList on List<AddressList> {
  List<AddressListItem> mapToPresentation() =>
      this.map((element) => element.mapToPresentation()).toList();
}
