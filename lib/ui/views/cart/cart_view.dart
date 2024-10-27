import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_cart/domain/di.dart';
import 'package:shop_cart/ui/Utils/my_theme.dart';
import 'package:shop_cart/ui/views/cart/cart_states.dart';
import 'package:shop_cart/ui/views/cart/cart_view_model.dart';
import 'package:shop_cart/ui/widgets/cart_item.dart';

class CartView extends StatelessWidget {
  static const String routeName = 'cart-screen';

  CartViewModel viewModel = CartViewModel(
      getCartUseCase: injectGetCartUseCase(),
      deleteItemInCartUseCase: injectDeleteItemInCartUseCase(),
      upDateCountInCartUseCase: injectUpDateCountInCart());
  CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel..getCart(),
      child: BlocBuilder<CartViewModel, CartStates>(
        builder: (context, state) {
          if (state is GetCartSuccessStates) {
            return Scaffold(
                appBar: AppBar(
                  title: Text(
                    'Cart',
                    style: TextStyle(
                        color: MyTheme.primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                  centerTitle: true,
                  iconTheme: IconThemeData(color: MyTheme.primaryColor),
                  actions: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Icon(Icons.search),
                          SizedBox(
                            width: 20,
                          ),
                          Icon(Icons.shopping_cart)
                        ],
                      ),
                    ),
                  ],
                ),
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.getCartResponseEntity.numOfCartItems,
                        itemBuilder: (BuildContext context, int index) {
                          return CartItem(
                            productsCart: state
                                .getCartResponseEntity.data!.products![index],
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Text(
                                'Total Price',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: MyTheme.primaryColor),
                              ),
                              Row(
                                children: [
                                  Text(
                                    ' EGP',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '  ${state.getCartResponseEntity.data!.totalCartPrice}',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Spacer(),
                          ElevatedButton(
                              style: ButtonStyle(
                                  fixedSize: WidgetStatePropertyAll(Size(
                                      MediaQuery.sizeOf(context).width * .6,
                                      30)),
                                  backgroundColor: WidgetStatePropertyAll(
                                      MyTheme.primaryColor)),
                              onPressed: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Check out',
                                    style: TextStyle(color: Colors.white),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Image.asset('assets/icons/Vector.png')
                                ],
                              ))
                        ],
                      ),
                    )
                  ],
                ));
          }
          if (state is DeleteItemInCartSuccessStates) {
            return Scaffold(
                appBar: AppBar(
                  title: Text(
                    'Cart',
                    style: TextStyle(
                        color: MyTheme.primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                  centerTitle: true,
                  iconTheme: IconThemeData(color: MyTheme.primaryColor),
                  actions: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Icon(Icons.search),
                          SizedBox(
                            width: 20,
                          ),
                          Icon(Icons.shopping_cart)
                        ],
                      ),
                    ),
                  ],
                ),
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.getCartResponseEntity.numOfCartItems,
                        itemBuilder: (BuildContext context, int index) {
                          return CartItem(
                            productsCart: state
                                .getCartResponseEntity.data!.products![index],
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Text(
                                'Total Price',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: MyTheme.primaryColor),
                              ),
                              Row(
                                children: [
                                  Text(
                                    ' EGP',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '  ${state.getCartResponseEntity.data!.totalCartPrice}',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Spacer(),
                          ElevatedButton(
                              style: ButtonStyle(
                                  fixedSize: WidgetStatePropertyAll(Size(
                                      MediaQuery.sizeOf(context).width * .6,
                                      30)),
                                  backgroundColor: WidgetStatePropertyAll(
                                      MyTheme.primaryColor)),
                              onPressed: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Check out',
                                    style: TextStyle(color: Colors.white),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Image.asset('assets/icons/Vector.png')
                                ],
                              ))
                        ],
                      ),
                    )
                  ],
                ));
          }
          if (state is UpDateCountInCartSuccessStates) {
            return Scaffold(
                appBar: AppBar(
                  title: Text(
                    'Cart',
                    style: TextStyle(
                        color: MyTheme.primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                  centerTitle: true,
                  iconTheme: IconThemeData(color: MyTheme.primaryColor),
                  actions: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Icon(Icons.search),
                          SizedBox(
                            width: 20,
                          ),
                          Icon(Icons.shopping_cart)
                        ],
                      ),
                    ),
                  ],
                ),
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.getCartResponseEntity.numOfCartItems,
                        itemBuilder: (BuildContext context, int index) {
                          return CartItem(
                            productsCart: state
                                .getCartResponseEntity.data!.products![index],
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Text(
                                'Total Price',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: MyTheme.primaryColor),
                              ),
                              Row(
                                children: [
                                  Text(
                                    ' EGP',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '  ${state.getCartResponseEntity.data!.totalCartPrice}',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Spacer(),
                          ElevatedButton(
                              style: ButtonStyle(
                                  fixedSize: WidgetStatePropertyAll(Size(
                                      MediaQuery.sizeOf(context).width * .6,
                                      30)),
                                  backgroundColor: WidgetStatePropertyAll(
                                      MyTheme.primaryColor)),
                              onPressed: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Check out',
                                    style: TextStyle(color: Colors.white),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Image.asset('assets/icons/Vector.png')
                                ],
                              ))
                        ],
                      ),
                    )
                  ],
                ));
          }
          else {
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  'Cart',
                  style: TextStyle(
                      color: MyTheme.primaryColor, fontWeight: FontWeight.bold),
                ),
                centerTitle: true,
                iconTheme: IconThemeData(color: MyTheme.primaryColor),
                actions: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Icon(Icons.search),
                        SizedBox(
                          width: 20,
                        ),
                        Icon(Icons.shopping_cart)
                      ],
                    ),
                  ),
                ],
              ),
              body: Center(
                  child: CircularProgressIndicator(
                color: MyTheme.primaryColor,
              )),
            );
          }
        },
      ),
    );
  }
}
