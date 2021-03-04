import 'package:e_commerce_flutter_ui/components/custom_text_form_field.dart';
import 'package:e_commerce_flutter_ui/components/default_button.dart';
import 'package:e_commerce_flutter_ui/components/dont_have_account.dart';
import 'package:e_commerce_flutter_ui/components/form_error.dart';
import 'package:e_commerce_flutter_ui/constants.dart';
import 'package:flutter/material.dart';

import '../../../size_config.dart';

class ForgotPasswordForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ForgotPasswordForm();
  }

}

class _ForgotPasswordForm extends State<ForgotPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  List<String> errors = [];
  String email;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
        child: Column(
          children: [
            CustomTextFormField(
                hintText: 'Enter your email',
                labelText: 'Email',
                changed: (value) {
                  if (value.isNotEmpty && errors.contains(kEmailNullError)) {
                    setState(() {
                      errors.remove(kEmailNullError);
                    });
                  } else if (emailValidatorRegExp.hasMatch(value) &&
                      errors.contains(kInvalidEmailError)) {
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
                  } else if (!emailValidatorRegExp.hasMatch(value) &&
                  !errors.contains(kInvalidEmailError)) {
                    setState(() {
                      errors.add(kInvalidEmailError);
                    });
                  }
                  return null;
                },
                suffixIcon: "assets/icons/Mail.svg",
                saved: (value) => email = value,
            ),
            SizedBox(height: getProportionateScreenHeight(150),),
            FormError(errors: errors),
            SizedBox(height: getProportionateScreenHeight(10),),
            DefaultButton(
              text: 'Continuer',
              press: () {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                }
              },
            ),
            SizedBox(height: getProportionateScreenHeight(100),),
            DontHaveAccount()
          ],
        )
    );
  }

}
