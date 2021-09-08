import 'dart:async';

import 'package:flutter/material.dart';
import 'package:neostore/presentation/home/home_view.dart';
import 'package:neostore/presentation/login/login_view.dart';
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
      backgroundColor: ColorStyles.yellow,
      body: Center(
        child: Container(
          child: CircleAvatar(
            backgroundColor: ColorStyles.white,
            radius: 50,
            child: Icon(
              Icons.movie,
              color: Colors.red,
            ),
          ),
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
