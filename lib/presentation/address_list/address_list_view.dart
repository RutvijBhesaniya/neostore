import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neostore/base/base_class.dart';
import 'package:neostore/data/model/add_address_model.dart';
import 'package:neostore/data/model/response/order_address_response.dart';
import 'package:neostore/data/widget/neostore_appbar.dart';
import 'package:neostore/data/widget/neostore_elevated_button.dart';
import 'package:neostore/data/widget/neostore_title.dart';
import 'package:neostore/presentation/add_address/add_address_view.dart';
import 'package:neostore/presentation/address_list/address_list_view_model.dart';
import 'package:neostore/presentation/my_order/my_order_view.dart';
import 'package:neostore/utils/constant_strings.dart';
import 'package:neostore/utils/shared_preferences/memory_management.dart';
import 'package:neostore/utils/style.dart';
import 'package:provider/provider.dart';

class AddressListView extends BaseClass {
  @override
  BaseClassState getState() {
    return AddressListViewState();
  }
}

class AddressListViewState extends BaseClassState {
  List<AddressList> addAddressList = [];
  AddressListProvider? _addressListProvider;

  @override
  void initState() {
    super.initState();
    getAddAddress();
  }

  @override
  getAppBar() {
    return _appBar();
  }

  @override
  getBody() {
    _addressListProvider =
        Provider.of<AddressListProvider>(context);

    return addAddressList.length > 0
        ? Padding(
            padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///shipping address title widget
                _shippingAddressTitle(),

                ///radio button list tile
                _addressRadioButton(),


                ///place order button widget
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: NeoStoreElevatedButton(
                    onPressed: () async {
                      if (_addressListProvider?.currentValue == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: NeoStoreTitle(text: ConstantStrings.please_select_address,),
                          ),
                        );
                      } else {
                        var response = await _addressListProvider
                            ?.getOrderAddress(_addressListProvider!.currentAddress!);
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
                      }
                    },
                    text: ConstantStrings.placeOrder,
                    buttonStyle:
                        TextButton.styleFrom(backgroundColor: ColorStyles.red),
                    textStyle: GoogleFonts.workSans(
                        textStyle: TextStyles.titlelabel?.copyWith(
                            color: ColorStyles.white,
                            fontWeight: FontWeight.w600)),
                  ),
                )
              ],
            ),
          )
        : NeoStoreTitle(text: ConstantStrings.addAddress,style: GoogleFonts.workSans(
      textStyle: TextStyles.titleHeadline?.copyWith(
        fontWeight: FontWeight.w400,
        color: ColorStyles.dark_grey,
      ),
    ),);
  }


  ///radio button list tile
  Widget _addressRadioButton() {
    return Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: ScrollPhysics(),
                  itemCount: addAddressList.length,
                  itemBuilder: (context, index) {
                    return _radioButton(addAddressList[index], index);
                  },
                ),
              );
  }


  ///shipping address title widget
  Widget _shippingAddressTitle() {
    return NeoStoreTitle(
                text: ConstantStrings.shipping_address,
                style: GoogleFonts.workSans(
                  textStyle: TextStyles.titleHeadline?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: ColorStyles.dark_grey,
                  ),
                ),
              );
  }

  Widget _radioButton(AddressList addressList, int index) {
    return RadioListTile<int>(
      activeColor: ColorStyles.dark_grey,

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
                text: addressList.address,
                style: TextStyles.labelName,
                maxLine: 4,
              ),
              Positioned(
                top: 0,
                right: 0,
                child: GestureDetector(
                  onTap: () async {
                    String? response = MemoryManagement.getAddress();
                    AddAddressModel result =
                        AddAddressModel.fromJson(json.decode(response!));
                    result.addresslist!.removeAt(index);
                    String addr = json.encode(result);
                    MemoryManagement.setAddress(address: addr);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddressListView(),
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
      groupValue: _addressListProvider?.currentValue,
      onChanged: (value) {
        _addressListProvider?.changeModel(value!, addressList.address!);
      },
    );
  }

  Widget _appBar() {
    return NeoStoreAppBar(
      backgroundColour: ColorStyles.red,
      leading: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Icon(
          Icons.arrow_back_ios,
          color: ColorStyles.white,
          size: 20,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddAddressView(),
              ),
            );
          },
          icon: Icon(Icons.add),
        )
      ],
      text: ConstantStrings.addAddress,
      style: TextStyles.titleHeadline?.copyWith(color: ColorStyles.white,
      ),
    );
  }

  void getAddAddress() {
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
