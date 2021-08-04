import 'package:flutter/material.dart';
import 'package:neostore/base/baseclass.dart';
import 'package:neostore/presentation/homeScreen/home_screen.dart';
import 'package:neostore/utils/constant_strings.dart';
import 'package:neostore/utils/neoStore_constant_validation.dart';
import 'package:neostore/utils/neostore_common_widgets/neostore_elevated_button.dart';
import 'package:neostore/utils/neostore_common_widgets/neostore_textformfield.dart';
import 'package:neostore/utils/neostore_common_widgets/neostore_title.dart';
import 'package:neostore/utils/style.dart';

class LoginScreen extends BaseClass {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  BaseClassState getState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends BaseClassState with NeoStoreConstantValidation {
  TextEditingController _usernameController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget getBody() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: _backgroundImage(),
      child: Stack(
        children: [
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ///widget neoStore title
                  _title(),

                  ///widget username
                  _username(),

                  ///widget password
                  _password(),

                  /// widget login
                  _loginButton(context),

                  /// widget forgotPassword
                  _forgotPassword(),
                ],
              ),
            ),
          ),

          ///widget don't have account
          _dontHaveAccount(),
        ],
      ),
    );
  }

  BoxDecoration _backgroundImage() {
    return BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/images/background.png'),
        fit: BoxFit.fill,
      ),
    );
  }

  ///widget don't have an account
  Widget _dontHaveAccount() {
    return Positioned(
      bottom: 0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: NeoStoreTitle(
          // text: ConstantStrings.welCome,
          text: ConstantStrings.dontHaveAnAccount,
          style: TextStyles.titleHeadline!.copyWith(
            color: ColorStyles.white,
          ),
        ),
      ),
    );
  }

  ///widget forgot password
  Widget _forgotPassword() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: NeoStoreTitle(
        // text: ConstantStrings.welCome,
        text: ConstantStrings.forgotPassword,
        style: TextStyles.titleHeadline!.copyWith(
          color: ColorStyles.white,
        ),
      ),
    );
  }

  ///widget login
  Widget _loginButton(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: 30, bottom: 10),
      child: NeoStoreElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => HomeScreen(),
            //   ),
            // );
          }
        },
        text: ConstantStrings.login,
        textStyle: TextStyles.titleHeadline!.copyWith(
          color: ColorStyles.red,
        ),
        buttonStyle: TextButton.styleFrom(
          backgroundColor: ColorStyles.white,
        ),
      ),
    );
  }

  ///widget password
  Widget _password() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: NeoStoreTextFormField(
        hintText: ConstantStrings.password,
        textStyle: TextStyles.titleHeadline!.copyWith(
          color: ColorStyles.white,
        ),
        hintStyle: TextStyles.titleHeadline!.copyWith(
          color: ColorStyles.white,
        ),
        errorStyle: TextStyles.titleHeadline!.copyWith(
          color: ColorStyles.white,
        ),
        prefixIcon: Image.asset('assets/images/password_icon.png'),
        obscureText: true,
        validation: validatePassword,
        controller: _passwordController,
      ),
    );
  }

  ///widget username title
  Widget _username() {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: NeoStoreTextFormField(

        hintText: ConstantStrings.username,
        hintStyle: TextStyles.titleHeadline!.copyWith(
          color: ColorStyles.white,
        ),
        // validation: validateUsername,
        controller: _usernameController,
        validation: validateName,
        prefixIcon: Image.asset('assets/images/username_icon.png'),
      ),
    );
  }

  ///widget neoStore title
  Widget _title() {
    return NeoStoreTitle(
      text: ConstantStrings.neoStore,
      style: TextStyles.largeHeadline!.copyWith(
        fontWeight: FontWeight.bold,
        color: ColorStyles.white,
      ),
    );
  }



}

