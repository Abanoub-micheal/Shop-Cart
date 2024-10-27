import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_cart/ui/views/home/home_states.dart';
import 'package:shop_cart/ui/views/home/home_view_model.dart';
import 'package:shop_cart/ui/widgets/custom_bottom_navigation_bar.dart';

class HomeView extends StatelessWidget {
  static const String routeName = 'home-view';
  HomeView({super.key});

  final HomeViewModel viewModel = HomeViewModel();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeViewModel, HomeStates>(
      bloc: viewModel,
      listener: (context, state) {

      },
      builder: (context, state) {
        return Scaffold(
            bottomNavigationBar: CustomBottomNavigationBar(
                context: context,
                onTapFunction: (index) {
                  viewModel.changeBottomNavIndex(index);
                },
                selectIndex: viewModel.selectIndex),
            body: viewModel.tabs[viewModel.selectIndex]
        );
      },
    );

}
}
