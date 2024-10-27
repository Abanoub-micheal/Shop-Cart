import 'package:dartz/dartz.dart';
import 'package:shop_cart/domain/repository/repository/cart_repository_contract.dart';
import '../entities/general_failures.dart';
import '../entities/get_cart_response_entity.dart';

class DeleteItemInCartUseCase{
  CartRepositoryContract cartRepositoryContract;
  DeleteItemInCartUseCase({required this.cartRepositoryContract});

  Future<Either<GeneralFailures, GetCartResponseEntity>> invoke(String productId){
    return cartRepositoryContract.deleteItemInCart(productId);

  }


}