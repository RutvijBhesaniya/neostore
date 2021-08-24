import 'package:flutter/cupertino.dart';

class APIs {
  APIs._();

  /// Base url
  static const String baseUrl =
      "http://staging.php-dev.in:8844/trainingapp/api";

  ///url
  static const String register = "$baseUrl/users/register";

  static const String login = "$baseUrl/users/login";
  static const String forgot = "$baseUrl/users/forgot";
  static const String change = "$baseUrl/change";
  static const String update = "$baseUrl/update";
  static const String fetchAccountDetail = "$baseUrl/users/getUserData";

  ///category api
  static const String tableCategory = "$baseUrl/products/getList";

  ///details category api
  static const String tableDetail = "$baseUrl/products/getDetail";
  static const String ratingBar ="$baseUrl/products/setRating";

  static late BuildContext context;
}
