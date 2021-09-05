import 'package:flutter/material.dart';
import 'package:neostore/data/widget/radio_button.dart';
import 'package:neostore/data/widget/splash_screen.dart';
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
import 'package:neostore/utils/constant_strings.dart';
import 'package:neostore/utils/shared_preferences/memory_management.dart';
import 'package:neostore/utils/style.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MemoryManagement.init();

  // print("userlog=>$isUserLoggedIn");

  runApp(
    MultiProvider(
      providers: [
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
        ChangeNotifierProvider<ForgotProvider>(
          create: (context) => ForgotProvider(),
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
        ChangeNotifierProvider<ChangeAddress>(
          create: (context) => ChangeAddress(),
        ),
        ChangeNotifierProvider<AddressListProvider>(
          create: (context) => AddressListProvider(),
        ),
        ChangeNotifierProvider<CarouselSliderProvider>(
          create: (context) => CarouselSliderProvider(),
        ),
        ChangeNotifierProvider<HomeProvider>(
          create: (context) => HomeProvider(),
        ),
      ],
      child: NeoStore(),
    ),
  );
}

class NeoStore extends StatefulWidget {
  @override
  _NeoStoreState createState() => _NeoStoreState();
}

class _NeoStoreState extends State<NeoStore> {
  _NeoStoreState();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: ConstantStrings.neoStore,
        theme: ThemeData(
          unselectedWidgetColor: ColorStyles.black,
          accentColor: Color(0xFFBB0100),
        ),
        home: SplashScreen());
  }
}
