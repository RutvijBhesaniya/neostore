import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neostore/base/base_class.dart';
import 'package:neostore/presentation/edit_profile/edit_profile_view.dart';
import 'package:neostore/presentation/home/home_view.dart';
import 'package:neostore/presentation/profile_details/profile_details_viewmodel.dart';
import 'package:neostore/presentation/reset_password/reset_password_view.dart';
import 'package:neostore/presentation/widget/neostore_appbar.dart';
import 'package:neostore/presentation/widget/neostore_elevated_button.dart';
import 'package:neostore/presentation/widget/neostore_title_border_with_icons.dart';
import 'package:neostore/utils/constant_strings.dart';
import 'package:neostore/utils/style.dart';
import 'package:provider/provider.dart';

class ProfileDetailsView extends BaseClass {
  @override
  BaseClassState getState() {
    return ProfileDetailsViewState();
  }
}

class ProfileDetailsViewState extends BaseClassState {
  ProfileDetailsProvider? _profileDetailsProvider;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _profileDetailsProvider = ProfileDetailsProvider(Provider.of(context));
  }

  @override
  getAppBar() {
    return _appBar();
  }

  @override
  Widget getBody() {
    return ChangeNotifierProvider<ProfileDetailsProvider>(
      create: (context) => _profileDetailsProvider!,
      child: Consumer<ProfileDetailsProvider>(
        builder: (context, model, child) {
          return _profileDetailsProvider?.isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Scaffold(
                  body: Container(
                    color: ColorStyles.red,

                    ///widget background image

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
                                child: getImage(_profileDetailsProvider
                                    ?.myAccountEntity
                                    ?.dataEntity
                                    ?.userDataEntity
                                    ?.profilePic),
                              ),
                            ),

                            ///widget first name
                            _firstName(
                                _profileDetailsProvider?.myAccountEntity),

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
                          builder: (context) => ResetPasswordView(),
                        ),
                      );
                    },
                    text: ConstantStrings.resetPassword,
                    textStyle: TextStyles.titleHeadline?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: ColorStyles.dark_grey),
                    buttonStyle: TextButton.styleFrom(
                        backgroundColor: ColorStyles.white),
                  ),
                );
        },
      ),
    );
  }

  ///widget app bar
  Widget _appBar() {
    return NeoStoreAppBar(
      elevation: 0.0,
      backgroundColour: ColorStyles.red,
      leading: InkWell(
        onTap: () {
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
      width: MediaQuery.of(context).size.width,
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
            color: ColorStyles.white,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }

  ///widget phoneNumber
  Widget _phoneNumber() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: NeoStoreTitleBorderWithIcons(
        icon: Icons.phone_android,
        text:
            _profileDetailsProvider?.myAccountEntity?.dataEntity?.userDataEntity?.phoneNo,
        style: GoogleFonts.workSans(
          textStyle: TextStyles.titleHeadline?.copyWith(
            color: ColorStyles.white,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }

  ///widget email
  Widget _email() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: NeoStoreTitleBorderWithIcons(
        icon: Icons.attach_email,
        text: _profileDetailsProvider?.myAccountEntity?.dataEntity?.userDataEntity?.email,
        style: GoogleFonts.workSans(
          textStyle: TextStyles.titleHeadline?.copyWith(
            color: ColorStyles.white,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }

  ///widget lastname
  Widget _lastName() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: NeoStoreTitleBorderWithIcons(
        image: 'assets/images/username_icon.png',
        text: _profileDetailsProvider
            ?.myAccountEntity?.dataEntity?.userDataEntity?.lastName,
        style: GoogleFonts.workSans(
          textStyle: TextStyles.titleHeadline?.copyWith(
            color: ColorStyles.white,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }

  ///widget first name
  Widget _firstName(myAccountResponse) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: NeoStoreTitleBorderWithIcons(
        image: 'assets/images/username_icon.png',
        text: _profileDetailsProvider
            ?.myAccountEntity?.dataEntity?.userDataEntity?.firstName,
        style: GoogleFonts.workSans(
          textStyle: TextStyles.titleHeadline?.copyWith(
            color: ColorStyles.white,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }

  ///table category data method
  void fetchTableCategoryData() {
    ///my account detail method
    _profileDetailsProvider?.getMyAccount();
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      fetchTableCategoryData();
    });
  }

  ///get image widget
  Widget getImage(profilePic) {
    if (profilePic.toString().isEmpty) {
      return CircleAvatar(
        child: Image.network(profilePic),
        radius: 70,
      );
    } else {
      return CircleAvatar(
        backgroundImage: NetworkImage(
            "https://images.unsplash.com/photo-1506744038136-46273834b3fb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjM3Njd9&auto=format&fit=crop&w=750&q=80"),
        radius: 70,
      );
    }
  }
}
