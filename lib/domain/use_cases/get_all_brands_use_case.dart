import 'package:dartz/dartz.dart';
import 'package:shop_cart/domain/entities/category_or_brand_response_entity/category_or_brand_response_entity.dart';
import 'package:shop_cart/domain/entities/general_failures.dart';
import 'package:shop_cart/domain/repository/repository/home_repository_contract.dart';

class GetAllBrandsUseCase{
  HomeRepositoryContract homeRepository;
  GetAllBrandsUseCase({required this.homeRepository});


  Future<Either<GeneralFailures,CategoryOrBrandResponseEntity>>invoke(){
    return homeRepository.getAllBrands();

}

}