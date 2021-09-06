import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neostore/base/base_class.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/data/model/request/register_request.dart';
import 'package:neostore/data/model/response/register_response.dart';
import 'package:neostore/data/widget/radio_button.dart';
import 'package:neostore/presentation/login/login_view.dart';
import 'package:neostore/presentation/register/register_viewmodel.dart';
import 'package:neostore/utils/constant_strings.dart';
import 'package:neostore/utils/neoStore_constant_validation.dart';
import 'package:neostore/data/widget/neostore_appbar.dart';
import 'package:neostore/data/widget/neostore_elevated_button.dart';
import 'package:neostore/data/widget/neostore_textformfield.dart';
import 'package:neostore/data/widget/neostore_title.dart';
import 'package:neostore/utils/style.dart';
import 'package:provider/provider.dart';

class RegisterView extends BaseClass {
  const RegisterView({Key? key}) : super(key: key);

  @override
  BaseClassState getState() {
    return _RegisterViewState();
  }
}

enum GenderTypes { Male, Female }

class _RegisterViewState extends BaseClassState
    with NeoStoreConstantValidation {
  late RegisterViewProvider _registerScreenProvider;
  late ChangeGender _changeColorModel;

  final _formKey = GlobalKey<FormState>();

  TextEditingController _firstNameController = new TextEditingController();
  TextEditingController _lastNameController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _phoneController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _confirmPasswordController =
      new TextEditingController();

  ///string password = confirm password
  String? validateConfirmPassword(String? value) {
    if (value!.isEmpty) {
      return "Please enter re-password";
    } else if (_passwordController.value != _confirmPasswordController.value) {
      return "Password do not match";
    }
  }

  @override
  NeoStoreAppBar getAppBar() {
    return _appBar();
  }

  NeoStoreAppBar _appBar() {
    return NeoStoreAppBar(
      elevation: 0.0,
      backgroundColour: ColorStyles.red,
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Icon(
          Icons.arrow_back_ios,
          color: ColorStyles.white,
          size: 20,
        ),
      ),
      text: ConstantStrings.register,
      style: TextStyles.titleHeadline!.copyWith(
        color: ColorStyles.white,
      ),
    );
  }

  @override
  Widget getBody() {
    _registerScreenProvider = Provider.of<RegisterViewProvider>(context);
    _changeColorModel = Provider.of<ChangeGender>(context);
    return _registerForm();
  }

  Widget _registerForm() {
    return Form(
      key: _formKey,
      child: Container(
        height: double.infinity,
        color: ColorStyles.red,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ///widget title
                _title(),

                ///widget first name
                _firstName(),

                ///widget last name
                _lastName(),

                ///widget email
                _email(),

                ///widget password
                _password(),

                ///widget confirm password
                _confirmPassword(),

                ///gender widget
                _gender(),

                ///widget phone number
                _phoneNumber(),

                ///widget terms and condition
                _termsAndCondition(),

                ///widget register button
                _registerButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ///gender widget
  Widget _gender() {
    return Row(
      children: [
        ///gender title widget
        _genderTitle(),

        ///male radio button
        _maleRadioButton(),

        ///female radio button
        _femaleRadioButton()
      ],
    );
  }

  ///gender title widget
  Widget _genderTitle() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        width: MediaQuery.of(context).size.width / 5.8,
        child: NeoStoreTitle(
          text: 'Gender',
          style: GoogleFonts.workSans(
              textStyle: TextStyles.titleHeadline!.copyWith(
            color: ColorStyles.white,
            fontWeight: FontWeight.w400,
          )),
        ),
      ),
    );
  }

  ///female radio button
  Widget _femaleRadioButton() {
    return Container(
      width: MediaQuery.of(context).size.width / 2.8,
      child:
      RadioListTile<GenderTypes>(
        dense: true,
        contentPadding: EdgeInsets.all(0.0),
        activeColor: ColorStyles.white,
        value: GenderTypes.Female,
        title: Text(
          'Female',
          style: GoogleFonts.workSans(
            textStyle: TextStyles.titleHeadline!.copyWith(
                color: ColorStyles.white, fontWeight: FontWeight.w400),
          ),
          maxLines: 1,
        ),
        groupValue: _changeColorModel.currentValue,
        onChanged: (value) {
          _changeColorModel.changeModel(value!);
        },
      ),
    );
  }

  ///male radio button
  Widget _maleRadioButton() {
    return Container(
      width: MediaQuery.of(context).size.width / 2.8,
      child: RadioListTile<GenderTypes>(
        dense: true,
        contentPadding: EdgeInsets.all(0.0),
        activeColor: ColorStyles.white,
        value: GenderTypes.Male,
        title: Text(
          'Male',
          style: GoogleFonts.workSans(
            textStyle: TextStyles.titleHeadline!.copyWith(
                color: ColorStyles.white, fontWeight: FontWeight.w400),
          ),
        ),
        groupValue: _changeColorModel.currentValue,
        onChanged: (value) {
          _changeColorModel.changeModel(value!);
        },
      ),
    );
  }

  ///widget terms and condition
  Widget _termsAndCondition() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 10,
          height: 10,
          child: Checkbox(
            activeColor: ColorStyles.white,
            value: _registerScreenProvider.checkValue,
            onChanged: (val) {
              _registerScreenProvider.changeCheckValue(val!);
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: RichText(
            text: TextSpan(
              text: ConstantStrings.iAgreeThe,
              style: GoogleFonts.workSans(
                  textStyle: TextStyles.titleHeadline!.copyWith(
                      color: ColorStyles.white, fontWeight: FontWeight.w400)),
              children: const <TextSpan>[
                TextSpan(
                  text: ConstantStrings.termsCondition,
                  style: TextStyle(
                    color: ColorStyles.white,
                    decoration: TextDecoration.underline,
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  ///widget register button
  Widget _registerButton(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: 20, bottom: 10),
      child: NeoStoreElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            if (_registerScreenProvider.checkValue) {
              registerUser(context);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: NeoStoreTitle(text: ConstantStrings.please_accept_terms_and_conditions,),
                ),
              );
            }
          } else {}
        },
        text: ConstantStrings.register,
        textStyle: GoogleFonts.workSans(
          textStyle: TextStyles.buttonText.copyWith(
            fontWeight: FontWeight.bold,
            color: ColorStyles.red,
          ),
        ),
        buttonStyle: TextButton.styleFrom(backgroundColor: ColorStyles.white),
      ),
    );
  }

  ///widget phone number
  Widget _phoneNumber() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 20),
      child: NeoStoreTextFormField(
        hintText: ConstantStrings.phoneNumber,
        textStyle: GoogleFonts.workSans(
            textStyle: TextStyles.titleHeadline!.copyWith(
                color: ColorStyles.white, fontWeight: FontWeight.w400)),
        errorStyle: TextStyles.titleHeadline!.copyWith(
          color: ColorStyles.white,
        ),
        hintStyle: GoogleFonts.workSans(
            textStyle: TextStyles.titleHeadline!.copyWith(
                color: ColorStyles.white, fontWeight: FontWeight.w400)),
        prefixIcon: Icon(
          Icons.phone_android,
          color: ColorStyles.white,
        ),
        validation: validatePhoneNumber,
        controller: _phoneController,
      ),
    );
  }

  ///widget confirm password
  Widget _confirmPassword() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: NeoStoreTextFormField(
        hintText: ConstantStrings.confirmPassword,
        textStyle: GoogleFonts.workSans(
            textStyle: TextStyles.titleHeadline!.copyWith(
                color: ColorStyles.white, fontWeight: FontWeight.w400)),
        errorStyle: TextStyles.titleHeadline!.copyWith(
          color: ColorStyles.white,
        ),
        hintStyle: GoogleFonts.workSans(
            textStyle: TextStyles.titleHeadline!.copyWith(
                color: ColorStyles.white, fontWeight: FontWeight.w400)),
        prefixIcon: Image.asset('assets/images/password_icon.png'),
        obscureText: true,
        maxLine: 1,
        controller: _confirmPasswordController,
        validation: validateConfirmPassword,
        // validation: validatePassword,
      ),
    );
  }

  ///widget password
  Widget _password() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: NeoStoreTextFormField(
        hintText: ConstantStrings.password,
        textStyle: GoogleFonts.workSans(
            textStyle: TextStyles.titleHeadline!.copyWith(
                color: ColorStyles.white, fontWeight: FontWeight.w400)),
        errorStyle: TextStyles.titleHeadline!.copyWith(
          color: ColorStyles.white,
        ),
        hintStyle: GoogleFonts.workSans(
            textStyle: TextStyles.titleHeadline!.copyWith(
                color: ColorStyles.white, fontWeight: FontWeight.w400)),
        prefixIcon: Image.asset('assets/images/password_icon.png'),
        obscureText: true,
        maxLine: 1,
        validation: validatePassword,
        controller: _passwordController,
      ),
    );
  }

  ///widget email
  Widget _email() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: NeoStoreTextFormField(
        hintText: ConstantStrings.email,
        textStyle: GoogleFonts.workSans(
            textStyle: TextStyles.titleHeadline!.copyWith(
                color: ColorStyles.white, fontWeight: FontWeight.w400)),
        errorStyle: TextStyles.titleHeadline!.copyWith(
          color: ColorStyles.white,
        ),
        hintStyle: GoogleFonts.workSans(
            textStyle: TextStyles.titleHeadline!.copyWith(
                color: ColorStyles.white, fontWeight: FontWeight.w400)),
        prefixIcon: Icon(
          Icons.email,
          color: ColorStyles.white,
        ),
        validation: validateEmail,
        controller: _emailController,
      ),
    );
  }

  ///widget last name
  Widget _lastName() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: NeoStoreTextFormField(
        hintText: ConstantStrings.lastName,
        textStyle: GoogleFonts.workSans(
            textStyle: TextStyles.titleHeadline!.copyWith(
                color: ColorStyles.white, fontWeight: FontWeight.w400)),
        errorStyle: TextStyles.titleHeadline!.copyWith(
          color: ColorStyles.white,
        ),
        hintStyle: GoogleFonts.workSans(
            textStyle: TextStyles.titleHeadline!.copyWith(
                color: ColorStyles.white, fontWeight: FontWeight.w400)),
        prefixIcon: Image.asset('assets/images/username_icon.png'),
        validation: validateName,
        controller: _lastNameController,
      ),
    );
  }

  ///widget first name
  Widget _firstName() {
    return NeoStoreTextFormField(
      hintText: ConstantStrings.firstName,
      textStyle: GoogleFonts.workSans(
          textStyle: TextStyles.titleHeadline!
              .copyWith(color: ColorStyles.white, fontWeight: FontWeight.w400)),
      errorStyle: TextStyles.titleHeadline!.copyWith(
        color: ColorStyles.white,
      ),
      hintStyle: GoogleFonts.workSans(
          textStyle: TextStyles.titleHeadline!
              .copyWith(color: ColorStyles.white, fontWeight: FontWeight.w400)),
      prefixIcon: Image.asset('assets/images/username_icon.png'),
      validation: validateName,
      controller: _firstNameController,
    );
  }

  ///widget title
  Widget _title() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 30, bottom: 20),
        child: NeoStoreTitle(
          text: ConstantStrings.neoStore,
          style: GoogleFonts.workSans(
              textStyle: TextStyles.largeHeadline!.copyWith(
            fontWeight: FontWeight.bold,
            color: ColorStyles.white,
          )),
        ),
      ),
    );
  }

  void registerUser(BuildContext context) async {
    RegisterRequest registerRequest = RegisterRequest();
    registerRequest.firstName = _firstNameController.text;
    registerRequest.password = _passwordController.text;
    registerRequest.confirmPassword = _confirmPasswordController.text;
    registerRequest.lastName = _lastNameController.text;
    registerRequest.phone = _phoneController.text;
    registerRequest.email = _emailController.text;
    registerRequest.gender =
        _changeColorModel.currentValue == GenderTypes.Male ? 'Male' : 'Female';

    var response =
        await _registerScreenProvider.getRegisterUser(registerRequest, context);

    if (response is ApiError) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: NeoStoreTitle(text: ConstantStrings.email_id_already_exist,),
        ),
      );
    } else {
      RegisterResponse registerResponse =
          RegisterResponse.fromJson(json.decode(response));

      if (registerResponse.status == 200) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreenView(),
          ),
        );
      } else {
      }
    }
  }
}
