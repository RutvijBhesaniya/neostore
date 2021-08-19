import 'package:flutter/material.dart';
import 'package:neostore/data/widget/radio_button.dart';
import 'package:neostore/presentation/home/drawer_viewmodel.dart';
import 'package:neostore/presentation/home/home_viewmodel.dart';
import 'package:neostore/presentation/login/login_view.dart';
import 'package:neostore/presentation/login/login_viewmodel.dart';
import 'package:neostore/presentation/product_detailed/table_detail_view.dart';
import 'package:neostore/presentation/product_detailed/table_detail_viewmodel.dart';
import 'package:neostore/presentation/register/register_viewmodel.dart';
import 'package:neostore/presentation/table_category/table_category_view.dart';
import 'package:neostore/presentation/table_category/table_category_viewmodel.dart';
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
        ),
        ChangeNotifierProvider<TableCategoryProvider>(
          create: (context) => TableCategoryProvider(),
        ),
        ChangeNotifierProvider<TableDetailProvider>(
          create: (context) => TableDetailProvider(),
        ),

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
      home: TableCategoryView(),
    );
  }
}
