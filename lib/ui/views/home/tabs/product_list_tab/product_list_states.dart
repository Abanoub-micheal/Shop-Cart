import 'package:shop_cart/domain/entities/add_to_cart_response_entity.dart';
import 'package:shop_cart/domain/entities/general_failures.dart';

abstract class ProductListStates{}

class ProductListInitialState extends ProductListStates{}
class ProductListLoadingState extends ProductListStates{
  String loadingMessage;
  ProductListLoadingState({required this.loadingMessage});
}
class ProductListErrorState extends ProductListStates{
  GeneralFailures errorMessage;
  ProductListErrorState({required this.errorMessage});
}
class ProductListSuccessState extends ProductListStates{}



class AddToCartLoadingState extends ProductListStates{
  String loadingMessage;
  AddToCartLoadingState({required this.loadingMessage});
}
class AddToCartErrorState extends ProductListStates{
  GeneralFailures errorMessage;
  AddToCartErrorState({required this.errorMessage});
}
class AddToCartSuccessState extends ProductListStates{


}