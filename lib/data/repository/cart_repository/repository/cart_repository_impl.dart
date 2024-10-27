import 'package:dartz/dartz.dart';
import 'package:shop_cart/domain/entities/general_failures.dart';
import 'package:shop_cart/domain/entities/get_cart_response_entity.dart';
import 'package:shop_cart/domain/repository/data_source/cart_remote_data_source_contract.dart';
import 'package:shop_cart/domain/repository/repository/cart_repository_contract.dart';

class CartRepositoryImpl extends CartRepositoryContract{
  CartRemoteDataSourceContract cartRemoteDataSourceContract;
  CartRepositoryImpl({required this.cartRemoteDataSourceContract});
  @override
  Future<Either<GeneralFailures, GetCartResponseEntity>> getCart() {

  return cartRemoteDataSourceContract.getCart();
  }

  @override
  Future<Either<GeneralFailures, GetCartResponseEntity>> deleteItemInCart(String productId) {
    return cartRemoteDataSourceContract.deleteItemInCart( productId);

  }

  @override
  Future<Either<GeneralFailures, GetCartResponseEntity>> updateCountInCart(String productId, String count) {
   return cartRemoteDataSourceContract.updateCountInCart(productId, count);
  }




}