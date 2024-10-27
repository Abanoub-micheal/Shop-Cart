import 'package:dartz/dartz.dart';
import 'package:shop_cart/domain/entities/add_to_cart_response_entity.dart';
import 'package:shop_cart/domain/entities/general_failures.dart';
import 'package:shop_cart/domain/entities/product_response_entity.dart';
import 'package:shop_cart/domain/repository/data_source/home_remote_data_source_contract.dart';
import 'package:shop_cart/domain/repository/repository/home_repository_contract.dart';

import '../../../../domain/entities/category_or_brand_response_entity/category_or_brand_response_entity.dart';


class HomeRepositoryImpl implements HomeRepositoryContract{
  HomeRemoteDataSourceContract homeRemoteDataSource;
  HomeRepositoryImpl({required this.homeRemoteDataSource});
  @override
  Future<Either<GeneralFailures, CategoryOrBrandResponseEntity>> getAllCategories() {

    return homeRemoteDataSource.getAllCategories();
  }

  @override
  Future<Either<GeneralFailures, CategoryOrBrandResponseEntity>> getAllBrands() {
    return homeRemoteDataSource.getAllBrands();
  }

  @override
  Future<Either<GeneralFailures, ProductResponseEntity>> getAllProducts() {
  return homeRemoteDataSource.getAllProducts();
  }

  @override
  Future<Either<GeneralFailures, AddToCartResponseEntity>> addToCart(String productId) {
    return homeRemoteDataSource.addToCart(productId);
  }


}