import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neostore/base/base_class.dart';
import 'package:neostore/data/model/add_address_model.dart';
import 'package:neostore/presentation/address_list/address_list_view.dart';
import 'package:neostore/utils/constant_strings.dart';
import 'package:neostore/data/widget/neostore_appbar.dart';
import 'package:neostore/data/widget/neostore_elevated_button.dart';
import 'package:neostore/data/widget/neostore_textformfield.dart';
import 'package:neostore/data/widget/neostore_title.dart';
import 'package:neostore/utils/shared_preferences/memory_management.dart';
import 'package:neostore/utils/style.dart';

class AddAddress extends BaseClass {
  @override
  BaseClassState getState() {
    return AddAddressState();
  }
}

class AddAddressState extends BaseClassState {
  TextEditingController _addAddressController = new TextEditingController();

  @override
  getAppBar() {
    return _appBar();
  }

  @override
  Widget getBody() {
    return Container(
      color: ColorStyles.light_grey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: NeoStoreTitle(
                  text: ConstantStrings.address,
                  style: TextStyles.titleHeadline!.copyWith(
                    color: ColorStyles.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: NeoStoreTextFormField(
                  hintText: 'Address',
                  hintStyle: TextStyles.titleHeadline!.copyWith(
                    color: ColorStyles.black,
                  ),
                  controller: _addAddressController,
                  maxLine: 4,
                  fillColor: ColorStyles.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: NeoStoreTitle(
                  text: ConstantStrings.landmark,
                  style: TextStyles.titleHeadline!.copyWith(
                    color: ColorStyles.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: NeoStoreTextFormField(
                  hintText: 'LANDMARK',
                  hintStyle: TextStyles.titleHeadline!.copyWith(
                    color: ColorStyles.black,
                  ),
                  fillColor: ColorStyles.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          NeoStoreTitle(
                            text: 'CITY',
                            style: TextStyles.titleHeadline!.copyWith(
                              color: ColorStyles.black,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: NeoStoreTextFormField(
                              hintText: 'MUMBAI',
                              hintStyle: TextStyles.titleHeadline!.copyWith(
                                color: ColorStyles.black,
                              ),
                              fillColor: ColorStyles.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Flexible(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          NeoStoreTitle(
                            text: ConstantStrings.state,
                            style: TextStyles.titleHeadline!.copyWith(
                              color: ColorStyles.black,
                            ),
                          ),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: NeoStoreTextFormField(
                                hintText: 'GUJARAT',
                                hintStyle: TextStyles.titleHeadline!.copyWith(
                                  color: ColorStyles.black,
                                ),
                                fillColor: ColorStyles.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          NeoStoreTitle(
                            text: ConstantStrings.zipcode,
                            style: TextStyles.titleHeadline!.copyWith(
                              color: ColorStyles.black,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: NeoStoreTextFormField(
                              hintText: '111111',
                              hintStyle: TextStyles.titleHeadline!.copyWith(
                                color: ColorStyles.black,
                              ),
                              fillColor: ColorStyles.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Flexible(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          NeoStoreTitle(
                            text: ConstantStrings.country,
                            style: TextStyles.titleHeadline!.copyWith(
                              color: ColorStyles.black,
                            ),
                          ),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: NeoStoreTextFormField(
                                hintText: 'INDIA',
                                hintStyle: TextStyles.titleHeadline!.copyWith(
                                  color: ColorStyles.black,
                                ),
                                fillColor: ColorStyles.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(
                  top: 20,
                  bottom: 30,
                ),
                child: NeoStoreElevatedButton(
                  onPressed: () {
                    if (MemoryManagement.getAddress() != null) {
                      print(
                          "address=>${MemoryManagement.getAddress().toString()}");
                      AddAddressModel addAddressModel =
                          AddAddressModel.fromJson(
                        jsonDecode(MemoryManagement.getAddress()!),
                      );
                      List<Addresslist> addAddressList = [];

                      addAddressList.addAll(addAddressModel.addresslist!);

                      Addresslist addressmodel = Addresslist();
                      addressmodel.address = _addAddressController.text;
                      addAddressList.add(addressmodel);

                      AddAddressModel addaddressmodel =
                          AddAddressModel(addresslist: addAddressList);
                      String addressvalue = json.encode(addaddressmodel);
                      MemoryManagement.setAddress(address: addressvalue);
                    } else {
                      print("notaddress");
                      List<Addresslist> addresslist = <Addresslist>[];
                      Addresslist addressmodel = Addresslist();
                      addressmodel.address = _addAddressController.text;
                      addresslist.add(addressmodel);
                      AddAddressModel addaddressmodel =
                          AddAddressModel(addresslist: addresslist);
                      var addressvalue = json.encode(addaddressmodel);
                      MemoryManagement.setAddress(address: addressvalue);
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddressList(),
                      ),
                    );
                  },
                  text: ConstantStrings.saveAddress,
                  textStyle: TextStyles.titleHeadline!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: ColorStyles.white,
                  ),
                  buttonStyle:
                      TextButton.styleFrom(backgroundColor: ColorStyles.red),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }


  Widget _appBar() {
    return NeoStoreAppBar(
      backgroundColour: ColorStyles.red,
      leading: InkWell(
        onTap: (){
          Navigator.pop(context);
        },
        child: Icon(
          Icons.arrow_back_ios,
          color: ColorStyles.white,
          size: 20,
        ),
      ),

      text: ConstantStrings.addAddress,
      style: TextStyles.titleHeadline!.copyWith(
        color: ColorStyles.white,
      ),
    );
  }



}
