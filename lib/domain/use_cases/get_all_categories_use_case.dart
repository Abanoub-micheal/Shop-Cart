import 'package:dartz/dartz.dart';
import 'package:shop_cart/domain/entities/general_failures.dart';
import 'package:shop_cart/domain/repository/repository/home_repository_contract.dart';
import '../entities/category_or_brand_response_entity/category_or_brand_response_entity.dart';

class GetAllCategoriesUseCase{
  HomeRepositoryContract homeRepository;
  GetAllCategoriesUseCase({required this.homeRepository});

  Future<Either<GeneralFailures,CategoryOrBrandResponseEntity>> invoke(){
    return homeRepository.getAllCategories();
  }

}