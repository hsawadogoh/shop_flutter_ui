import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../size_config.dart';

class SocialContainer extends StatelessWidget {
  const SocialContainer({
    Key key,
    @required this.logo,
    @required this.press,
  }) : super(key: key);
  final String logo;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        padding: EdgeInsets.all(getProportionateScreenWidth(12)),
        margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
        height: getProportionateScreenWidth(40),
        width: getProportionateScreenHeight(40),
        decoration: BoxDecoration(
            color: Color(0xFFF5F6F9),
            shape: BoxShape.circle
        ),
        child: SvgPicture.asset(logo),
      ),
    );
  }
}
