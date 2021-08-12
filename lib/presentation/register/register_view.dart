import 'package:flutter/material.dart';
import 'package:neostore/base/base_class.dart';
import 'package:neostore/data/model/register_request.dart';
import 'package:neostore/data/widget/radio_button.dart';
import 'package:neostore/presentation/register/register_viewmodel.dart';
import 'package:neostore/utils/constant_strings.dart';
import 'package:neostore/utils/neoStore_constant_validation.dart';
import 'package:neostore/data/widget/neostore_appbar.dart';
import 'package:neostore/data/widget/neostore_elevated_button.dart';
import 'package:neostore/data/widget/neostore_textformfield.dart';
import 'package:neostore/data/widget/neostore_title.dart';
import 'package:neostore/utils/style.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends BaseClass {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  BaseClassState getState() {
    return _RegisterScreenState();
  }
}

enum GenderTypes { Male, Female }

class _RegisterScreenState extends BaseClassState
    with NeoStoreConstantValidation {
  late RegisterScreenProvider _registerScreenProvider;
  late ChangeGender _changeColorModel;

  final _formKey = GlobalKey<FormState>();

  TextEditingController _firstNameController = new TextEditingController();
  TextEditingController _lastNameController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _phoneController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  // TextEditingController _genderController = new TextEditingController();
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
    _registerScreenProvider = Provider.of<RegisterScreenProvider>(context);
    _changeColorModel = Provider.of<ChangeGender>(context);
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

  Widget _gender() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 10,
          ),
          child: NeoStoreTitle(
            text: 'Gender',
            style: TextStyles.titleHeadline!.copyWith(
              color: ColorStyles.white,
            ),
          ),
        ),
        Flexible(
          child: RadioListTile<GenderTypes>(
              value: GenderTypes.Male,
              title: Text('Male'),
              groupValue: _changeColorModel.currentValue,
              onChanged: (value) {
                _changeColorModel.changeModel(value!);
              }),
        ),
        Flexible(
          child: RadioListTile<GenderTypes>(
            value: GenderTypes.Female,
            title: Text('Female'),
            groupValue: _changeColorModel.currentValue,
            onChanged: (value) {
              _changeColorModel.changeModel(value!);
            },
          ),
        )
        // Flexible(
        //   child: ListView(
        //     shrinkWrap: true,
        //     padding: EdgeInsets.all(8.0),
        //     children: _buttonOptions
        //         .map(
        //           (timeValue) => RadioListTile(
        //             groupValue: _changeColorModel.currentValue.key,
        //             title: Text(timeValue.label),
        //             value: timeValue.key,
        //             onChanged: (dynamic val) {
        //               _changeColorModel.chageModel(_buttonOptions[val]);
        //             },
        //           ),
        //         )
        //         .toList(),
        //   ),
        // ),
      ],
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
        onPressed: () {
          print("validationvalue=>${_formKey.currentState!.validate()}");
          if (_formKey.currentState!.validate()) {
            print("abc1");
            registerUser(context);
          } else {
            print("abc");
          }
        },
        text: ConstantStrings.register,
        textStyle: TextStyles.titleHeadline!
            .copyWith(fontWeight: FontWeight.bold, color: ColorStyles.red),
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
        controller: _lastNameController,
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

  void registerUser(BuildContext context) {
    RegisterRequest registerRequest = RegisterRequest();
    registerRequest.firstName = _firstNameController.text;
    registerRequest.password = _passwordController.text;
    registerRequest.confirmPassword = _confirmPasswordController.text;
    registerRequest.lastName = _lastNameController.text;
    registerRequest.phone = _phoneController.text;
    registerRequest.email = _emailController.text;
    registerRequest.gender =
        _changeColorModel.currentValue == GenderTypes.Male ? 'Male' : 'Female';

    _registerScreenProvider.getRegisterUser(registerRequest, context);
  }

  void saveMessage(RegisterRequest registerRequest) async {}
}
