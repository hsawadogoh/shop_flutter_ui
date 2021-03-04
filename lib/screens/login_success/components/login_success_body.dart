import 'package:e_commerce_flutter_ui/components/default_button.dart';
import 'package:e_commerce_flutter_ui/size_config.dart';
import 'package:flutter/material.dart';

class LoginSuccessBody extends StatefulWidget {
  @override
  _LoginSuccessBodyState createState() => _LoginSuccessBodyState();
}

class _LoginSuccessBodyState extends State<LoginSuccessBody> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
        width: double.infinity,
        child: Column(
        children: [
          SizedBox(
            height: SizeConfig.screenWidth * 0.04,
          ),
          Image.asset(
              "assets/images/success.png",
            height: SizeConfig.screenHeight * 0.4,
          ),
          SizedBox(
            height: SizeConfig.screenWidth * 0.08,
          ),
          Text(
            'Login success',
            style: TextStyle(
              color: Colors.black,
              fontSize: getProportionateScreenHeight(30),
              fontWeight: FontWeight.bold
            ),
          ),
          Spacer(),
          SizedBox(
            width: SizeConfig.screenWidth * 0.6,
            child: DefaultButton(
              text: 'Bock to Home',
              press: () {},
            )
          ),
          Spacer(),
        ],
      ),
    ),
    );
  }
}
