import 'package:e_commerce_flutter_ui/components/custom_suffix_icon.dart';
import 'package:e_commerce_flutter_ui/components/custom_text_form_field.dart';
import 'package:e_commerce_flutter_ui/components/default_button.dart';
import 'package:e_commerce_flutter_ui/components/form_error.dart';
import 'package:e_commerce_flutter_ui/components/routes.dart';
import 'package:e_commerce_flutter_ui/screens/forgot_password/forgot_password.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  List<String> errors = [];
  String email;
  String password;
  bool rememberMe = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            hintText: "Enter your email",
            labelText: "Email",
            suffixIcon: "assets/icons/Mail.svg",
            obscureText: false,
            saved: (newEmail) => email = newEmail,
            changed: (value) {
              if (value.isNotEmpty && errors.contains(kEmailNullError)) {
                setState(() {
                  errors.remove(kEmailNullError);
                });
              } else if (emailValidatorRegExp.hasMatch(value)
                  && errors.contains(kInvalidEmailError)) {
                setState(() {
                  errors.remove(kInvalidEmailError);
                });
              }
            },
            validate: (value) {
              if (value.isEmpty && !errors.contains(kEmailNullError)) {
                setState(() {
                  errors.add(kEmailNullError);
                });
              } else if (!emailValidatorRegExp.hasMatch(value)
                  && !errors.contains(kInvalidEmailError)) {
                setState(() {
                  errors.add(kInvalidEmailError);
                });
              }
              return null;
            },
          ),
          SizedBox(height: getProportionateScreenHeight(30),),
          CustomTextFormField(
            hintText: "Enter your password",
            labelText: "Password",
            suffixIcon: "assets/icons/Lock.svg",
            obscureText: true,
            saved: (newPassword) => password = newPassword,
            changed: (value) {
              if (value.isNotEmpty && errors.contains(kPassNullError)) {
                setState(() {
                  errors.remove(kPassNullError);
                });
              } else if (value.length >= 4 && errors.contains(kShortPassError)) {
                setState(() {
                  errors.remove(kShortPassError);
                });
              }
            },
            validate: (value) {
              if (value.isEmpty && !errors.contains(kPassNullError)) {
                setState(() {
                  errors.add(kPassNullError);
                });
              } else if (value.length < 4 && !errors.contains(kShortPassError)) {
                setState(() {
                  errors.add(kShortPassError);
                });
              }
              return null;
            },
          ),
          SizedBox(height: getProportionateScreenHeight(30),),
          Row(
            children: [
              Checkbox(
                  value: rememberMe,
                  activeColor: kPrimaryColor,
                  onChanged: (value) {
                    setState(() {
                      rememberMe = value;
                    });
                  }
              ),
              Text(
                  'Remember Me'
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, ForgotPassword.routeName);
                },
                child: Text(
                  'Forgot password',
                  style: TextStyle(
                      decoration: TextDecoration.underline
                  ),
                ),
              )
            ],
          ),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20),),
          DefaultButton(
            text: "Continuer",
            press: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
              }
            },
          )
        ],
      ),
    );
  }
}
