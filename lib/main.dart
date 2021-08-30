import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neostore/data/widget/radio_button.dart';
import 'package:neostore/presentation/address_list/address_list_view_model.dart';
import 'package:neostore/presentation/edit_profile/edit_profile_viewmodel.dart';
import 'package:neostore/presentation/home/drawer_viewmodel.dart';
import 'package:neostore/presentation/home/home_view.dart';
import 'package:neostore/presentation/login/login_view.dart';
import 'package:neostore/presentation/login/login_viewmodel.dart';
import 'package:neostore/presentation/my_account/my_account_viewmodel.dart';
import 'package:neostore/presentation/my_cart/my_cart_viewmodel.dart';
import 'package:neostore/presentation/my_order/my_order_viewmodel.dart';
import 'package:neostore/presentation/order_detail/order_detail_view.dart';
import 'package:neostore/presentation/order_detail/order_detail_viewmodel.dart';
import 'package:neostore/presentation/product_detailed/table_detail_viewmodel.dart';
import 'package:neostore/presentation/register/register_viewmodel.dart';
import 'package:neostore/presentation/reset_password/reset_password_viewmodel.dart';
import 'package:neostore/presentation/table_category/table_category_viewmodel.dart';
import 'package:neostore/utils/constant_strings.dart';
import 'package:neostore/utils/shared_preferences/memory_management.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MemoryManagement.init();

  var isUserLoggedIn = MemoryManagement.getIsUserLoggedIn() ?? false;
  print("userlog=>$isUserLoggedIn");

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginScreenProvider>(
          create: (context) => LoginScreenProvider(),
        ),
        ChangeNotifierProvider<RegisterScreenProvider>(
          create: (context) => RegisterScreenProvider(),
        ),
        ChangeNotifierProvider<ChangeGender>(
          create: (context) => ChangeGender(),
        ),
        ChangeNotifierProvider<DrawerProvider>(
          create: (context) => DrawerProvider(),
        ),
        ChangeNotifierProvider<TableCategoryProvider>(
          create: (context) => TableCategoryProvider(),
        ),
        ChangeNotifierProvider<TableDetailProvider>(
          create: (context) => TableDetailProvider(),
        ),
        ChangeNotifierProvider<RatingProvider>(
          create: (context) => RatingProvider(),
        ),
        ChangeNotifierProvider<ForgotProvider>(
          create: (context) => ForgotProvider(),
        ),
        ChangeNotifierProvider<MyAccountProvider>(
          create: (context) => MyAccountProvider(),
        ),
        ChangeNotifierProvider<AddToCartProvider>(
          create: (context) => AddToCartProvider(),
        ),
        ChangeNotifierProvider<EditProfileProvider>(
          create: (context) => EditProfileProvider(),
        ),
        ChangeNotifierProvider<ResetPasswordProvider>(
          create: (context) => ResetPasswordProvider(),
        ),
        ChangeNotifierProvider<ListCartProvider>(
          create: (context) => ListCartProvider(),
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
      ],
      child: NeoStore(isUserLoggedIn: isUserLoggedIn),
    ),
  );
}

class NeoStore extends StatefulWidget {
  final bool? isUserLoggedIn;

  NeoStore({this.isUserLoggedIn});

  @override
  _NeoStoreState createState() => _NeoStoreState(isUserLoggedIn);
}

class _NeoStoreState extends State<NeoStore> {
  bool? isUserLoggedIn;

  _NeoStoreState(this.isUserLoggedIn);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: ConstantStrings.neoStore,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: OrderDetailView(),
      home: (isUserLoggedIn == false) ? LoginScreen() : HomeScreen(),
    );
  }
}
