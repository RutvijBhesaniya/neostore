import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neostore/base/base_class.dart';
import 'package:neostore/data/api/add_address_model.dart';
import 'package:neostore/presentation/order_address_list/order_address_list_view.dart';
import 'package:neostore/presentation/widget/neostore_appbar.dart';
import 'package:neostore/presentation/widget/neostore_elevated_button.dart';
import 'package:neostore/presentation/widget/neostore_textformfield.dart';
import 'package:neostore/presentation/widget/neostore_title.dart';
import 'package:neostore/utils/constant_strings.dart';
import 'package:neostore/utils/shared_preferences/memory_management.dart';
import 'package:neostore/utils/style.dart';

class AddAddressView extends BaseClass {
  @override
  BaseClassState getState() {
    return AddAddressViewState();
  }
}

class AddAddressViewState extends BaseClassState {
  TextEditingController _addAddressController = new TextEditingController();

  @override
  getAppBar() {
    return _appBar();
  }

  @override
  Widget getBody() {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: ColorStyles.light_grey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///address title widget
              _addressTitle(),

              ///address textFormField widget
              _addressTextField(),

              ///save button widget
              _saveAddressButton()
            ],
          ),
        ),
      ),
    );
  }

  ///save button widget
  Widget _saveAddressButton() {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(
        top: 5,
        bottom: 30,
      ),
      child: NeoStoreElevatedButton(
        onPressed: () {
          if (MemoryManagement.getAddress() != null) {
            AddAddressModel addAddressModel = AddAddressModel.fromJson(
              jsonDecode(MemoryManagement.getAddress()!),
            );

            List<AddressList> addAddressList = [];

            addAddressList.addAll(addAddressModel.addressList!);

            AddressList addressList = AddressList();
            addressList.address = _addAddressController.text;
            addAddressList.add(addressList);

            AddAddressModel addAddressModels =
                AddAddressModel(addressList: addAddressList);
            String addressValue = json.encode(addAddressModels);
            MemoryManagement.setAddress(address: addressValue);
          } else {
            List<AddressList> addressList = <AddressList>[];
            AddressList addressModel = AddressList();
            addressModel.address = _addAddressController.text;
            addressList.add(addressModel);
            AddAddressModel addAddressModel =
                AddAddressModel(addressList: addressList);
            var addressValue = json.encode(addAddressModel);
            MemoryManagement.setAddress(address: addressValue);
          }
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OrderAddressListView(),
            ),
          );
        },
        text: ConstantStrings.saveAddress,
        textStyle: GoogleFonts.workSans(
          textStyle: TextStyles.titleHeadline!.copyWith(
            fontWeight: FontWeight.bold,
            color: ColorStyles.white,
          ),
        ),
        buttonStyle: TextButton.styleFrom(backgroundColor: ColorStyles.red),
      ),
    );
  }

  ///address textFormField widget
  Widget _addressTextField() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        height: MediaQuery.of(context).size.height /5,
        child: NeoStoreTextFormField(
          hintText: ConstantStrings.please_enter_address,
          hintStyle: GoogleFonts.workSans(
            textStyle: TextStyles.titleHeadline!.copyWith(
              color: ColorStyles.black,
              fontWeight: FontWeight.w400,
            ),
          ),
          controller: _addAddressController,
          maxLine: 4,
          fillColor: ColorStyles.white,
        ),
      ),
    );
  }

  ///address title widget
  Widget _addressTitle() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: NeoStoreTitle(
        text: ConstantStrings.address,
        style: GoogleFonts.workSans(
          textStyle: TextStyles.titleHeadline!.copyWith(
            color: ColorStyles.black,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }

  ///app bar widget
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
          onPressed: () {},
          icon: Icon(Icons.search),
        )
      ],
      text: ConstantStrings.addAddress,
      style: TextStyles.titleHeadline!.copyWith(
        color: ColorStyles.white,
      ),
    );
  }
}
