import 'package:flutter/material.dart';

import '../Utils/my_theme.dart';

typedef Validator = String? Function(String?);
class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, required this.validator, required this.hintText, this.suffixIcon, this.obscure=false, required this.controller, this.keyboardType,});
  final Validator? validator;
  final String hintText;
  final Widget? suffixIcon;
 final bool obscure;
 final TextEditingController controller;
 final TextInputType? keyboardType;
 final AutovalidateMode autoValidateMode=AutovalidateMode.onUserInteraction;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode:autoValidateMode ,
      autocorrect:true ,
      keyboardType: keyboardType,
      controller:controller ,
      obscureText:obscure,
      validator: validator,
      cursorColor: MyTheme.primaryColor,
      decoration: InputDecoration(
          suffixIcon: suffixIcon,
          hintText: hintText,
          errorBorder:
              const OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
          enabledBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(10),),
          focusedBorder:  OutlineInputBorder( borderRadius: BorderRadius.circular(10),),
          hintStyle: const TextStyle(color: Colors.grey)),

    );
  }
}
