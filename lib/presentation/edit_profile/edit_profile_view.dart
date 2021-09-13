import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:neostore/base/base_class.dart';
import 'package:neostore/data/model/response/edit_profile_response.dart';
import 'package:neostore/presentation/edit_profile/edit_profile_viewmodel.dart';
import 'package:neostore/presentation/profile_details/profile_details_view.dart';
import 'package:neostore/presentation/widget/neostore_appbar.dart';
import 'package:neostore/presentation/widget/neostore_elevated_button.dart';
import 'package:neostore/presentation/widget/neostore_textformfield.dart';
import 'package:neostore/presentation/widget/neostore_title.dart';
import 'package:neostore/utils/constant_strings.dart';
import 'package:neostore/utils/neostore_constant_validation.dart';
import 'package:neostore/utils/shared_preferences/memory_management.dart';
import 'package:neostore/utils/style.dart';
import 'package:provider/provider.dart';

class EditProfileView extends BaseClass {
  @override
  BaseClassState getState() {
    return EditProfileViewState();
  }
}

class EditProfileViewState extends BaseClassState
    with NeoStoreConstantValidation {
  late EditProfileProvider _editProfileProvider;

  TextEditingController _emailController = new TextEditingController();
  TextEditingController _firstController = new TextEditingController();
  TextEditingController _lastController = new TextEditingController();
  TextEditingController _phoneNumberController = new TextEditingController();
  TextEditingController _dobController = new TextEditingController();
  final ImagePicker _picker = ImagePicker();

  // PickedFile? _imageFile;

  final _formKey = GlobalKey<FormState>();

  @override
  getAppBar() {
    return _appBar();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _editProfileProvider = EditProfileProvider(Provider.of(context));
  }

  ///appbar widget
  Widget _appBar() {
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
      text: ConstantStrings.editProfile,
      style: TextStyles.titleHeadline?.copyWith(
        color: ColorStyles.white,
      ),
    );
  }

  @override
  Widget getBody() {
    return ChangeNotifierProvider<EditProfileProvider>(
      create: (context) => _editProfileProvider,
      child: Consumer<EditProfileProvider>(
        builder: (context, model, child) {
          return Scaffold(
            body: Form(
              key: _formKey,
              child: Container(
                ///widget background image
                color: ColorStyles.red,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ///image picker widget
                        _imagePicker(),

                        ///widget first name
                        _firstName(),

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
            ),
          );
        },
      ),
    );
  }

  ///image picker widget
  Widget _imagePicker() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          bottom: 20,
        ),
        child: Stack(
          children: [
            CircleAvatar(
              radius: 80,
              child: _editProfileProvider.imageFile == null
                  ? Image.asset("assets/images/profile_pic.jpg")
                  : Image.file(_editProfileProvider.imageFile!),
              // backgroundImage: _editProfileProvider.imageFile == null
              //     ? AssetImage("assets/images/profile_pic.jpg")
              //     : Image.file(_editProfileProvider.imageFile!)),
            ),
            Positioned(
              bottom: 10,
              right: 10,
              child: InkWell(
                onTap: () {
                  showModalBottomSheet(
                      context: context, builder: ((builder) => bottomSheet()));
                },
                child: Icon(Icons.camera_alt_outlined),
              ),
            )
          ],
        ),
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
          if (_formKey.currentState!.validate()) {
            editProfileUser(context);
          }
        },
        text: ConstantStrings.submit,
        textStyle: GoogleFonts.workSans(
            textStyle: TextStyles.titleHeadline?.copyWith(
          fontWeight: FontWeight.w600,
          color: ColorStyles.red,
        )),
        buttonStyle: TextButton.styleFrom(backgroundColor: ColorStyles.white),
      ),
    );
  }

  ///widget date of birth
  Widget _dateOfBirth() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: NeoStoreTextFormField(
        hintText: ConstantStrings.dob,
        validation: validateName,
        controller: _dobController,
        errorStyle: TextStyles.titleHeadline!.copyWith(
          color: ColorStyles.white,
        ),
        textStyle: GoogleFonts.workSans(
            textStyle: TextStyles.titleHeadline!.copyWith(
                color: ColorStyles.white, fontWeight: FontWeight.w400)),
        hintStyle: GoogleFonts.workSans(
            textStyle: TextStyles.titleHeadline?.copyWith(
                color: ColorStyles.white, fontWeight: FontWeight.w400)),
        prefixIcon: Icon(
          Icons.date_range,
          color: ColorStyles.white,
        ),
        maxLine: 1,
      ),
    );
  }

  ///widget phoneNumber
  Widget _phoneNumber() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: NeoStoreTextFormField(
        hintText: ConstantStrings.phoneNumber,
        maxLine: 1,
        validation: validatePhoneNumber,
        controller: _phoneNumberController,
        errorStyle: TextStyles.titleHeadline!.copyWith(
          color: ColorStyles.white,
        ),
        textStyle: GoogleFonts.workSans(
            textStyle: TextStyles.titleHeadline!.copyWith(
                color: ColorStyles.white, fontWeight: FontWeight.w400)),
        hintStyle: GoogleFonts.workSans(
            textStyle: TextStyles.titleHeadline?.copyWith(
                color: ColorStyles.white, fontWeight: FontWeight.w400)),
        prefixIcon: Icon(
          Icons.phone_android,
          color: ColorStyles.white,
        ),
      ),
    );
  }

  ///widget email
  Widget _email() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: NeoStoreTextFormField(
        hintText: ConstantStrings.email,
        validation: validateEmail,
        maxLine: 1,
        controller: _emailController,
        errorStyle: TextStyles.titleHeadline!.copyWith(
          color: ColorStyles.white,
        ),
        textStyle: GoogleFonts.workSans(
            textStyle: TextStyles.titleHeadline!.copyWith(
                color: ColorStyles.white, fontWeight: FontWeight.w400)),
        hintStyle: GoogleFonts.workSans(
            textStyle: TextStyles.titleHeadline?.copyWith(
                color: ColorStyles.white, fontWeight: FontWeight.w400)),
        prefixIcon: Icon(
          Icons.email,
          color: ColorStyles.white,
        ),
      ),
    );
  }

  ///widget lastname
  Widget _lastName() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: NeoStoreTextFormField(
        hintText: ConstantStrings.lastName,
        validation: validateName,
        maxLine: 1,
        controller: _lastController,
        errorStyle: TextStyles.titleHeadline!.copyWith(
          color: ColorStyles.white,
        ),
        textStyle: GoogleFonts.workSans(
            textStyle: TextStyles.titleHeadline!.copyWith(
                color: ColorStyles.white, fontWeight: FontWeight.w400)),
        hintStyle: GoogleFonts.workSans(
            textStyle: TextStyles.titleHeadline?.copyWith(
                color: ColorStyles.white, fontWeight: FontWeight.w400)),
        prefixIcon: Image.asset('assets/images/username_icon.png'),
      ),
    );
  }

  ///widget first name
  Widget _firstName() {
    return NeoStoreTextFormField(
      hintText: ConstantStrings.firstName,
      validation: validateName,
      maxLine: 1,
      controller: _firstController,
      errorStyle: TextStyles.titleHeadline!.copyWith(
        color: ColorStyles.white,
      ),
      textStyle: GoogleFonts.workSans(
          textStyle: TextStyles.titleHeadline!
              .copyWith(color: ColorStyles.white, fontWeight: FontWeight.w400)),
      hintStyle: GoogleFonts.workSans(
          textStyle: TextStyles.titleHeadline?.copyWith(
              color: ColorStyles.white, fontWeight: FontWeight.w400)),
      prefixIcon: Image.asset('assets/images/username_icon.png'),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: [
          NeoStoreTitle(
            text: ConstantStrings.choose_profile_photo,
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                ),
                onPressed: () {
                  _onImageButtonPressed(ImageSource.camera, context);
                  // takePhoto(ImageSource.camera);
                },
                icon: Icon(Icons.camera_alt_outlined),
                label: Text(ConstantStrings.camera),
              ),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                ),
                onPressed: () {
                  _onImageButtonPressed(ImageSource.gallery, context);
                  // takePhoto(ImageSource.gallery);
                },
                icon: Icon(Icons.camera_alt_outlined),
                label: Text(ConstantStrings.galary),
              )
            ],
          )
        ],
      ),
    );
  }

  ///take photo method
  // void takePhoto(ImageSource source) async {
  //   final pickedFile = await _picker.pickImage(
  //       source: source, imageQuality: 20, maxHeight: 100, maxWidth: 100);
  //   setState(() {
  //     _imageFile = pickedFile! as PickedFile?;
  //   });
  // }

  void _onImageButtonPressed(ImageSource source, BuildContext context) async {
    XFile? pickedFile = await _picker.pickImage(
      source: source,
      // maxWidth: _maxWidth,
      // maxHeight: _maxHeight,
      imageQuality: 100,
    );
    if (pickedFile != null) {
      final File file = File(pickedFile.path);
      _editProfileProvider.updateFieldValue(context, false, file);
    }
  }

  void editProfileUser(BuildContext context) async {
    File file = File(_editProfileProvider.imageFile!.path);
    Uint8List bytes = file.readAsBytesSync();
    print("sizepic=>${bytes.length}");

    var response = await _editProfileProvider.getEditProfile(
        _emailController.text,
        _dobController.text,
        _phoneNumberController.text,
        bytes,
        _firstController.text,
        _lastController.text);

    print('zzzzzz=>$response');

    EditProfileResponse _editProfileResponse = EditProfileResponse.fromJson(
      json.decode(response),
    );

    if (_editProfileResponse.status == 200) {
      MemoryManagement.setFirstName(
          firstName: _editProfileResponse.data?.firstName);
      MemoryManagement.setLastName(
          lastName: _editProfileResponse.data?.lastName);
      MemoryManagement.setEmail(email: _editProfileResponse.data?.email);
      MemoryManagement.setPhoneNumber(
          phoneNumber: _editProfileResponse.data?.phoneNo);
      MemoryManagement.setDob(dob: _editProfileResponse.data?.dob);
      MemoryManagement.setProfilePic(
          profilepic: _editProfileResponse.data?.profilePic);
      print("editmemory=>${MemoryManagement.getFirstName()}");

      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ProfileDetailsView(),
        ),
      );
    }
  }
}
