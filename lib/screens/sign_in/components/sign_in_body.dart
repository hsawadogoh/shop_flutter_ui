import 'package:e_commerce_flutter_ui/components/custom_suffix_icon.dart';
import 'package:e_commerce_flutter_ui/components/default_button.dart';
import 'package:e_commerce_flutter_ui/constants.dart';
import 'package:e_commerce_flutter_ui/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignInBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenHeight(20)),
            child: Column(
              children: [
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
                SignForm()
              ],
            ),
          ),
        ),
    );
  }

}

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  List<String> errors = [];
  @override
  Widget build(BuildContext context) {
    errors.add("Demo error");
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            hintText: "Enter your email",
            labelText: "Email",
            suffixIcon: "assets/icons/Mail.svg",
            obscureText: false,
            changed: (value) {},
            validate: (value) {
              if (value.isEmpty) {
                setState(() {
                  errors.add("Please enter your email");
                });
              }
              return null;
            },
          ),
          SizedBox(height: getProportionateScreenHeight(20),),
          CustomTextFormField(
            hintText: "Enter your password",
            labelText: "Password",
            suffixIcon: "assets/icons/Lock.svg",
            obscureText: true,
            changed: (value) {},
            validate: (value) {
              if (value.isEmpty) {
                setState(() {
                  errors.add("Please enter your password");
                });
              }
              return null;
            },
          ),
          SizedBox(height: getProportionateScreenHeight(20),),
          Row(
            children: [
              SvgPicture.asset(
                  "assets/icons/Error.svg",
                width: getProportionateScreenWidth(14),
                height: getProportionateScreenHeight(14),
              ),
              SizedBox(width: getProportionateScreenWidth(10),),
              Text(
                errors[0],
              )
            ],
          ),
          DefaultButton(
            text: "Continuer",
            press: () {},
          )
        ],
      ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key key,
    @required this.hintText,
    @required this.labelText,
    @required this.changed,
    @required this.validate,
    @required this.suffixIcon, this.obscureText = false,
  }) : super(key: key);
  final String hintText;
  final String labelText;
  final Function changed;
  final Function validate;
  final String suffixIcon;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: changed,
      validator: validate,
      obscureText: obscureText,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(
          suffixIcon: suffixIcon,
        )
      ),
    );
  }
}
