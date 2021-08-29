import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:neostore/base/base_class.dart';
import 'package:neostore/data/model/request/edit_profile_request.dart';
import 'package:neostore/data/model/response/edit_profile_response.dart';
import 'package:neostore/data/widget/neostore_appbar.dart';
import 'package:neostore/data/widget/neostore_elevated_button.dart';
import 'package:neostore/data/widget/neostore_textformfield.dart';
import 'package:neostore/presentation/edit_profile/edit_profile_viewmodel.dart';
import 'package:neostore/presentation/my_account/my_account.dart';
import 'package:neostore/utils/constant_strings.dart';
import 'package:neostore/utils/neoStore_constant_validation.dart';
import 'package:neostore/utils/shared_preferences/memory_management.dart';
import 'package:neostore/utils/style.dart';
import 'package:provider/provider.dart';

class EditProfileView extends BaseClass {
  @override
  BaseClassState getState() {
    return EditProfileViewState();
  }
}

class EditProfileViewState extends BaseClassState
    with NeoStoreConstantValidation {
  late EditProfileProvider _editProfileProvider =
      Provider.of<EditProfileProvider>(context,listen: false);

  TextEditingController _emailController = new TextEditingController();
  TextEditingController _firstController = new TextEditingController();
  TextEditingController _lastController = new TextEditingController();
  TextEditingController _phoneNumberController = new TextEditingController();

  // TextEditingController _dobController = new TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  getAppBar() {
    return _appBar();
  }

  ///appbar widget
  NeoStoreAppBar _appBar() {
    return NeoStoreAppBar(
      backgroundColour: ColorStyles.purple,
      leading: Icon(
        Icons.arrow_back_ios,
        color: ColorStyles.white,
        size: 20,
      ),
      text: ConstantStrings.editProfile,
      style: TextStyles.titleHeadline!.copyWith(
        color: ColorStyles.white,
      ),
    );
  }

  @override
  Widget getBody() {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
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
        ),
      ),
    );
  }

  ///widget edit profile button
  Widget _editProfileButton(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: 20, bottom: 30),
      child: NeoStoreElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            editProfileUser(context);
          }
        },
        text: ConstantStrings.submit,
        textStyle: TextStyles.titleHeadline!
            .copyWith(fontWeight: FontWeight.bold, color: ColorStyles.red),
        buttonStyle: TextButton.styleFrom(backgroundColor: ColorStyles.white),
      ),
    );
  }

  ///widget date of birth
  Widget _dateOfBirth() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: NeoStoreTextFormField(
        hintText: 'DOB',
        validation: validateName,
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
        validation: validatePhoneNumber,
        controller: _phoneNumberController,
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
        validation: validateEmail,
        controller: _emailController,
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
        hintText: 'Last Name',
        validation: validateName,
        controller: _lastController,
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
      hintText: 'First Name',
      validation: validateName,
      controller: _firstController,
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

  void editProfileUser(BuildContext context) async {
    EditProfileRequest editProfileRequest = EditProfileRequest();
    editProfileRequest.email = _emailController.text;
    editProfileRequest.firstName = _firstController.text;
    editProfileRequest.lastName = _lastController.text;
    editProfileRequest.phoneNo = _phoneNumberController.text;

    var response =
        await _editProfileProvider.getEditProfile(editProfileRequest, context);
    print('zzzzzz=?$response');

    EditProfileResponse editProfileResponse = EditProfileResponse.fromJson(
      json.decode(response),
    );

    if (editProfileResponse.status == 200) {
      MemoryManagement.getEmail();
      MemoryManagement.getFirstName();
      MemoryManagement.getLastName();
      MemoryManagement.getEmail();
      MemoryManagement.getPhoneNumber();
      MemoryManagement.getDob();

      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => MyAccount(),
        ),
      );
    }
  }
}
