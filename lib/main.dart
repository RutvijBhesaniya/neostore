import 'package:flutter/material.dart';
import 'package:neostore/data/web_service/api_impl/list_cart_api/list_cart_api_impl.dart';
import 'package:neostore/data/web_service/repository/list_cart_repository/list_cart_repository.dart';
import 'package:neostore/data/web_service/repository/list_cart_repository/list_cart_repository_impl.dart';
import 'package:neostore/di/providers.dart';
import 'package:neostore/domain/list_cart_use_case.dart';
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
import 'package:neostore/presentation/splash/splash_view.dart';
import 'package:neostore/presentation/table_category/table_category_viewmodel.dart';
import 'package:neostore/presentation/table_detailed/table_detail_viewmodel.dart';
import 'package:neostore/presentation/widget/radio_button.dart';
import 'package:neostore/utils/constant_strings.dart';
import 'package:neostore/utils/shared_preferences/memory_management.dart';
import 'package:neostore/utils/style.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MemoryManagement.init();

  runApp(NeoStore());
}

class NeoStore extends StatefulWidget {
  @override
  _NeoStoreState createState() => _NeoStoreState();
}

class _NeoStoreState extends State<NeoStore> {
  _NeoStoreState();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providersList,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: ConstantStrings.neoStore,
        theme: ThemeData(
          unselectedWidgetColor: ColorStyles.black,
          accentColor: Color(0xFFBB0100),
        ),
        home: SplashScreen(),
      ),
    );
  }
}
