import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:neostore/base/base_class.dart';
import 'package:neostore/data/model/add_address_model.dart';
import 'package:neostore/data/model/response/order_address_response.dart';
import 'package:neostore/data/widget/neostore_elevated_button.dart';
import 'package:neostore/data/widget/neostore_title.dart';
import 'package:neostore/presentation/add_address/add_address_view.dart';
import 'package:neostore/presentation/address_list/address_list_view_model.dart';
import 'package:neostore/presentation/my_order/my_order_view.dart';
import 'package:neostore/utils/constant_strings.dart';
import 'package:neostore/utils/shared_preferences/SharedPrefsKeys.dart';
import 'package:neostore/utils/shared_preferences/memory_management.dart';
import 'package:neostore/utils/style.dart';
import 'package:provider/provider.dart';

class AddressList extends BaseClass {
  @override
  BaseClassState getState() {
    return AddressListState();
  }
}

enum Type { ischecked, isnotchecked }

class AddressListState extends BaseClassState {
  final snackBar = SnackBar(content: Text('Please Enter Address'));
  List<Addresslist> addAddressList = [];
  late ChangeAddress _changeAddress;
  late AddressListProvider _addressListProvider =
      Provider.of<AddressListProvider>(context, listen: false);

  @override
  void initState() {
    // TODO: implement initState
    getaddAddress();
  }

  @override
  getAppBar() {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back),
      ),
      title: Text(
        'Address List',
      ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddAddress(),
              ),
            );
          },
          icon: Icon(Icons.add),
        ),
      ],
    );
  }

  @override
  getBody() {
    _changeAddress = Provider.of<ChangeAddress>(context);

    return addAddressList.length > 0
        ? Padding(
            padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NeoStoreTitle(
                  text: 'Shipping Address',
                  style: TextStyles.titleHeadline,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: ScrollPhysics(),
                    itemCount: addAddressList.length,
                    itemBuilder: (context, index) {
                      return _radioButton(addAddressList[index], index);
                      // Text(addAddressList[index].address!);
                    },
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: NeoStoreElevatedButton(
                    onPressed: () async {
                      var response = await _addressListProvider
                          .getOrderAddress(_changeAddress.currentAddress!);
                      OrderAddressResponse _orderAddressResponse =
                          OrderAddressResponse.fromJson(jsonDecode(response));
                      if (_orderAddressResponse.status == 200) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyOrderView(),
                          ),
                        );
                      }
                    },
                    text: ConstantStrings.placeOrder,
                    buttonStyle:
                        TextButton.styleFrom(backgroundColor: ColorStyles.red),
                    textStyle: TextStyles.titlelabel!.copyWith(
                      color: ColorStyles.white,
                    ),
                  ),
                )
              ],
            ),
          )
        : Text('Add Address');
  }

  Widget _radioButton(Addresslist addresslist, int index) {
    return RadioListTile<int>(
      value: index,
      title: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: ColorStyles.liver_grey,
          ),
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 8,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              NeoStoreTitle(
                text: addresslist.address!,
                style: TextStyles.labelName,
                maxLine: 4,
              ),
              Positioned(
                top: 0,
                right: 0,
                child: GestureDetector(
                  onTap: () async {
                    MemoryManagement.prefs.remove(SharedPrefsKeys.ADDRESS);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddressList(),
                      ),
                    );
                  },
                  child: Container(
                    height: 17,
                    width: 17,
                    child: Image(
                      image: AssetImage('assets/images/wrong_image.png'),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      groupValue: _changeAddress.currentValue,
      onChanged: (value) {
        _changeAddress.changeModel(value!, addresslist.address!);
      },
    );
  }

  // AppBar _appBar() {
  //   return NeoStoreAppBar(
  //     backgroundColour: ColorStyles.purple,
  //     leading: Icon(
  //       Icons.arrow_back_ios,
  //       color: ColorStyles.white,
  //       size: 20,
  //     ),
  //     text: ConstantStrings.addAddress,
  //     style: TextStyles.titleHeadline!.copyWith(
  //       color: ColorStyles.white,
  //     ),
  //   );
  // }

  void getaddAddress() {
    print("MEMORYADDRESS=>${MemoryManagement.getAddress()}");
    if (MemoryManagement.getAddress() != null) {
      print("address=>${MemoryManagement.getAddress().toString()}");
      AddAddressModel addAddressModel = AddAddressModel.fromJson(
        jsonDecode(MemoryManagement.getAddress()!),
      );

      addAddressList.addAll(addAddressModel.addresslist!);
    }
  }
}
