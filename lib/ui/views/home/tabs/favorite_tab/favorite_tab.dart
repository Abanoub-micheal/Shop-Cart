import 'package:flutter/material.dart';
import 'package:shop_cart/ui/views/home/tabs/product_list_tab/widget/favorite_card.dart';

import '../../../../widgets/custom_search_with_shopping_cart.dart';

class FavoriteTab extends StatelessWidget {
  const FavoriteTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 63, bottom: 15),
          child: Image.asset(
            'assets/images/logo splash.jpg',
            width: 150,
          ),
        ),
        CustomSearchWithShoppingCart(numOfItems: ''),
        Column(children: [
          FavoriteCard()

        ],)
      ],
    );
  }
}
