import 'dart:async';
import 'package:dio/dio.dart';
import 'package:neostore/base/network_model/api_constant.dart';
import 'package:neostore/base/network_model/api_error.dart';
import 'package:neostore/base/network_model/api_handler.dart';
import 'package:neostore/data/web_service/api_impl/rating_api/rating_api.dart';

class RatingApiImpl extends RatingApi {

  @override
  Future getRatingApi(int productid) async {
    Map<String,dynamic> map = Map<String,dynamic>();
    map.putIfAbsent("product_id", () => productid);
    Completer<dynamic> completer = new Completer<dynamic>();
    FormData formData = new FormData.fromMap(map);

    // print("sssss=>${"${APIs.ratingBar}?product_id=$ratingRequest"}");
    var response = await APIHandler.post(
      // url: "${APIs.ratingBar}?product_id=$productId",
      url: "${APIs.ratingBar}",
      requestBody: formData
      // requestBody: {"product_id ": productId},
      // context: context,
    );

    print('gotResponseeeee=>${response.runtimeType}');
    if (response is ApiError) {
      completer.complete(response);
      return completer.future;
    } else {
      completer.complete(response);
      return completer.future;
    }
  }
}
