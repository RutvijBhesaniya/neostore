import 'package:neostore/data/web_service/api_impl/list_cart_api/list_cart_api.dart';
import 'package:neostore/data/web_service/api_impl/list_cart_api/list_cart_api_impl.dart';
import 'package:neostore/data/web_service/repository/list_cart_repository/list_cart_repository.dart';
import 'package:neostore/data/web_service/repository/list_cart_repository/list_cart_repository_impl.dart';
import 'package:neostore/domain/list_cart_use_case.dart';
import 'package:neostore/domain/login_use_case.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providersList = [
  ...independentServices,
  ...dependentServices
];

List independentServices = [
  Provider.value(value: ListCartApiImpl())
];

List dependentServices = [
  ProxyProvider<ListCartApiImpl, ListCartRepository>(
      update: (context, source, previous) => ListCartRepositoryImpl(source)),


  ProxyProvider<ListCartRepository, ListCartUseCase>(
      update: (context, source, previous) => ListCartUseCase(source)),
];