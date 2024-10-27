import 'package:dartz/dartz.dart';
import 'package:shop_cart/domain/entities/general_failures.dart';
import 'package:shop_cart/domain/entities/get_cart_response_entity.dart';
import 'package:shop_cart/domain/repository/repository/cart_repository_contract.dart';

class GetCartUseCase{
  CartRepositoryContract repositoryContract;
  GetCartUseCase({required this.repositoryContract});

  Future<Either<GeneralFailures,GetCartResponseEntity>>invoke(){

   return repositoryContract.getCart();

  }


}