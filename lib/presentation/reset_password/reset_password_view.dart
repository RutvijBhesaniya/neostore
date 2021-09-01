import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neostore/base/base_class.dart';
import 'package:neostore/data/model/response/order_list_response.dart';
import 'package:neostore/data/model/response/reset_password_response.dart';
import 'package:neostore/data/widget/neostore_appbar.dart';
import 'package:neostore/presentation/login/login_view.dart';
import 'package:neostore/presentation/reset_password/reset_password_viewmodel.dart';
import 'package:neostore/utils/constant_strings.dart';
import 'package:neostore/utils/neoStore_constant_validation.dart';
import 'package:neostore/data/widget/neostore_elevated_button.dart';
import 'package:neostore/data/widget/neostore_textformfield.dart';
import 'package:neostore/data/widget/neostore_title.dart';
import 'package:neostore/utils/style.dart';
import 'package:provider/provider.dart';

class ResetPassword extends BaseClass {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  BaseClassState getState() {
    return _ResetPasswordState();
  }
}

class _ResetPasswordState extends BaseClassState
    with NeoStoreConstantValidation {
  final _formKey = GlobalKey<FormState>();
  late ResetPasswordProvider _resetPasswordProvider =
      Provider.of<ResetPasswordProvider>(context, listen: false);
  TextEditingController _newPasswordController = new TextEditingController();
  TextEditingController _confirmPasswordController =
      new TextEditingController();
  TextEditingController _currentPasswordController =
      new TextEditingController();

  ///string password = confirm password
  String? validateConfirmPassword(String? value) {
    if (value!.isEmpty) {
      return "Please enter re-password";
    }
    if (_newPasswordController != _confirmPasswordController) {
      return "Password do not match";
    }
  }

  @override
  NeoStoreAppBar getAppBar() {
    return _appBar();

  }

  NeoStoreAppBar _appBar() {
    return NeoStoreAppBar(
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
      text: ConstantStrings.resetPassword,
      style: TextStyles.titleHeadline!.copyWith(
        color: ColorStyles.white,
      ),
    );
  }


  @override
  Widget getBody() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: _backgroundImage(),
      child: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.fromLTRB(20, 50, 20, 0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ///widget title
                _title(),

                ///widget current password
                _currentPassword(),

                ///widget new password
                _newPassword(),

                ///widget confirm password
                _confirmPassword(),

                ///widget reset password button
                _resetPasswordButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ///widget reset password button
  Widget _resetPasswordButton(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(top: 20, bottom: 30),
      child: NeoStoreElevatedButton(
        onPressed: () async {
          var response = await _resetPasswordProvider.getResetPassword(
              _currentPasswordController.text,
              _newPasswordController.text,
              _confirmPasswordController.text);

          ResetPasswordResponse _resetPasswordResponse =
              ResetPasswordResponse.fromJson(jsonDecode(response));


          print("resetpasswordresponse=>${response}");
          if (_resetPasswordResponse.status == 200) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LoginScreen(),
              ),
            );
          }
        },
        text: ConstantStrings.resetPassword.toUpperCase(),
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

  ///widget confirm password
  Widget _confirmPassword() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: NeoStoreTextFormField(
        errorStyle: TextStyles.titleHeadline!.copyWith(
          color: ColorStyles.white,
        ),
        textStyle: GoogleFonts.workSans(textStyle: TextStyles.titleHeadline!.copyWith(
          color: ColorStyles.white,fontWeight: FontWeight.w400
        ),),
        hintText: ConstantStrings.confirmPassword,
        hintStyle: GoogleFonts.workSans(textStyle: TextStyles.titleHeadline!.copyWith(
          color: ColorStyles.white,fontWeight: FontWeight.w400
        )),
        prefixIcon: Image.asset('assets/images/password_icon.png'),
        obscureText: true,
        maxLine: 1,
        controller: _confirmPasswordController,
        // validation: validateConfirmPassword,
      ),
    );
  }

  ///widget new password
  Widget _newPassword() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: NeoStoreTextFormField(
        hintText: ConstantStrings.newPassword,
        errorStyle: TextStyles.titleHeadline!.copyWith(
          color: ColorStyles.white,
        ),
        textStyle: GoogleFonts.workSans(textStyle: TextStyles.titleHeadline!.copyWith(
          color: ColorStyles.white,fontWeight: FontWeight.w400
        )),
        hintStyle: GoogleFonts.workSans(textStyle: TextStyles.titleHeadline!.copyWith(
          color: ColorStyles.white,fontWeight: FontWeight.w400
        )),
        prefixIcon: Image.asset('assets/images/password_icon.png'),
        obscureText: true,
        maxLine: 1,
        controller: _newPasswordController,
        // validation: validatePassword,
      ),
    );
  }

  ///widget current password
  Widget _currentPassword() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: NeoStoreTextFormField(
        hintText: ConstantStrings.currentPassword,
        errorStyle: TextStyles.titleHeadline!.copyWith(
          color: ColorStyles.white,
        ),
        textStyle: GoogleFonts.workSans(textStyle: TextStyles.titleHeadline!.copyWith(
          color: ColorStyles.white,fontWeight: FontWeight.w400
        )),
        hintStyle: GoogleFonts.workSans(textStyle: TextStyles.titleHeadline!.copyWith(
          color: ColorStyles.white,fontWeight: FontWeight.w400
        )),
        prefixIcon: Image.asset('assets/images/password_icon.png'),
        obscureText: true,
        maxLine: 1,
        controller: _currentPasswordController,
        // validation: validatePassword,
      ),
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
