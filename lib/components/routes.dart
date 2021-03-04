

import 'package:e_commerce_flutter_ui/screens/forgot_password/forgot_password.dart';
import 'package:e_commerce_flutter_ui/screens/login_success/login_success_screen.dart';
import 'package:e_commerce_flutter_ui/screens/sign_in/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_flutter_ui/screens/splash/splash_screen.dart';


final Map <String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),

  SignInScreen.routeName: (context) => SignInScreen(),

  ForgotPassword.routeName: (context) => ForgotPassword(),

  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
};
