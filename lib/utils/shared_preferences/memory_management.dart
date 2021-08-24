import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:neostore/data/model/response/login_response.dart';
import 'package:neostore/utils/shared_preferences/SharedPrefsKeys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MemoryManagement {
   static late SharedPreferences prefs;

  static Future<bool> init() async {
    prefs = await SharedPreferences.getInstance();
    return true;
  }

  static void setIsUserLoggedIn({required bool isuserloggedin}) {
    prefs.setBool(SharedPrefsKeys.IS_USER_SIGNED_IN, isuserloggedin);
  }

  static bool? getIsUserLoggedIn() {
    return prefs.getBool(SharedPrefsKeys.IS_USER_SIGNED_IN);
  }

  static void setUserName({@required String? username}) {
    prefs.setString(SharedPrefsKeys.USER_NAME, username!);
  }

  static String? getUserName() {
    return prefs.getString(SharedPrefsKeys.USER_NAME);
  }

  static String? getFirstName() {
    return prefs.getString(SharedPrefsKeys.FIRST_NAME);
  }

  static String? setFirstName({@required String? firstName}) {
    prefs.setString(SharedPrefsKeys.FIRST_NAME, firstName!);
  }

   static String? getAccessToken() {
     return prefs.getString(SharedPrefsKeys.ACCESS_TOKEN);
   }

   static String? setAccessToken({@required String? accessToken}) {
     prefs.setString(SharedPrefsKeys.ACCESS_TOKEN, accessToken!);
   }



  static String? getLastName() {
    return prefs.getString(SharedPrefsKeys.LAST_NAME);
  }

  static String? setLastName({@required String? lastName}) {
    prefs.setString(SharedPrefsKeys.LAST_NAME, lastName!);
  }

  static String? setEmail({@required String? email}) {
    prefs.setString(SharedPrefsKeys.EMAIL, email!);
  }

  static String? getEmail() {
    return prefs.getString(SharedPrefsKeys.EMAIL);
  }

  static String? setPhoneNumber({@required String? phoneNumber}) {
    prefs.setString(SharedPrefsKeys.PHONE_NUMBER, phoneNumber!);
  }

  static String? getPhoneNumber() {
    return prefs.getString(SharedPrefsKeys.PHONE_NUMBER);
  }

  static String? setGender({@required String? gender}) {
    prefs.setString(SharedPrefsKeys.GENDER, gender!);
  }

  static String? getGender() {
    return prefs.getString(SharedPrefsKeys.GENDER);
  }

  static void setLoggedInUserKey({@required String? key}) {
    prefs.setString(SharedPrefsKeys.LOGGEDINUSERKEY, key!);
  }

  static String? getLoggedInUserKey() {
    return prefs.getString(SharedPrefsKeys.LOGGEDINUSERKEY);
  }

  static void setProfilePic({@required String? profilepic}) {
    prefs.setString(SharedPrefsKeys.PROFILEPIC, profilepic!);
  }

  static String? getProfilePic() {
    return prefs.getString(SharedPrefsKeys.PROFILEPIC);
  }

  //clear all values from shared preferences
  static void clearMemory() {
    prefs.clear();
  }

  static Future<void> saveUserInfo() async {
    final LoginResponse loginResponse = LoginResponse.fromJson({
      "data": [
        {
          "id": 8,
          "role_id": 2,
          "first_name": "Kannan",
          "last_name": "Maravar",
          "email": "Kannan.Maravar@wwindia.com",
          "username": "KannanMaravar",
          "profile_pic": null,
          "country_id": null,
          "gender": "M",
          "phone_no": 77150200100,
          "dob": null,
          "is_active": true,
          "created": "2015-08-21T04:35:46+0000",
          "modified": "2015-08-21T04:35:46+0000",
          "access_token": "55d6aaa2cf556"
        }
      ],
    });

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool result =
        await prefs.setString('loginResponse', jsonEncode(loginResponse));
    print(result);
  }

  static Future<LoginResponse?> getUserInfo() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, dynamic>? userMap;
    final String? userStr = prefs.getString('loginResponse');
    if (userStr != null) {
      userMap = jsonDecode(userStr) as Map<String, dynamic>;
    }

    if (userMap != null) {
      final LoginResponse loginResponse = LoginResponse.fromJson(userMap);
      print(loginResponse);
      return loginResponse;
    }

    return null;
  }
}
