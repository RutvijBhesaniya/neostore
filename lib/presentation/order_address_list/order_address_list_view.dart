import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neostore/base/base_class.dart';
import 'package:neostore/data/model/add_address_model.dart';
import 'package:neostore/data/model/response/order_address_response.dart';
import 'package:neostore/presentation/add_address/add_address_view.dart';
import 'package:neostore/presentation/my_order/my_order_view.dart';
import 'package:neostore/presentation/order_address_list/order_address_list_viewmodel.dart';
import 'package:neostore/presentation/widget/neostore_appbar.dart';
import 'package:neostore/presentation/widget/neostore_elevated_button.dart';
import 'package:neostore/presentation/widget/neostore_title.dart';
import 'package:neostore/utils/constant_strings.dart';
import 'package:neostore/utils/shared_preferences/memory_management.dart';
import 'package:neostore/utils/style.dart';
import 'package:provider/provider.dart';

class OrderAddressListView extends BaseClass {
  @override
  BaseClassState getState() {
    return OrderAddressListViewState();
  }
}

class OrderAddressListViewState extends BaseClassState {
  List<AddressList> addAddressList = [];
  OrderAddressListProvider? _orderAddressListProvider;

  @override
  void initState() {
    super.initState();

    ///get add address method
    getAddAddress();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _orderAddressListProvider = OrderAddressListProvider(Provider.of(context));
  }

  @override
  getAppBar() {
    return _appBar();
  }

  @override
  getBody() {
    return ChangeNotifierProvider<OrderAddressListProvider>(
      create: (context) => _orderAddressListProvider!,
      child: Consumer<OrderAddressListProvider>(
        builder: (context, model, child) {
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
                            if (_orderAddressListProvider?.currentValue ==
                                null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: NeoStoreTitle(
                                    text: ConstantStrings.please_select_address,
                                  ),
                                ),
                              );
                            } else {
                              var response = await _orderAddressListProvider
                                  ?.getOrderAddress(_orderAddressListProvider!
                                      .currentAddress!);
                              OrderAddressResponse _orderAddressResponse =
                                  OrderAddressResponse.fromJson(
                                      jsonDecode(response));
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
                          buttonStyle: TextButton.styleFrom(
                              backgroundColor: ColorStyles.red),
                          textStyle: GoogleFonts.workSans(
                              textStyle: TextStyles.titlelabel?.copyWith(
                                  color: ColorStyles.white,
                                  fontWeight: FontWeight.w600)),
                        ),
                      )
                    ],
                  ),
                )
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddAddressView(),
                            ),
                          );
                        },
                        child: Icon(Icons.add),
                      ),
                      NeoStoreTitle(
                        text: ConstantStrings.addAddress,
                        style: GoogleFonts.workSans(
                          textStyle: TextStyles.titleHeadline?.copyWith(
                            fontWeight: FontWeight.w400,
                            color: ColorStyles.dark_grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
        },
      ),
    );
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

  ///radio button widget
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
                        builder: (context) => OrderAddressListView(),
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
      groupValue: _orderAddressListProvider?.currentValue,
      onChanged: (value) {
        _orderAddressListProvider?.changeModel(value!, addressList.address!);
      },
    );
  }

  ///appbar widget
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
      style: TextStyles.titleHeadline?.copyWith(
        color: ColorStyles.white,
      ),
    );
  }

  ///get add address method
  void getAddAddress() {
    if (MemoryManagement.getAddress() != null) {
      AddAddressModel addAddressModel = AddAddressModel.fromJson(
        jsonDecode(MemoryManagement.getAddress()!),
      );

      addAddressList.addAll(addAddressModel.addresslist!);
    }
  }
}
