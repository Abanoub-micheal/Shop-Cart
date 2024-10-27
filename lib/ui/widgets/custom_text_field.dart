import 'package:flutter/material.dart';
import 'package:shop_cart/ui/Utils/my_theme.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(cursorColor: MyTheme.primaryColor,
      decoration: InputDecoration(hintText: 'what do you search for?',
        prefixIcon: Padding(
          padding:  EdgeInsets.only(left: 10,right: 10),
          child: Icon(Icons.search,size: 40,),
        ),
        prefixIconColor: MyTheme.primaryColor,
        enabledBorder:OutlineInputBorder(borderRadius: BorderRadius.circular(60),
          borderSide: BorderSide(color: MyTheme.primaryColor),
        ), 
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide(color: MyTheme.primaryColor),
        ),
      ),
    );
  }
}
