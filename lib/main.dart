import 'package:flutter/material.dart';
import 'package:neostore/data/widget/drawer/drawer_view_model.dart';
import 'package:neostore/data/widget/drawer/menu_dashboard_screen.dart';
import 'package:neostore/data/widget/radio_button.dart';
import 'package:neostore/presentation/login/login_view.dart';
import 'package:neostore/presentation/login/login_viewmodel.dart';
import 'package:neostore/presentation/product_listing/product_listing.dart';
import 'package:neostore/presentation/register/register_viewmodel.dart';
import 'package:neostore/presentation/store_locator/store_locator_view.dart';
import 'package:neostore/utils/constant_strings.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

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
        )
      ],
      child: NeoStore(),
    ),
  );
}

class NeoStore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: ConstantStrings.neoStore,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StoreLocator(),
    );
  }
}
