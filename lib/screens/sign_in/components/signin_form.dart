import 'package:e_commerce_flutter_ui/components/custom_suffix_icon.dart';
import 'package:e_commerce_flutter_ui/components/default_button.dart';
import 'package:e_commerce_flutter_ui/components/form_error.dart';
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
              Text(
                'Forgot password',
                style: TextStyle(
                    decoration: TextDecoration.underline
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

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key key,
    @required this.hintText,
    @required this.labelText,
    @required this.changed,
    @required this.validate,
    @required this.suffixIcon, this.obscureText = false,@required this.saved,
  }) : super(key: key);
  final String hintText;
  final String labelText;
  final Function changed;
  final Function validate;
  final Function saved;
  final String suffixIcon;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: changed,
      validator: validate,
      obscureText: obscureText,
      onSaved: saved,
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
