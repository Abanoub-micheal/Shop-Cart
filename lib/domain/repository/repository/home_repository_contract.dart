import 'package:dartz/dartz.dart';
import 'package:shop_cart/domain/entities/add_to_cart_response_entity.dart';
import 'package:shop_cart/domain/entities/general_failures.dart';
import 'package:shop_cart/domain/entities/product_response_entity.dart';
import '../../entities/category_or_brand_response_entity/category_or_brand_response_entity.dart';


abstract class HomeRepositoryContract{

  Future<Either<GeneralFailures,CategoryOrBrandResponseEntity>>getAllCategories();
  Future<Either<GeneralFailures,CategoryOrBrandResponseEntity>>getAllBrands();
  Future<Either<GeneralFailures,ProductResponseEntity>>getAllProducts();
  Future<Either<GeneralFailures,AddToCartResponseEntity>>addToCart(String productId);

}