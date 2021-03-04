import 'package:e_commerce_flutter_ui/components/dont_have_account.dart';
import 'package:e_commerce_flutter_ui/components/social_container.dart';
import 'package:e_commerce_flutter_ui/screens/sign_in/components/signin_form.dart';
import 'package:e_commerce_flutter_ui/size_config.dart';
import 'package:flutter/material.dart';

class SignInBody extends StatelessWidget {
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
                  SizedBox(height: SizeConfig.screenHeight * 0.04,),
                  Text(
                    "Welcome Back",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: getProportionateScreenHeight(28),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Sign in with your email and your password \nor continue with social media",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.08,),
                  SignForm(),
                  SizedBox(height: SizeConfig.screenHeight * 0.08,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialContainer(
                        logo: "assets/icons/google-icon.svg",
                        press: () {},
                      ),
                      SocialContainer(
                        logo: "assets/icons/facebook-2.svg",
                        press: () {},
                      ),
                      SocialContainer(
                        logo: "assets/icons/twitter.svg",
                        press: () {},
                      ),
                    ],
                  ),
                  SizedBox(height: getProportionateScreenHeight(20),),
                  DontHaveAccount()
                ],
              ),
            ),
          ),
        ),
    );
  }

}
