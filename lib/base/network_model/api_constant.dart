import 'package:flutter/cupertino.dart';

class APIs {
  APIs._();

  // Base url
  static const String baseUrl =
      "http://staging.php-dev.in:8844/trainingapp/api";

  //url
  static const String register = "$baseUrl/users/register"  ;
  static const String login = "$baseUrl/users/login";
  static const String forgot = "$baseUrl/forgot";
  static const String change = "$baseUrl/change";
  static const String update = "$baseUrl/update";
  static const String getUserData = "$baseUrl/getUserData";


  static const String tableCategory ="$baseUrl/products/getList";

  static late BuildContext context;
}
