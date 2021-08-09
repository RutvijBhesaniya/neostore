import 'package:flutter/cupertino.dart';

class APIs {
  APIs._();

  // Base url
  static const String baseUrl =
      "http://staging.php-dev.in:8844/trainingapp/api/users";

  //url
  static const String register = "$baseUrl/register";
  static const String login = "$baseUrl/login";
  static const String forgot = "$baseUrl/forgot";
  static const String change = "$baseUrl/change";
  static const String update = "$baseUrl/update";
  static const String getUserData = "$baseUrl/getUserData";

  static late BuildContext context;
}
