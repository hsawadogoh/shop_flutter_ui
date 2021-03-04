import 'package:flutter/material.dart';

import '../constants.dart';
import '../size_config.dart';

class DontHaveAccount extends StatelessWidget {
  const DontHaveAccount({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Dont  have account ?',
          style: TextStyle(
              fontSize: getProportionateScreenWidth(16)
          ),
        ),
        Text(
          'Sign up',
          style: TextStyle(
              fontSize: getProportionateScreenWidth(16),
              color: kPrimaryColor
          ),
        )
      ],
    );
  }
}
