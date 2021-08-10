import 'package:flutter/material.dart';
import 'package:neostore/base/baseClass.dart';
import 'package:neostore/presentation/homeScreen/home_screen.dart';
import 'package:neostore/utils/constant_strings.dart';
import 'package:neostore/utils/neoStore_constant_validation.dart';
import 'package:neostore/utils/neostore_common_widgets/neostore_elevated_button.dart';
import 'package:neostore/utils/neostore_common_widgets/neostore_textformfield.dart';
import 'package:neostore/utils/neostore_common_widgets/neostore_title.dart';
import 'package:neostore/utils/style.dart';

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
  TextEditingController newPasswordController = new TextEditingController();
  TextEditingController confirmPasswordController = new TextEditingController();
  TextEditingController currentPasswordController = new TextEditingController();

  ///string password = confirm password
  String? validateConfirmPassword(String? value) {
    if (value!.isEmpty) {
      return "Please enter re-password";
    }
    if (newPasswordController != confirmPasswordController) {
      return "Password do not match";
    }
  }

  @override
  AppBar? getAppBar() {
    return AppBar(title: Text('ssss'),);
    //   NeoStoreAppBar(
    //   backgroundColour: ColorStyles.purple,
    //   leading: Icon(
    //     Icons.arrow_back_ios,
    //     color: ColorStyles.white,
    //     size: 20,
    //   ),
    //   text: ConstantStrings.resetPassword,
    //   style: TextStyles.titleHeadline!.copyWith(
    //     color: ColorStyles.white,
    //   ),
    //   suffixIcon: Icon(
    //     Icons.add,
    //     color: ColorStyles.purple,
    //   ),
    // );
  }

  @override
  Widget getBody() {
    return Container(
      width: double.infinity,
      height: double.infinity,
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
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ),
            );
          }
        },
        text: ConstantStrings.resetPassword,
        textStyle: TextStyles.titleHeadline!
            .copyWith(fontWeight: FontWeight.bold, color: ColorStyles.red),
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
        textStyle: TextStyles.titleHeadline!.copyWith(
          color: ColorStyles.white,
        ),
        hintText: ConstantStrings.confirmPassword,
        hintStyle: TextStyles.titleHeadline!.copyWith(
          color: ColorStyles.white,
        ),
        prefixIcon: Image.asset('assets/images/password_icon.png'),
        obscureText: true,
        controller: confirmPasswordController,
        validation: validateConfirmPassword,
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
        textStyle: TextStyles.titleHeadline!.copyWith(
          color: ColorStyles.white,
        ),
        hintStyle: TextStyles.titleHeadline!.copyWith(
          color: ColorStyles.white,
        ),
        prefixIcon: Image.asset('assets/images/password_icon.png'),
        obscureText: true,
        controller: newPasswordController,
        validation: validatePassword,
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
        textStyle: TextStyles.titleHeadline!.copyWith(
          color: ColorStyles.white,
        ),
        hintStyle: TextStyles.titleHeadline!.copyWith(
          color: ColorStyles.white,
        ),
        prefixIcon: Image.asset('assets/images/password_icon.png'),
        obscureText: true,
        controller: currentPasswordController,
        validation: validatePassword,
      ),
    );
  }

  ///widget title
  Widget _title() {
    return NeoStoreTitle(
      // text: ConstantStrings.welCome,
      text: ConstantStrings.neoStore,
      style: TextStyles.largeHeadline!.copyWith(
        color: ColorStyles.white,
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
