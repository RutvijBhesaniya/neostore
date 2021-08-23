import 'package:meta/meta.dart';
import 'package:neostore/utils/shared_preferences/SharedPrefsKeys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MemoryManagement {
  static SharedPreferences? prefs;

  static Future<bool> init() async {
    prefs = await SharedPreferences.getInstance();
    return true;
  }

  static void setIsUserLoggedIn({required bool isuserloggedin}) {
    prefs!.setBool(SharedPrefsKeys.IS_USER_SIGNED_IN, isuserloggedin);
  }

  static bool? getIsUserLoggedIn() {
    return prefs!.getBool(SharedPrefsKeys.IS_USER_SIGNED_IN);
  }

  static void setUserName({@required String? username}) {
    prefs!.setString(SharedPrefsKeys.USER_NAME, username!);
  }

  static String? getUserName() {
    return prefs!.getString(SharedPrefsKeys.USER_NAME);
  }

  static void setEmail({@required String? email}) {
    prefs!.setString(SharedPrefsKeys.EMAIL, email!);
  }

  static String? getEmail() {
    return prefs!.getString(SharedPrefsKeys.EMAIL);
  }

  static void setMobileNumber({@required String? mobilenumber}) {
    prefs!.setString(SharedPrefsKeys.MOBILENUMBER, mobilenumber!);
  }

  static String? getMobileNumber() {
    return prefs!.getString(SharedPrefsKeys.MOBILENUMBER);
  }

  static void setLoggedInUserKey({@required String? key}) {
    prefs!.setString(SharedPrefsKeys.LOGGEDINUSERKEY, key!);
  }

  static String? getLoggedInUserKey() {
    return prefs!.getString(SharedPrefsKeys.LOGGEDINUSERKEY);
  }

  static void setProfilePic({@required String? profilepic}) {
    prefs!.setString(SharedPrefsKeys.PROFILEPIC, profilepic!);
  }

  static String? getProfilePic() {
    return prefs!.getString(SharedPrefsKeys.PROFILEPIC);
  }

  //clear all values from shared preferences
  static void clearMemory() {
    prefs!.clear();
  }
}
