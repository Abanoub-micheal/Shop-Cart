import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_cart/ui/Utils/my_theme.dart';
import 'package:shop_cart/ui/views/home/tabs/home_tab/home_tab_states.dart';
import 'package:shop_cart/ui/views/home/tabs/home_tab/home_tab_view_model.dart';
import 'package:shop_cart/ui/widgets/custom_search_with_shopping_cart.dart';
import '../../../../../domain/di.dart';
import '../../../../widgets/announcement_slider.dart';
import '../../../../widgets/category_grid_view_widget.dart';
import '../../../../widgets/custom_text_field.dart';

class HomeTab extends StatelessWidget {
  HomeTab({super.key});

  final HomeTabViewModel viewModel = HomeTabViewModel(
      getAllBrandsUseCase: injectGetAllBrandsUseCase(),
      getAllCategoriesUseCase: injectGetAllCategoriesUseCase());

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeTabViewModel, HomeTabStates>(
        bloc: viewModel
          ..getCategories()
          ..getBrands(),
        listener: (context, state) {},
        builder: (context, state) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30, bottom: 15),
                    child: Image.asset(
                      'assets/images/logo splash.jpg',
                      width: 150,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(child: CustomTextField()),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 15, right: 15, left: 15),
                    child: AnnouncementSlider(),
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        'Categories',
                        style: TextStyle(color: MyTheme.primaryColor),
                      ),
                      const Spacer(),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            'view all',
                            style: TextStyle(
                                color: MyTheme.primaryColor, fontSize: 15),
                          )),
                    ],
                  ),
                  const SizedBox(width: 15),
                  state is HomeTabLoadingState
                      ? Center(
                          child: CircularProgressIndicator(
                            color: MyTheme.primaryColor,
                          ),
                        )
                      : GridViewWidget(list: viewModel.categoriesList),
                  const SizedBox(width: 15),
                  Row(
                    children: [
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        'Brands',
                        style: TextStyle(color: MyTheme.primaryColor),
                      ),
                      const Spacer(),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            'view all',
                            style: TextStyle(
                                color: MyTheme.primaryColor, fontSize: 15),
                          )),
                    ],
                  ),
                  state is HomeTabLoadingState
                      ? Center(
                          child: CircularProgressIndicator(
                            color: MyTheme.primaryColor,
                          ),
                        )
                      : GridViewWidget(list: viewModel.brandsList),
                ],
              ),
            ),
          );
        });
  }
}
