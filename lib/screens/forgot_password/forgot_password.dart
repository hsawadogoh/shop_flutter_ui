import 'package:flutter/material.dart';

import 'components/forgot_password_body.dart';

class ForgotPassword extends StatelessWidget {
  static String routeName = '/forgot_password';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Forgot password'
        ),
      ),
      body: ForgotPasswordBody(),
    );
  }

}
