import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_cart/ui/views/home/home_states.dart';
import 'package:shop_cart/ui/views/home/tabs/favorite_tab/favorite_tab.dart';
import 'package:shop_cart/ui/views/home/tabs/home_tab/home_tab.dart';
import 'package:shop_cart/ui/views/home/tabs/product_list_tab/product_list_tab.dart';
import 'package:shop_cart/ui/views/home/tabs/profile_tab/profile_tab.dart';

class HomeViewModel extends Cubit<HomeStates>{
  HomeViewModel():super(HomeInitialState());

  int selectIndex = 2;
  List<Widget> tabs = [
    HomeTab(),
    ProductListTab(),
    FavoriteTab(),
    ProfileTab()
  ];
  
  void changeBottomNavIndex(int newSelectIndex){
    emit(HomeInitialState());
    selectIndex=newSelectIndex;
    emit(HomeChangeBottomNavBar());
  }



}