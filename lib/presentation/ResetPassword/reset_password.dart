import 'package:flutter/material.dart';
import 'package:neostore/utils/constant_strings.dart';
import 'package:neostore/utils/neostore_common_widgets/neostore_appbar.dart';
import 'package:neostore/utils/neostore_common_widgets/neostore_elevated_button.dart';
import 'package:neostore/utils/neostore_common_widgets/neostore_textformfield.dart';
import 'package:neostore/utils/neostore_common_widgets/neostore_title.dart';
import 'package:neostore/utils/style.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.only(top: 35),
      child: Scaffold(
        appBar: NeoStoreAppBar(
          backgroundColour: ColorStyles.purple,
          leading: Icon(
            Icons.arrow_back_ios,
            color: ColorStyles.white,
            size: 20,
          ),
          text: ConstantStrings.resetPassword,
          style: TextStyles.titleHeadline!.copyWith(
            color: ColorStyles.white,
          ),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: _backgroundImage(),
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.fromLTRB(20, 50, 20, 0),
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
      ),
    );
  }

  ///widget reset password button
  Widget _resetPasswordButton(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(top: 20, bottom: 30),
        child: NeoStoreElevatedButton(
          text: ConstantStrings.resetPassword,
          textStyle: TextStyles.titleHeadline!
              .copyWith(fontWeight: FontWeight.bold, color: ColorStyles.red),
          buttonStyle: TextButton.styleFrom(backgroundColor: ColorStyles.white),
        ),);
  }

  ///widget confirm password
  Widget _confirmPassword() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: NeoStoreTextFormField(
        hintText: ConstantStrings.confirmPassword,
        hintstyle: TextStyles.titleHeadline!.copyWith(
          color: ColorStyles.white,
        ),
        prefixIcon: Image.asset('assets/images/password_icon.png'),
        obscureText: true,
      ),
    );
  }

  ///widget new password
  Widget _newPassword() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: NeoStoreTextFormField(
        hintText: ConstantStrings.newPassword,
        hintstyle: TextStyles.titleHeadline!.copyWith(
          color: ColorStyles.white,
        ),
        prefixIcon: Image.asset('assets/images/password_icon.png'),
        obscureText: true,
      ),
    );
  }

  ///widget current password
  Widget _currentPassword() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: NeoStoreTextFormField(
        hintText: ConstantStrings.currentPassword,
        hintstyle: TextStyles.titleHeadline!.copyWith(
          color: ColorStyles.white,
        ),
        prefixIcon: Image.asset('assets/images/password_icon.png'),
        obscureText: true,
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
