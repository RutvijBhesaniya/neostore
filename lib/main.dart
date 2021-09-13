import 'package:flutter/material.dart';
import 'package:neostore/di/providers.dart';
import 'package:neostore/presentation/splash/splash_view.dart';
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
