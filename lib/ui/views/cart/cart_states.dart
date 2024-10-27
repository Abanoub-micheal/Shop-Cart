import 'package:shop_cart/domain/entities/general_failures.dart';
import 'package:shop_cart/domain/entities/get_cart_response_entity.dart';

abstract class CartStates{
}
class GetCartInitialStates extends CartStates{
}
class GetCartLoadingStates extends CartStates{
  String loadingMessage;
  GetCartLoadingStates({required this.loadingMessage});
}
class GetCartErrorStates extends CartStates{
  GeneralFailures errorMessage;
  GetCartErrorStates({required this.errorMessage});
}
class GetCartSuccessStates extends CartStates{
  GetCartResponseEntity getCartResponseEntity;
GetCartSuccessStates({required this.getCartResponseEntity});
}
class DeleteItemInCartInitialStates extends CartStates{
}
class DeleteItemInCartLoadingStates extends CartStates{
  String loadingMessage;
  DeleteItemInCartLoadingStates({required this.loadingMessage});
}
class DeleteItemInCartErrorStates extends CartStates{
  GeneralFailures errorMessage;
  DeleteItemInCartErrorStates({required this.errorMessage});
}
class DeleteItemInCartSuccessStates extends CartStates{
  GetCartResponseEntity getCartResponseEntity;
  DeleteItemInCartSuccessStates({required this.getCartResponseEntity});
}
class UpDateCountInCartErrorStates extends CartStates{
  GeneralFailures errorMessage;
  UpDateCountInCartErrorStates({required this.errorMessage});
}
class UpDateCountInCartSuccessStates extends CartStates{
  GetCartResponseEntity getCartResponseEntity;
  UpDateCountInCartSuccessStates({required this.getCartResponseEntity});
}