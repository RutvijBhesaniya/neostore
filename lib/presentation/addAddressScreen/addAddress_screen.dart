import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neostore/base/baseClass.dart';
import 'package:neostore/utils/constant_strings.dart';
import 'package:neostore/utils/neostore_common_widgets/neostore_appbar.dart';
import 'package:neostore/utils/neostore_common_widgets/neostore_elevated_button.dart';
import 'package:neostore/utils/neostore_common_widgets/neostore_textformfield.dart';
import 'package:neostore/utils/neostore_common_widgets/neostore_title.dart';
import 'package:neostore/utils/style.dart';

class AddAddress extends BaseClass {
  @override
  BaseClassState getState() {
    return AddAddressState();
  }
}

class AddAddressState extends BaseClassState {
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
                margin: EdgeInsets.only(top: 20, bottom: 30),
                child: NeoStoreElevatedButton(
                  text: ConstantStrings.editProfile,
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

  ///widget app bar
  NeoStoreAppBar _appBar() {
    return NeoStoreAppBar(
      backgroundColour: ColorStyles.purple,
      leading: Icon(
        Icons.arrow_back_ios,
        color: ColorStyles.white,
        size: 20,
      ),
      text: ConstantStrings.addAddress,
      style: TextStyles.titleHeadline!.copyWith(
        color: ColorStyles.white,
      ),
    );
  }
}
