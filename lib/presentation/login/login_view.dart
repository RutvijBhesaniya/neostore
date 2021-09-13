import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neostore/base/base_class.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/data/model/request/login_request.dart';
import 'package:neostore/data/model/response/login_response.dart';
import 'package:neostore/presentation/home/home_view.dart';
import 'package:neostore/presentation/login/login_viewmodel.dart';
import 'package:neostore/presentation/register/register_view.dart';
import 'package:neostore/presentation/widget/neostore_elevated_button.dart';
import 'package:neostore/presentation/widget/neostore_textformfield.dart';
import 'package:neostore/presentation/widget/neostore_title.dart';
import 'package:neostore/utils/constant_strings.dart';
import 'package:neostore/utils/neostore_constant_validation.dart';
import 'package:neostore/utils/shared_preferences/memory_management.dart';
import 'package:neostore/utils/style.dart';
import 'package:provider/provider.dart';

class LoginScreenView extends BaseClass {
  const LoginScreenView({Key? key}) : super(key: key);

  @override
  BaseClassState getState() {
    return _LoginScreenViewState();
  }
}

class _LoginScreenViewState extends BaseClassState
    with NeoStoreConstantValidation {
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  final _formKey = GlobalKey<FormState>();
  LoginScreenProvider? _loginScreenProvider;

  // ForgotProvider? _forgotProvider;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loginScreenProvider = LoginScreenProvider(Provider.of(context));
  }

  @override
  Widget getBody() {
    return ChangeNotifierProvider<LoginScreenProvider>(
      create: (context) => _loginScreenProvider!,
      child: Consumer<LoginScreenProvider>(
        builder: (context, model, child) {
          return Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            color: ColorStyles.red,
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
        },
      ),
    );
  }

  ///widget don't have an account
  Widget _dontHaveAccount() {
    return Positioned(
      bottom: 0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RegisterView(),
                ));
          },
          child: NeoStoreTitle(
            text: ConstantStrings.dontHaveAnAccount,
            style: GoogleFonts.workSans(
                textStyle: TextStyles.titleHeadline!.copyWith(
                    color: ColorStyles.white, fontWeight: FontWeight.w400)),
          ),
        ),
      ),
    );
  }

  ///widget forgot password
  Widget _forgotPassword() {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: GestureDetector(
        onTap: () {
          if (_emailController.text.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: NeoStoreTitle(
                  text: ConstantStrings.please_enter_email_address,
                ),
              ),
            );
          } else {
            _loginScreenProvider?.getForgotPassword(_emailController.text);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: NeoStoreTitle(
                    text: ConstantStrings.new_password_sent_successfully),
              ),
            );
          }
        },
        child: NeoStoreTitle(
          text: ConstantStrings.forgotPassword,
          style: GoogleFonts.workSans(
              textStyle: TextStyles.titleHeadline!.copyWith(
                  color: ColorStyles.white, fontWeight: FontWeight.w400)),
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
            loginUser(context);
          }
        },
        text: ConstantStrings.login,
        textStyle: GoogleFonts.workSans(
            textStyle: TextStyles.titleHeadline!
                .copyWith(color: ColorStyles.red, fontWeight: FontWeight.w600)),
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
        textStyle: GoogleFonts.workSans(
            textStyle: TextStyles.titleHeadline!.copyWith(
                color: ColorStyles.white, fontWeight: FontWeight.w400)),
        hintStyle: GoogleFonts.workSans(
            textStyle: TextStyles.titleHeadline!.copyWith(
                color: ColorStyles.white, fontWeight: FontWeight.w400)),
        errorStyle: TextStyles.titleHeadline!.copyWith(
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

  ///widget username title
  Widget _username() {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: NeoStoreTextFormField(
        hintText: ConstantStrings.username,
        hintStyle: GoogleFonts.workSans(
            textStyle: TextStyles.titleHeadline!.copyWith(
                color: ColorStyles.white, fontWeight: FontWeight.w400)),
        textStyle: GoogleFonts.workSans(
            textStyle: TextStyles.titleHeadline!.copyWith(
                color: ColorStyles.white, fontWeight: FontWeight.w400)),
        errorStyle: TextStyles.titleHeadline!.copyWith(
          color: ColorStyles.white,
        ),
        maxLine: 1,
        controller: _emailController,
        validation: validateName,
        prefixIcon: Image.asset('assets/images/username_icon.png'),
      ),
    );
  }

  ///widget neoStore title
  Widget _title() {
    return NeoStoreTitle(
      text: ConstantStrings.neoStore,
      style: GoogleFonts.workSans(
        textStyle: TextStyles.largeHeadline!.copyWith(
          fontWeight: FontWeight.bold,
          color: ColorStyles.white,
        ),
      ),
    );
  }

  void loginUser(BuildContext context) async {
    LoginRequest loginRequest = LoginRequest();
    loginRequest.email = _emailController.text;
    loginRequest.password = _passwordController.text;
    var response = await _loginScreenProvider?.getLogin(loginRequest, context);

    if (response is ApiError) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: NeoStoreTitle(
              text: ConstantStrings.username_or_password_is_wrong),
        ),
      );
    } else {
      LoginResponse loginResponse = LoginResponse.fromJson(
        json.decode(response),
      );
      if (loginResponse.status == 200) {
        MemoryManagement.setEmail(email: _emailController.text);
        MemoryManagement.setAccessToken(
            accessToken: loginResponse.data!.accessToken);
        MemoryManagement.setIsUserLoggedIn(isuserloggedin: true);

        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ),
        );
      }
    }
  }
}
