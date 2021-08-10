
import 'package:flutter/material.dart';
import 'package:neostore/data/widget/radiobutton.dart';
import 'package:neostore/presentation/LoginScreen/login_screen.dart';
import 'package:neostore/presentation/loginScreen/login_screen_view_model.dart';
import 'package:neostore/presentation/registerScreen/register_screen.dart';
import 'package:neostore/presentation/registerScreen/register_screen_view_model.dart';
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
        ChangeNotifierProvider<ChangeColorModel>(
          create: (context) => ChangeColorModel(),
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
      home: LoginScreen(),
    );
  }
}
