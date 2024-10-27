import 'package:dartz/dartz.dart';
import 'package:shop_cart/domain/entities/general_failures.dart';
import 'package:shop_cart/domain/entities/product_response_entity.dart';
import 'package:shop_cart/domain/repository/repository/home_repository_contract.dart';

class GetAllProductsUseCase {

  HomeRepositoryContract homeRepository;
  GetAllProductsUseCase({required this.homeRepository});

  Future<Either<GeneralFailures,ProductResponseEntity>>invoke(){

    return homeRepository.getAllProducts();
  }



}