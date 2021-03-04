import 'package:flutter/material.dart';

import 'custom_suffix_icon.dart';

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
