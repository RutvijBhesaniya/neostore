import 'package:flutter/material.dart';
import 'package:neostore/data/widget/radio_button.dart';
import 'package:neostore/presentation/edit_profile/edit_profile_view.dart';
import 'package:neostore/presentation/home/drawer_viewmodel.dart';
import 'package:neostore/presentation/home/home_view.dart';
import 'package:neostore/presentation/login/login_view.dart';
import 'package:neostore/presentation/login/login_viewmodel.dart';
import 'package:neostore/presentation/my_account/my_account.dart';
import 'package:neostore/presentation/product_detailed/table_detail_viewmodel.dart';
import 'package:neostore/presentation/register/register_viewmodel.dart';
import 'package:neostore/presentation/reset_password/reset_password_view.dart';
import 'package:neostore/presentation/table_category/table_category_viewmodel.dart';
import 'package:neostore/utils/constant_strings.dart';
import 'package:neostore/utils/shared_preferences/memory_management.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MemoryManagement.init();

  var isUserLoggedIn = MemoryManagement.getIsUserLoggedIn() ?? false;

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
        fontFamily: 'Gotham'
      ),
      home: ResetPassword(),
      // home: (isUserLoggedIn!) ? LoginScreen() : MyAccount(),
    );
  }
}
