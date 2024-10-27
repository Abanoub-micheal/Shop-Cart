import 'package:dartz/dartz.dart';
import 'package:shop_cart/data/api/api_manager.dart';
import 'package:shop_cart/domain/entities/add_to_cart_response_entity.dart';
import 'package:shop_cart/domain/entities/general_failures.dart';
import 'package:shop_cart/domain/entities/product_response_entity.dart';
import 'package:shop_cart/domain/repository/data_source/home_remote_data_source_contract.dart';
import '../../../../domain/entities/category_or_brand_response_entity/category_or_brand_response_entity.dart';


class HomeRemoteDataSourceImpl implements HomeRemoteDataSourceContract {
  ApiManager apiManager;
  HomeRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<Either<GeneralFailures, CategoryOrBrandResponseEntity>>
      getAllCategories() async {
    var either = await apiManager.getAllCategories();
    return either.fold(
      (l) {
       return left(GeneralFailures(errorMessage: l.errorMessage));
      },
      (response) {
       return right(response);
      },
    );
  }

  @override
  Future<Either<GeneralFailures, CategoryOrBrandResponseEntity>> getAllBrands()async {
   var either=await apiManager.getAllBrands();
   return either.fold((l) {
     return left(GeneralFailures(errorMessage: l.errorMessage));
   }, (response) {
     return right(response);
   },);

  }

  @override
  Future<Either<GeneralFailures, ProductResponseEntity>> getAllProducts()async{
   var either = await apiManager.getAllProducts();
   return either.fold((l) {
     return Left(GeneralFailures(errorMessage: l.errorMessage));
   }, (response) {
     return right(response);
   },);
  }

  @override
  Future<Either<GeneralFailures, AddToCartResponseEntity>> addToCart(String productId) async{

  var either=await apiManager.addToCart(productId);
  return either.fold((l) {
    return left(GeneralFailures(errorMessage: l.errorMessage));

  }, (response) {
    return right(response);
  },);

  }
}
