import 'package:flutter/cupertino.dart';
import 'package:neostore/data/model/response/add_to_cart_response.dart';
import 'package:neostore/data/web_service/api_impl/add_to_cart_api/add_to_cart_api_impl.dart';
import 'package:neostore/data/web_service/repository/add_to_cart_repository/add_to_cart_repository_impl.dart';
import 'package:neostore/domain/add_to_cart_use_case.dart';

class AddToCartProvider extends ChangeNotifier {

  AddToCartUseCase _addToCartUseCase = AddToCartUseCase(
    AddToCartRepositoryImpl(
      AddToCartApiImpl(),
    ),
  );

  late AddToCartResponse _addToCartResponse;

  AddToCartResponse get addToCartResponse => _addToCartResponse;


  bool _isLoading = true;

  get isLoading => _isLoading;

  Future<dynamic> getAddToCart(int productId, int quantity) async {
    _isLoading = true;
    print("loading=>$_isLoading");
    var response = await _addToCartUseCase.callApi(productId, quantity);
    print("casrtResponse=>$response");
    // _addToCartResponse = AddToCartResponse.fromJson(jsonDecode(response));
    _isLoading = false;
    return response;
    notifyListeners();
  }
}
