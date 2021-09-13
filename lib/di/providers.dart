import 'package:neostore/data/request/cart_api_request.dart';
import 'package:neostore/data/request/edit_profile_api_request.dart';
import 'package:neostore/data/request/login_api_request.dart';
import 'package:neostore/data/request/my_account_api_request.dart';
import 'package:neostore/data/request/my_order_list_api_request.dart';
import 'package:neostore/data/request/order_address_list_api_request.dart';
import 'package:neostore/data/request/order_detail_api_request.dart';
import 'package:neostore/data/request/register_api_request.dart';
import 'package:neostore/data/request/reset_password_api_request.dart';
import 'package:neostore/data/request/table_category_api_request.dart';
import 'package:neostore/data/request/table_detail_api_request.dart';
import 'package:neostore/data/web_service/api_impl/cart_api/cart_api.dart';
import 'package:neostore/data/web_service/api_impl/cart_api/cart_api_impl.dart';
import 'package:neostore/data/web_service/api_impl/edit_profile_api/edit_profile_api.dart';
import 'package:neostore/data/web_service/api_impl/edit_profile_api/edit_profile_api_impl.dart';
import 'package:neostore/data/web_service/api_impl/login_api/login_api.dart';
import 'package:neostore/data/web_service/api_impl/login_api/login_api_impl.dart';
import 'package:neostore/data/web_service/api_impl/my_account_api/my_account_api.dart';
import 'package:neostore/data/web_service/api_impl/my_account_api/my_account_api_impl.dart';
import 'package:neostore/data/web_service/api_impl/my_order_list_api/my_order_list_api.dart';
import 'package:neostore/data/web_service/api_impl/my_order_list_api/my_order_list_api_impl.dart';
import 'package:neostore/data/web_service/api_impl/order_address_api/order_address_api.dart';
import 'package:neostore/data/web_service/api_impl/order_address_api/order_address_api_impl.dart';
import 'package:neostore/data/web_service/api_impl/order_detail_api/order_detail_api.dart';
import 'package:neostore/data/web_service/api_impl/order_detail_api/order_detail_api_impl.dart';
import 'package:neostore/data/web_service/api_impl/register_api/register_api_impl.dart';
import 'package:neostore/data/web_service/api_impl/register_api/registerApi.dart';
import 'package:neostore/data/web_service/api_impl/reset_password_api/reset_password_api.dart';
import 'package:neostore/data/web_service/api_impl/reset_password_api/reset_password_api_impl.dart';
import 'package:neostore/data/web_service/api_impl/table_category_api/table_category_api.dart';
import 'package:neostore/data/web_service/api_impl/table_category_api/table_category_api_impl.dart';
import 'package:neostore/data/web_service/api_impl/table_detail_api/table_detail_api.dart';
import 'package:neostore/data/web_service/api_impl/table_detail_api/table_detail_api_impl.dart';
import 'package:neostore/data/web_service/repository/cart_repository/cart_repository.dart';
import 'package:neostore/data/web_service/repository/cart_repository/cart_repository_impl.dart';
import 'package:neostore/data/web_service/repository/edit_profile_repository/edit_profile_repository.dart';
import 'package:neostore/data/web_service/repository/edit_profile_repository/edit_profile_repository_impl.dart';
import 'package:neostore/data/web_service/repository/login_repository/login_repository.dart';
import 'package:neostore/data/web_service/repository/login_repository/login_repository_impl.dart';
import 'package:neostore/data/web_service/repository/my_account_repository/my_account_repository.dart';
import 'package:neostore/data/web_service/repository/my_account_repository/my_account_repository_impl.dart';
import 'package:neostore/data/web_service/repository/my_order_list_repository/my_order_list_repository.dart';
import 'package:neostore/data/web_service/repository/my_order_list_repository/my_order_list_repository_impl.dart';
import 'package:neostore/data/web_service/repository/order_address_repository/order_address_repository.dart';
import 'package:neostore/data/web_service/repository/order_address_repository/order_address_repository_impl.dart';
import 'package:neostore/data/web_service/repository/order_detail_repository/order_detail_repository.dart';
import 'package:neostore/data/web_service/repository/order_detail_repository/order_detail_repository_impl.dart';
import 'package:neostore/data/web_service/repository/register_repository/register_repository.dart';
import 'package:neostore/data/web_service/repository/register_repository/register_repository_impl.dart';
import 'package:neostore/data/web_service/repository/reset_password_repository/reset_password_api_impl.dart';
import 'package:neostore/data/web_service/repository/reset_password_repository/reset_password_repository.dart';
import 'package:neostore/data/web_service/repository/table_category_repository/table_category_repository.dart';
import 'package:neostore/data/web_service/repository/table_category_repository/table_category_repository_impl.dart';
import 'package:neostore/data/web_service/repository/table_detail_repository/table_detail_repository.dart';
import 'package:neostore/data/web_service/repository/table_detail_repository/table_detail_repository_impl.dart';
import 'package:neostore/domain/cart_use_case.dart';
import 'package:neostore/domain/edit_profile_use_case.dart';
import 'package:neostore/domain/login_use_case.dart';
import 'package:neostore/domain/my_account_use_case.dart';
import 'package:neostore/domain/order_address_use_case.dart';
import 'package:neostore/domain/order_detail_use_case.dart';
import 'package:neostore/domain/order_list_use_case.dart';
import 'package:neostore/domain/register_use_case.dart';
import 'package:neostore/domain/reset_password_use_case.dart';
import 'package:neostore/domain/table_category_use_case.dart';
import 'package:neostore/domain/table_detail_use_case.dart';
import 'package:neostore/presentation/home/home_viewmodel.dart';
import 'package:neostore/presentation/order_address_list/order_address_list_viewmodel.dart';
import 'package:neostore/presentation/widget/radio_button.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providersList = [
  ...independentServices,
  ...dependentServices
];

List<SingleChildWidget> independentServices = [
  ChangeNotifierProvider<ChangeGender>(
    create: (context) => ChangeGender(),
  ),

  ChangeNotifierProvider<CarouselSliderProvider>(
    create: (context) => CarouselSliderProvider(),
  ),
  Provider(create: (context) => MyAccountApiRequest()),
  Provider(create: (context) => CartApiRequest()),
  Provider(create: (context) => LoginApiRequest()),
  Provider(create: (context) => RegisterApiRequest()),
  Provider(create: (context) => TableCategoryApiRequest()),
  Provider(create: (context) => TableDetailApiRequest()),
  Provider(create: (context) => EditProfileApiRequest()),
  Provider(create: (context) => ResetPasswordApiRequest()),
  Provider(create: (context) => MyOrderListApiRequest()),
  Provider(create: (context) => OrderDetailApiRequest()),
  Provider(create: (context) => OrderAddressListApiRequest()),
];

List<SingleChildWidget> dependentServices = [
  ProxyProvider<MyAccountApiRequest, MyAccountApi>(
      update: (context, myAccountApiRequest, myAccountApi) =>
          MyAccountApiImpl(myAccountApiRequest)),
  ProxyProvider<MyAccountApi, MyAccountRepository>(
      update: (context, myAccountApi, myAccountRepository) =>
          MyAccountRepositoryImpl(myAccountApi)),
  ProxyProvider<MyAccountRepository, MyAccountUseCase>(
      update: (context, myAccountRepository, myAccountUseCase) =>
          MyAccountUseCase(myAccountRepository)),
  ProxyProvider<CartApiRequest, CartApi>(
      update: (context, cartApiRequest, cartApi) =>
          CartApiImpl(cartApiRequest)),
  ProxyProvider<CartApi, CartRepository>(
      update: (context, cartApi, cartRepository) =>
          CartRepositoryImpl(cartApi)),
  ProxyProvider<CartRepository, CartUseCase>(
      update: (context, cartRepository, cartUseCase) =>
          CartUseCase(cartRepository)),
  ProxyProvider<LoginApiRequest, LoginApi>(
    update: (context, loginApiRequest, loginApi) =>
        LoginApiImpl(loginApiRequest),
  ),
  ProxyProvider<LoginApi, LoginRepository>(
      update: (context, loginApi, loginRepository) =>
          LoginRepositoryImpl(loginApi)),
  ProxyProvider<LoginRepository, LoginUseCase>(
      update: (context, loginRepository, loginUseCase) =>
          LoginUseCase(loginRepository)),
  ProxyProvider<RegisterApiRequest, RegisterApi>(
    update: (context, registerApiRequest, registerApi) =>
        RegisterApiImpl(registerApiRequest),
  ),
  ProxyProvider<RegisterApi, RegisterRepository>(
      update: (context, registerApi, registerRepository) =>
          RegisterRepositoryImpl(registerApi)),
  ProxyProvider<RegisterRepository, RegisterUseCase>(
      update: (context, registerRepository, registerUseCase) =>
          RegisterUseCase(registerRepository)),
  ProxyProvider<TableCategoryApiRequest, TableCategoryApi>(
    update: (context, tableCategoryApiRequest, tableCategoryApi) =>
        TableCategoryApiImpl(tableCategoryApiRequest),
  ),
  ProxyProvider<TableCategoryApi, TableCategoryRepository>(
      update: (context, tableCategoryApi, tableCategoryRepository) =>
          TableCategoryRepositoryImpl(tableCategoryApi)),
  ProxyProvider<TableCategoryRepository, TableCategoryUseCase>(
      update: (context, tableCategoryRepository, tableCategoryUseCase) =>
          TableCategoryUseCase(tableCategoryRepository)),
  ProxyProvider<TableDetailApiRequest, TableDetailApi>(
    update: (context, tableDetailApiRequest, tableDetailApi) =>
        TableDetailApiImpl(tableDetailApiRequest),
  ),
  ProxyProvider<TableDetailApi, TableDetailRepository>(
      update: (context, tableDetailApi, tableDetailRepository) =>
          TableDetailRepositoryImpl(tableDetailApi)),
  ProxyProvider<TableDetailRepository, TableDetailUseCase>(
      update: (context, tableDetailRepository, tableDetailUseCase) =>
          TableDetailUseCase(tableDetailRepository)),
  ProxyProvider<EditProfileApiRequest, EditProfileApi>(
    update: (context, editProfileApiRequest, editProfileApi) =>
        EditProfileApiImpl(editProfileApiRequest),
  ),
  ProxyProvider<EditProfileApi, EditProfileRepository>(
      update: (context, editProfileApi, editProfileRepository) =>
          EditProfileRepositoryImpl(editProfileApi)),
  ProxyProvider<EditProfileRepository, EditProfileUseCase>(
      update: (context, editProfileRepository, editProfileUseCase) =>
          EditProfileUseCase(editProfileRepository)),
  ProxyProvider<ResetPasswordApiRequest, ResetPasswordApi>(
    update: (context, resetPasswordApiRequest, resetPasswordApi) =>
        ResetPasswordApiImpl(resetPasswordApiRequest),
  ),
  ProxyProvider<ResetPasswordApi, ResetPasswordRepository>(
      update: (context, resetPasswordApi, resetPasswordRepository) =>
          ResetPasswordRepositoryImpl(resetPasswordApi)),
  ProxyProvider<ResetPasswordRepository, ResetPasswordUseCase>(
      update: (context, resetPasswordRepository, resetPasswordUseCase) =>
          ResetPasswordUseCase(resetPasswordRepository)),
  ProxyProvider<MyOrderListApiRequest, MyOrderListApi>(
    update: (context, myOrderListApiRequest, myOrderListApi) =>
        MyOrderListApiImpl(myOrderListApiRequest),
  ),
  ProxyProvider<MyOrderListApi, MyOrderListRepository>(
      update: (context, myOrderListApi, myOrderListRepository) =>
          MyOrderListRepositoryImpl(myOrderListApi)),
  ProxyProvider<MyOrderListRepository, MyOrderListUseCase>(
      update: (context, myOrderListRepository, myOrderListUseCase) =>
          MyOrderListUseCase(myOrderListRepository)),


  ProxyProvider<OrderDetailApiRequest, OrderDetailApi>(
    update: (context, orderDetailApiRequest, orderDetailApi) =>
        OrderDetailApiImpl(orderDetailApiRequest),
  ),
  ProxyProvider<OrderDetailApi, OrderDetailRepository>(
      update: (context, orderDetailApi, orderDetailRepository) =>
          OrderDetailRepositoryImpl(orderDetailApi)),
  ProxyProvider<OrderDetailRepository, OrderDetailUseCase>(
      update: (context, orderDetailRepository, orderDetailUseCase) =>
          OrderDetailUseCase(orderDetailRepository)),


  ProxyProvider<OrderAddressListApiRequest, OrderAddressApi>(
    update: (context, orderAddressListApiRequest, orderAddressApi) =>
        OrderAddressApiImpl(orderAddressListApiRequest),
  ),
  ProxyProvider<OrderAddressApi, OrderAddressRepository>(
      update: (context, orderAddressApi, orderAddressRepository) =>
          OrderAddressRepositoryImpl(orderAddressApi)),
  ProxyProvider<OrderAddressRepository, OrderAddressUseCase>(
      update: (context, orderAddressRepository, orderAddressUseCase) =>
          OrderAddressUseCase(orderAddressRepository)),
];
