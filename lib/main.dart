import 'package:e_commerce_flutter_ui/components/routes.dart';
import 'package:e_commerce_flutter_ui/constants.dart';
import 'package:e_commerce_flutter_ui/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

import 'components/theme_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ecommerce Flutter UI',
      debugShowCheckedModeBanner: false,
      theme: theme(),
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
