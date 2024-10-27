import 'package:dartz/dartz.dart';
import 'package:shop_cart/domain/entities/add_to_cart_response_entity.dart';
import 'package:shop_cart/domain/repository/repository/home_repository_contract.dart';

import '../entities/general_failures.dart';

class AddToCartUseCase {

  HomeRepositoryContract repositoryContract;
  AddToCartUseCase({required this.repositoryContract});

  Future<Either<GeneralFailures, AddToCartResponseEntity>>  invoke(String productId){

   return repositoryContract.addToCart(productId);


  }



}