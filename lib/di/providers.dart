import 'package:neostore/data/request/my_account_api_request.dart';
import 'package:neostore/data/web_service/api_impl/list_cart_api/list_cart_api.dart';
import 'package:neostore/data/web_service/api_impl/list_cart_api/list_cart_api_impl.dart';
import 'package:neostore/data/web_service/api_impl/my_account_api/my_account_api.dart';
import 'package:neostore/data/web_service/api_impl/my_account_api/my_account_api_impl.dart';
import 'package:neostore/data/web_service/repository/list_cart_repository/list_cart_repository.dart';
import 'package:neostore/data/web_service/repository/list_cart_repository/list_cart_repository_impl.dart';
import 'package:neostore/data/web_service/repository/my_account_repository/my_account_repository.dart';
import 'package:neostore/data/web_service/repository/my_account_repository/my_account_repository_impl.dart';
import 'package:neostore/domain/my_account_use_case.dart';
import 'package:neostore/presentation/address_list/address_list_view_model.dart';
import 'package:neostore/presentation/edit_profile/edit_profile_viewmodel.dart';
import 'package:neostore/presentation/home/home_viewmodel.dart';
import 'package:neostore/presentation/login/login_viewmodel.dart';
import 'package:neostore/presentation/my_cart/my_cart_viewmodel.dart';
import 'package:neostore/presentation/my_order/my_order_viewmodel.dart';
import 'package:neostore/presentation/order_detail/order_detail_viewmodel.dart';
import 'package:neostore/presentation/profile_details/profile_details_viewmodel.dart';
import 'package:neostore/presentation/register/register_viewmodel.dart';
import 'package:neostore/presentation/reset_password/reset_password_viewmodel.dart';
import 'package:neostore/presentation/table_category/table_category_viewmodel.dart';
import 'package:neostore/presentation/table_detailed/table_detail_viewmodel.dart';
import 'package:neostore/presentation/widget/radio_button.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';


List<SingleChildWidget> providersList = [
  ...independentServices,
  ...dependentServices
];

List<SingleChildWidget> independentServices = [
  ChangeNotifierProvider<LoginScreenProvider>(
    create: (context) => LoginScreenProvider(),
  ),
  ChangeNotifierProvider<RegisterViewProvider>(
    create: (context) => RegisterViewProvider(),
  ),
  ChangeNotifierProvider<ChangeGender>(
    create: (context) => ChangeGender(),
  ),
  ChangeNotifierProvider<TableCategoryProvider>(
    create: (context) => TableCategoryProvider(),
  ),
  ChangeNotifierProvider<TableDetailProvider>(
    create: (context) => TableDetailProvider(),
  ),
  ChangeNotifierProvider<ProfileDetailsProvider>(
    create: (context) => ProfileDetailsProvider(),
  ),
  ChangeNotifierProvider<EditProfileProvider>(
    create: (context) => EditProfileProvider(),
  ),
  ChangeNotifierProvider<ResetPasswordProvider>(
    create: (context) => ResetPasswordProvider(),
  ),
  ChangeNotifierProvider<MyCartProvider>(
    create: (context) => MyCartProvider(),
  ),
  ChangeNotifierProvider<MyOrderProvider>(
    create: (context) => MyOrderProvider(),
  ),
  ChangeNotifierProvider<OrderDetailProvider>(
    create: (context) => OrderDetailProvider(),
  ),
  ChangeNotifierProvider<AddressListProvider>(
    create: (context) => AddressListProvider(),
  ),
  ChangeNotifierProvider<CarouselSliderProvider>(
    create: (context) => CarouselSliderProvider(),
  ),
  // ChangeNotifierProvider<HomeProvider>(
  //   create: (context) => HomeProvider(),
  // ),
  Provider(create: (context) => MyAccountApiRequest())
];

List<SingleChildWidget> dependentServices = [
  ProxyProvider<MyAccountApiRequest, MyAccountApi?>(
      update: (context, myAccountApiRequest, myAccountApi) =>
          MyAccountApiImpl(myAccountApiRequest)),
  ProxyProvider<MyAccountApiImpl?, MyAccountRepository?>(
      update: (context, myAccountApiImpl, myAccountRepository) =>
          MyAccountRepositoryImpl(myAccountApiImpl!)),
  ProxyProvider<MyAccountRepository?, MyAccountUseCase?>(
      update: (context, myAccountRepository, myAccountUseCase) =>
          MyAccountUseCase(myAccountRepository!)),
];
