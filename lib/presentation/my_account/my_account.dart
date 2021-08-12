import 'package:flutter/material.dart';
import 'package:neostore/base/base_class.dart';
import 'package:neostore/utils/constant_strings.dart';
import 'package:neostore/data/widget/neostore_appbar.dart';
import 'package:neostore/data/widget/neostore_elevated_button.dart';
import 'package:neostore/data/widget/neostore_textformfield.dart';
import 'package:neostore/utils/style.dart';

class MyAccount extends BaseClass {
  @override
  BaseClassState getState() {
    return MyAccountState();
  }
}

class MyAccountState extends BaseClassState {
  @override
  getAppBar() {
    return _appBar();
  }

  @override
  Widget getBody() {
    return Container(
      ///widget background image
      decoration: _backgroundImage(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    bottom: 20,
                  ),
                  child: CircleAvatar(
                    backgroundColor: ColorStyles.blue,
                    radius: 100,
                  ),
                ),
              ),

              ///widget first name
              _firstName(),

              ///widget last name
              _lastName(),

              ///widget email
              _email(),

              ///widget phone number
              _phoneNumber(),

              ///widget date of birth
              _dateOfBirth(),

              ///widget edit profile button
              _editProfileButton(context),
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
      text: ConstantStrings.myAccount,
      style: TextStyles.titleHeadline!.copyWith(
        color: ColorStyles.white,
      ),
    );
  }

  ///widget edit profile button
  Widget _editProfileButton(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(top: 20, bottom: 30),
        child: NeoStoreElevatedButton(
          text: ConstantStrings.editProfile,
          textStyle: TextStyles.titleHeadline!
              .copyWith(fontWeight: FontWeight.bold, color: ColorStyles.red),
          buttonStyle: TextButton.styleFrom(backgroundColor: ColorStyles.white),
        ));
  }

  ///widget date of birth
  Widget _dateOfBirth() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: NeoStoreTextFormField(
        hintText: '01-11-1998',
        hintStyle: TextStyles.titleHeadline!.copyWith(
          color: ColorStyles.white,
        ),
        prefixIcon: Icon(
          Icons.date_range,
          color: ColorStyles.white,
        ),
      ),
    );
  }

  ///widget phoneNumber
  Widget _phoneNumber() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: NeoStoreTextFormField(
        hintText: 'Phone Number',
        hintStyle: TextStyles.titleHeadline!.copyWith(
          color: ColorStyles.white,
        ),
        prefixIcon: Icon(
          Icons.phone_android,
          color: ColorStyles.white,
        ),
      ),
    );
  }

  ///widget email
  Widget _email() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: NeoStoreTextFormField(
        hintText: ConstantStrings.email,
        hintStyle: TextStyles.titleHeadline!.copyWith(
          color: ColorStyles.white,
        ),
        prefixIcon: Icon(
          Icons.email,
          color: ColorStyles.white,
        ),
      ),
    );
  }

  ///widget lastname
  Widget _lastName() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: NeoStoreTextFormField(
        hintText: 'Shinde',
        hintStyle: TextStyles.titleHeadline!.copyWith(
          color: ColorStyles.white,
        ),
        prefixIcon: Image.asset('assets/images/username_icon.png'),
      ),
    );
  }

  ///widget first name
  Widget _firstName() {
    return NeoStoreTextFormField(
      hintText: 'Sagar',
      hintStyle: TextStyles.titleHeadline!.copyWith(
        color: ColorStyles.white,
      ),
      prefixIcon: Image.asset('assets/images/username_icon.png'),
    );
  }

  ///widget background image
  BoxDecoration _backgroundImage() {
    return BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/images/background.png'),
        fit: BoxFit.fill,
      ),
    );
  }
}
