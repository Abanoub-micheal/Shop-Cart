import 'package:flutter/material.dart';
import 'package:shop_cart/ui/Utils/my_theme.dart';
import 'package:shop_cart/ui/views/cart/cart_view.dart';
import 'package:shop_cart/ui/widgets/custom_text_field.dart';

class CustomSearchWithShoppingCart extends StatelessWidget {
  const CustomSearchWithShoppingCart({super.key,required this.numOfItems});
  final String numOfItems;


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 15,),
        Expanded(child: CustomTextField()),
        Padding(
          padding: const EdgeInsets.only(right: 15,left: 15),
          child: InkWell(onTap: () {
            Navigator.pushNamed(context, CartView.routeName);
          },child: Badge(label:Text(numOfItems),child: Image.asset('assets/icons/add-to-cart_icon.png',color: MyTheme.primaryColor,))),
        )
      ],
    );
  }
}
