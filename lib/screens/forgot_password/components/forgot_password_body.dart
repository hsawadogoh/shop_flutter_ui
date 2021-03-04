import 'package:e_commerce_flutter_ui/screens/forgot_password/components/forgot_password_form.dart';
import 'package:e_commerce_flutter_ui/size_config.dart';
import 'package:flutter/material.dart';

class ForgotPasswordBody extends StatelessWidget {
  const ForgotPasswordBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenHeight(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'Forgot Password',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenHeight(28),
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(50),),
                Text(
                  'Please enter your email and we will generate a random passord '
                      'and send you',
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: getProportionateScreenHeight(100),),
                ForgotPasswordForm()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
