import 'package:e_commerce_flutter_ui/components/routes.dart';
import 'package:e_commerce_flutter_ui/components/splash_content.dart';
import 'package:e_commerce_flutter_ui/constants.dart';
import 'package:e_commerce_flutter_ui/screens/sign_in/sign_in.dart';
import 'package:e_commerce_flutter_ui/size_config.dart';
import 'package:flutter/material.dart';

import 'default_button.dart';

class Body extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Body();
  }

}

class _Body extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashs = [
    {
      "image" : "assets/images/splash_1.png",
      "text" : "Welcome to TOKOTO, let's shop !"
    },
    {
      "image" : "assets/images/splash_2.png",
      "text" : "We help people connect with store \n arround BURKINA FASO"
    },
    {
      "image" : "assets/images/splash_3.png",
      "text" : "We show the easy way to shop"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Expanded(
                  flex: 3,
                  child: PageView.builder(
                    onPageChanged: (value) {
                      setState(() {
                        currentPage = value;
                      });
                    },
                    itemCount: splashs.length,
                    itemBuilder: (context, index)
                    => SplashContent(
                      image: splashs[index]["image"],
                      text: splashs[index]["text"],
                    ),
                  )
              ),
              Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20)
                    ),
                    child: Column(
                      children: [
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                              splashs.length,
                                  (index) => buildDot(index: index)),
                        ),
                        Spacer(flex: 3,),
                        DefaultButton(
                          text: 'Continuer',
                          press: () {
                            Navigator.pushNamed(context, SignInScreen.routeName);
                          },
                        ),
                        Spacer()
                      ],
                    ),
                  )
              )
            ],
          ),
        )
    );
  }

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
          color: currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
          borderRadius: BorderRadius.circular(3)
      ),
    );
  }

}
