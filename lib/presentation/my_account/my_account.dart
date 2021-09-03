import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neostore/base/base_class.dart';
import 'package:neostore/data/widget/neostore_title_border_with_icons.dart';
import 'package:neostore/presentation/edit_profile/edit_profile_view.dart';
import 'package:neostore/presentation/home/home_view.dart';
import 'package:neostore/presentation/my_account/my_account_viewmodel.dart';
import 'package:neostore/presentation/reset_password/reset_password_view.dart';
import 'package:neostore/utils/constant_strings.dart';
import 'package:neostore/data/widget/neostore_appbar.dart';
import 'package:neostore/data/widget/neostore_elevated_button.dart';
import 'package:neostore/utils/style.dart';
import 'package:provider/provider.dart';

class MyAccount extends BaseClass {
  @override
  BaseClassState getState() {
    return MyAccountState();
  }
}

class MyAccountState extends BaseClassState {
  late MyAccountProvider _myAccountProvider =
  Provider.of<MyAccountProvider>(context);

  @override
  getAppBar() {
    return _appBar();
  }

  @override
  Widget getBody() {
    return _myAccountProvider.isLoading
        ? Center(
      child: CircularProgressIndicator(),
    )
        : Scaffold(
      body: Container(

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
                _firstName(_myAccountProvider.myAccountResponse),

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
      bottomNavigationBar: NeoStoreElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ResetPassword(),
            ),
          );
        },
        text: 'RESET PASSWORD',
        textStyle: TextStyles.titleHeadline?.copyWith(
            fontWeight: FontWeight.bold, color: ColorStyles.dark_grey),
        buttonStyle:
        TextButton.styleFrom(backgroundColor: ColorStyles.white),
      ),
    );
  }

  ///widget app bar
  NeoStoreAppBar _appBar() {
    return NeoStoreAppBar(
      backgroundColour: ColorStyles.red,
      leading: InkWell(
        onTap: () {
          // Navigator.pop(context);

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ),
          );
        },
        child: Icon(
          Icons.arrow_back_ios,
          color: ColorStyles.white,
          size: 20,
        ),
      ),
      text: ConstantStrings.myAccount,
      style: TextStyles.titleHeadline?.copyWith(
        color: ColorStyles.white,
      ),
    );
  }

  ///widget edit profile button
  Widget _editProfileButton(BuildContext context) {
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width,
      margin: EdgeInsets.only(top: 20, bottom: 30),
      child: NeoStoreElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditProfileView(),
            ),
          );
        },
        text: ConstantStrings.editProfile,
        textStyle: GoogleFonts.workSans(
            textStyle: TextStyles.titleHeadline?.copyWith(
              fontWeight: FontWeight.bold,
              color: ColorStyles.red,
            )),
        buttonStyle: TextButton.styleFrom(
          backgroundColor: ColorStyles.white,
        ),
      ),
    );
  }

  ///widget date of birth
  Widget _dateOfBirth() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: NeoStoreTitleBorderWithIcons(
        icon: Icons.date_range,
        text: '01-11-2012',
        style: GoogleFonts.workSans(
            textStyle: TextStyles.titleHeadline?.copyWith(
                color: ColorStyles.white, fontWeight: FontWeight.w400)),
      ),
    );
  }

  ///widget phoneNumber
  Widget _phoneNumber() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: NeoStoreTitleBorderWithIcons(
        icon: Icons.phone_android,
        text: _myAccountProvider.myAccountResponse?.data?.userData?.phoneNo,
        style: GoogleFonts.workSans(
            textStyle: TextStyles.titleHeadline?.copyWith(
                color: ColorStyles.white, fontWeight: FontWeight.w400)),
      ),
    );
  }

  ///widget email
  Widget _email() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: NeoStoreTitleBorderWithIcons(
        icon: Icons.attach_email,
        text: _myAccountProvider.myAccountResponse?.data?.userData?.email,
        style: GoogleFonts.workSans(
            textStyle: TextStyles.titleHeadline?.
            copyWith(color: ColorStyles.white, fontWeight: FontWeight.w400),
      ),
    ),);
  }

  ///widget lastname
  Widget _lastName() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: NeoStoreTitleBorderWithIcons(
        image: 'assets/images/username_icon.png',
        text: _myAccountProvider.myAccountResponse?.data?.userData?.lastName,
        style: GoogleFonts.workSans(
            textStyle: TextStyles.titleHeadline?.copyWith(
                color: ColorStyles.white, fontWeight: FontWeight.w400)),
      ),
    );
  }

  ///widget first name
  Widget _firstName(myAccountResponse) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: NeoStoreTitleBorderWithIcons(
        image: 'assets/images/username_icon.png',
        text: _myAccountProvider.myAccountResponse?.data?.userData?.firstName,
        style: GoogleFonts.workSans(
            textStyle: TextStyles.titleHeadline?.copyWith(
                color: ColorStyles.white, fontWeight: FontWeight.w400)),
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

  void fetchTableCategoryData() {
    Future.delayed(Duration(milliseconds: 300), () {
      _myAccountProvider.getMyAccount();
    });
  }

  @override
  void initState() {
    fetchTableCategoryData();
    super.initState();
  }
}
