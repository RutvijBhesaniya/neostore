import 'package:flutter/material.dart';
import 'package:neostore/base/baseClass.dart';
import 'package:neostore/utils/constant_strings.dart';
import 'package:neostore/utils/neoStore_constant_validation.dart';
import 'package:neostore/utils/neostore_common_widgets/neostore_appbar.dart';
import 'package:neostore/utils/neostore_common_widgets/neostore_elevated_button.dart';
import 'package:neostore/utils/neostore_common_widgets/neostore_textformfield.dart';
import 'package:neostore/utils/neostore_common_widgets/neostore_title.dart';
import 'package:neostore/utils/style.dart';

class RegisterScreen extends BaseClass {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  BaseClassState getState() {
    return _RegisterScreenState();
  }
}

class _RegisterScreenState extends BaseClassState
    with NeoStoreConstantValidation {
  final _formKey = GlobalKey<FormState>();

  TextEditingController firstNameController = new TextEditingController();
  TextEditingController lastNameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController confirmPasswordController = new TextEditingController();

  ///string password = confirm password
  String? validateConfirmPassword(String? value) {
    if (value!.isEmpty) {
      return "Please enter re-password";
    }
    if (passwordController != confirmPasswordController) {
      return "Password do not match";
    }
  }

  @override
  NeoStoreAppBar getAppBar() {
    return NeoStoreAppBar(
      backgroundColour: ColorStyles.purple,
      leading: Icon(
        Icons.arrow_back_ios,
        color: ColorStyles.white,
        size: 20,
      ),
      text: ConstantStrings.register,
      style: TextStyles.titleHeadline!.copyWith(
        color: ColorStyles.white,
      ),
    );
  }

  @override
  Widget getBody() {
    return Form(
      key: _formKey,
      child: Container(
        height: double.infinity,
        decoration: _backgroundImage(),
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

  ///widget terms and condition
  Widget _termsAndCondition() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 20,
          height: 20,
          color: ColorStyles.white,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: RichText(
            text: TextSpan(
              text: ConstantStrings.iAgreeThe,
              style:
                  TextStyles.titleHeadline!.copyWith(color: ColorStyles.white),
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
          onPressed: (){
            // if (_formKey.currentState!.validate()) {
            //   Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => HomeScreen(),
            //     ),
            //   );
            // }
          },
          text: ConstantStrings.register,
          textStyle: TextStyles.titleHeadline!
              .copyWith(fontWeight: FontWeight.bold, color: ColorStyles.red),
          buttonStyle: TextButton.styleFrom(backgroundColor: ColorStyles.white),
        ));
  }

  ///widget phone number
  Widget _phoneNumber() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 20),
      child: NeoStoreTextFormField(
        hintText: ConstantStrings.phoneNumber,
        textStyle: TextStyles.titleHeadline!.copyWith(
          color: ColorStyles.white,
        ),
        errorStyle: TextStyles.titleHeadline!.copyWith(
          color: ColorStyles.white,
        ),
        hintStyle: TextStyles.titleHeadline!.copyWith(
          color: ColorStyles.white,
        ),
        prefixIcon: Icon(
          Icons.phone_android,
          color: ColorStyles.white,
        ),
        validation: validatePhoneNumber,
        controller: phoneController,
      ),
    );
  }

  ///widget confirm password
  Widget _confirmPassword() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: NeoStoreTextFormField(
        hintText: ConstantStrings.confirmPassword,
        textStyle: TextStyles.titleHeadline!.copyWith(
          color: ColorStyles.white,
        ),
        errorStyle: TextStyles.titleHeadline!.copyWith(
          color: ColorStyles.white,
        ),
        hintStyle: TextStyles.titleHeadline!.copyWith(
          color: ColorStyles.white,
        ),
        prefixIcon: Image.asset('assets/images/password_icon.png'),
        obscureText: true,
        controller: confirmPasswordController,
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
        textStyle: TextStyles.titleHeadline!.copyWith(
          color: ColorStyles.white,
        ),
        errorStyle: TextStyles.titleHeadline!.copyWith(
          color: ColorStyles.white,
        ),
        hintStyle: TextStyles.titleHeadline!.copyWith(
          color: ColorStyles.white,
        ),
        prefixIcon: Image.asset('assets/images/password_icon.png'),
        obscureText: true,
        validation: validatePassword,
        controller: passwordController,
      ),
    );
  }

  ///widget email
  Widget _email() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: NeoStoreTextFormField(
        hintText: ConstantStrings.email,
        textStyle: TextStyles.titleHeadline!.copyWith(
          color: ColorStyles.white,
        ),
        errorStyle: TextStyles.titleHeadline!.copyWith(
          color: ColorStyles.white,
        ),
        hintStyle: TextStyles.titleHeadline!.copyWith(
          color: ColorStyles.white,
        ),
        prefixIcon: Icon(
          Icons.email,
          color: ColorStyles.white,
        ),
        validation: validateEmail,
        controller: emailController,
      ),
    );
  }

  ///widget last name
  Widget _lastName() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: NeoStoreTextFormField(
        hintText: ConstantStrings.lastName,
        textStyle: TextStyles.titleHeadline!.copyWith(
          color: ColorStyles.white,
        ),
        errorStyle: TextStyles.titleHeadline!.copyWith(
          color: ColorStyles.white,
        ),
        hintStyle: TextStyles.titleHeadline!.copyWith(
          color: ColorStyles.white,
        ),
        prefixIcon: Image.asset('assets/images/username_icon.png'),
        validation: validateName,
        controller: lastNameController,
      ),
    );
  }

  ///widget first name
  Widget _firstName() {
    return NeoStoreTextFormField(
      hintText: ConstantStrings.firstName,
      textStyle: TextStyles.titleHeadline!.copyWith(
        color: ColorStyles.white,
      ),
      errorStyle: TextStyles.titleHeadline!.copyWith(
        color: ColorStyles.white,
      ),
      hintStyle: TextStyles.titleHeadline!.copyWith(
        color: ColorStyles.white,
      ),
      prefixIcon: Image.asset('assets/images/username_icon.png'),
      validation: validateName,
      controller: firstNameController,
    );
  }

  ///widget title
  Widget _title() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 30, bottom: 20),
        child: NeoStoreTitle(
          text: ConstantStrings.neoStore,
          style: TextStyles.largeHeadline!.copyWith(
            fontWeight: FontWeight.bold,
            color: ColorStyles.white,
          ),
        ),
      ),
    );
  }

  ///widget background
  _backgroundImage() {
    return BoxDecoration(
      image: DecorationImage(
          image: AssetImage('assets/images/background.png'), fit: BoxFit.fill),
    );
  }

  void registerUser(){

  }
}
