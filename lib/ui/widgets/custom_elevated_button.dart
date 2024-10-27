import 'package:flutter/material.dart';

import '../Utils/my_theme.dart';

typedef OnPressed =void Function()? ;
class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({super.key, required this.text, this.onPressed});
 final String text;
 final OnPressed onPressed;
  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
      onPressed:onPressed,
      style: ButtonStyle(
          backgroundColor:
          WidgetStatePropertyAll(MyTheme.primaryColor)),
      child: Text(
        text,
        style: TextStyle(color: MyTheme.whiteColor),
      ),
    );
  }
}
