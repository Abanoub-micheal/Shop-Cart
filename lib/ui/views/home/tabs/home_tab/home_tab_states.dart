import 'package:shop_cart/domain/entities/general_failures.dart';

sealed class HomeTabStates {}

class HomeTabInitialState extends HomeTabStates {}

class HomeTabLoadingState extends HomeTabStates {}

class HomeTabErrorState extends HomeTabStates {
  GeneralFailures error;
  HomeTabErrorState({required this.error});
}

class HomeTabSuccessState extends HomeTabStates {

}
