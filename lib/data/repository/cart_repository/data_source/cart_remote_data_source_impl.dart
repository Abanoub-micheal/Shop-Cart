import 'package:dartz/dartz.dart';
import 'package:shop_cart/data/api/api_manager.dart';
import 'package:shop_cart/domain/entities/general_failures.dart';
import 'package:shop_cart/domain/entities/get_cart_response_entity.dart';
import 'package:shop_cart/domain/repository/data_source/cart_remote_data_source_contract.dart';


class CartRemoteDataSourceImpl extends CartRemoteDataSourceContract{
 ApiManager apiManager;
 CartRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<Either<GeneralFailures, GetCartResponseEntity>> getCart() async{
  var either=await apiManager.getCart();
  return either.fold((l) {
    return left(GeneralFailures(errorMessage: l.errorMessage));
  }, (response) {
    return right(response);
  },);

  }

  @override
  Future<Either<GeneralFailures, GetCartResponseEntity>> deleteItemInCart(String productId) async{
   var either=await apiManager.deleteItemInCart(productId);
   return either.fold((l) {
    return left(GeneralFailures(errorMessage: l.errorMessage));
   }, (response) {
    return right(response);
   },);

  }

  @override
  Future<Either<GeneralFailures, GetCartResponseEntity>> updateCountInCart(String productId, String count) async{
   var either=await apiManager.upDateCountInCart(productId,count);
   return either.fold((l) {
    return left(GeneralFailures(errorMessage: l.errorMessage));
   }, (response) {
    return right(response);
   },);
  }
  

}