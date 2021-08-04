import 'package:flutter/material.dart';
import 'package:neostore/presentation/LoginScreen/login_screen.dart';
import 'package:neostore/presentation/MyAccount/my_account.dart';
import 'package:neostore/presentation/RegisterScreen/register_screen.dart';
import 'package:neostore/presentation/ResetPassword/reset_password.dart';
import 'package:neostore/utils/constant_strings.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: ConstantStrings.neoStore,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ResetPassword(),
    );
  }
}
