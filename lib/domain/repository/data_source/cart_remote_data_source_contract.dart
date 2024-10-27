import 'package:dartz/dartz.dart';
import 'package:shop_cart/domain/entities/general_failures.dart';
import 'package:shop_cart/domain/entities/get_cart_response_entity.dart';

abstract class CartRemoteDataSourceContract{

  Future<Either<GeneralFailures,GetCartResponseEntity>> getCart();
  Future<Either<GeneralFailures,GetCartResponseEntity>> deleteItemInCart(String productId);
  Future<Either<GeneralFailures,GetCartResponseEntity>> updateCountInCart(String productId,String count);

}