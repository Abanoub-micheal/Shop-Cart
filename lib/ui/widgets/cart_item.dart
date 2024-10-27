import 'package:flutter/material.dart';
import 'package:shop_cart/ui/views/cart/cart_view_model.dart';
import '../../domain/entities/get_cart_response_entity.dart';
import '../Utils/my_theme.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.productsCart});
  final GetProductsCartEntity productsCart;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 113,
      width: 398,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: MyTheme.primaryColor)),
      child: Row(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                productsCart.product?.imageCover??'',
                fit: BoxFit.fill,
                height: 113,
                width: 120,
              )),
          Expanded(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          productsCart.product?.title??'',maxLines: 2,
                          style: TextStyle(color: MyTheme.primaryColor,),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          CartViewModel.get(context).deleteItemInCart(productsCart.product?.id??'');
                        },
                        child: Icon(
                          Icons.delete_outline,
                          color: MyTheme.primaryColor,
                        ),
                      )
                    ],
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('EGP ${productsCart.price.toString()}',
                          style: TextStyle(color: MyTheme.primaryColor)),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: MyTheme.primaryColor),
                        child: Row(
                          children: [
                            InkWell(
                                onTap: () {
                                  var counter =productsCart.count??0;
                                  counter--;
                                  CartViewModel.get(context).upDateCountInCart(productsCart.product?.id??'', counter.toString());


                                },
                                child: Image.asset(
                                    'assets/icons/icon_subtract.png')),
                            const SizedBox(
                              width: 15,
                            ),
                            Text(
                              productsCart.count.toString(),
                              style: const TextStyle(color: Colors.white),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            InkWell(
                                onTap: () {
                                  var counter =productsCart.count??0;
                                  counter++;
                                  CartViewModel.get(context).upDateCountInCart(productsCart.product?.id??'', counter.toString());
                                },
                                child:
                                    Image.asset('assets/icons/icon_plus.png')),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
