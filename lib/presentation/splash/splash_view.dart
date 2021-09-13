import 'dart:async';

import 'package:flutter/material.dart';
import 'package:neostore/presentation/home/home_view.dart';
import 'package:neostore/presentation/login/login_view.dart';
import 'package:neostore/presentation/widget/neostore_title.dart';
import 'package:neostore/utils/constant_strings.dart';
import 'package:neostore/utils/shared_preferences/memory_management.dart';
import 'package:neostore/utils/style.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var isUserLoggedIn = MemoryManagement.getIsUserLoggedIn() ?? false;

  _SplashScreenState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorStyles.red,
      body: Center(
        child: NeoStoreTitle(
            text: ConstantStrings.neoStore,
            style: TextStyles.largeHeadline?.copyWith(
                color: ColorStyles.white, fontWeight: FontWeight.w400)

        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 4),
      () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              (isUserLoggedIn == false) ? LoginScreenView() : HomeScreen(),
        ),
      ),
    );
  }
}
