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
  static const String reset = "$baseUrl/users/change";
  static const String updateProfile = "$baseUrl/users/update";
  static const String fetchAccountDetail = "$baseUrl/users/getUserData";
  static const String addToCart = "$baseUrl/addToCart";
  static const String editCart ="$baseUrl/editCart";
  static const String deleteCart ="$baseUrl/deleteCart";



  ///category api
  static const String tableCategory = "$baseUrl/products/getList";

  ///details category api
  static const String tableDetail = "$baseUrl/products/getDetail";
  static const String ratingBar ="$baseUrl/products/setRating";

  static late BuildContext context;
}
