import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_cart/domain/di.dart';
import 'package:shop_cart/ui/Utils/my_theme.dart';
import 'package:shop_cart/ui/views/home/product_details/product_details.dart';
import 'package:shop_cart/ui/views/home/tabs/product_list_tab/product_list_states.dart';
import 'package:shop_cart/ui/views/home/tabs/product_list_tab/product_list_view_model.dart';
import 'package:shop_cart/ui/widgets/card_category.dart';
import '../../../../widgets/custom_search_with_shopping_cart.dart';

class ProductListTab extends StatelessWidget {
  ProductListTab({super.key});

  final ProductListViewModel viewModel = ProductListViewModel(
      getAllProductsUseCase: injectGetAllProductsUseCase(),
      addToCartUseCase: injectAddToCartUseCase());

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductListViewModel>(
      create: (context) => viewModel..getProducts(),
      child: BlocConsumer<ProductListViewModel, ProductListStates>(
          listener: (context, state) {

          },
          builder: (context, state) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 63, bottom: 15),
                  child: Image.asset(
                    'assets/images/logo splash.jpg',
                    width: 150,
                  ),
                ),
                 CustomSearchWithShoppingCart(numOfItems: viewModel.numOfItems.toString() ),
                state is ProductListLoadingState ? Center(
                  child: CircularProgressIndicator(
                    color: MyTheme.primaryColor,),) :
                Expanded(
                  child: GridView.builder(
                    itemCount: viewModel.productList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 2 / 2.4,
                    ),
                    itemBuilder: (context, index) {
                      return InkWell(onTap: () {
                        Navigator.pushNamed(context, ProductDetails.routeName,
                            arguments: viewModel.productList[index]);
                      }, child: CardCategory(product: viewModel
                          .productList[index],));
                    },
                  ),
                ),
              ],
            );
          }),
    );
  }
}
