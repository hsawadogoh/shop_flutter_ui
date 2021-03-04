import 'package:flutter/material.dart';

import 'components/forgot_password_body.dart';

class ForgotPassword extends StatelessWidget {
  static String routeName = '/forgot_password';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Forgot password'
        ),
      ),
      body: ForgotPasswordBody(),
    );
  }

}
