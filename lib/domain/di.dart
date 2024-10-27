import 'package:shop_cart/data/repository/cart_repository/data_source/cart_remote_data_source_impl.dart';
import 'package:shop_cart/data/repository/cart_repository/repository/cart_repository_impl.dart';
import 'package:shop_cart/data/repository/home_repository/data_source/home_remote_data_source_impl.dart';
import 'package:shop_cart/data/repository/home_repository/repository/home_repository_impl.dart';
import 'package:shop_cart/domain/repository/data_source/auth_remote_data_source_contract.dart';
import 'package:shop_cart/domain/repository/data_source/cart_remote_data_source_contract.dart';
import 'package:shop_cart/domain/repository/data_source/home_remote_data_source_contract.dart';
import 'package:shop_cart/domain/repository/repository/auth_repository_contract.dart';
import 'package:shop_cart/domain/repository/repository/cart_repository_contract.dart';
import 'package:shop_cart/domain/repository/repository/home_repository_contract.dart';
import 'package:shop_cart/domain/use_cases/add_to_cart_use_case.dart';
import 'package:shop_cart/domain/use_cases/delete_item_in_cart_use_case.dart';
import 'package:shop_cart/domain/use_cases/get_all_brands_use_case.dart';
import 'package:shop_cart/domain/use_cases/get_all_categories_use_case.dart';
import 'package:shop_cart/domain/use_cases/get_all_products_use_case.dart';
import 'package:shop_cart/domain/use_cases/get_cart_use_case.dart';
import 'package:shop_cart/domain/use_cases/register_use_case.dart';
import 'package:shop_cart/domain/use_cases/sign_in_use_case.dart';
import 'package:shop_cart/domain/use_cases/up_date_count_in_cart_use_case.dart';
import '../data/api/api_manager.dart';
import '../data/repository/auth_repository/data_source/auth_remote_data_source_impl.dart';
import '../data/repository/auth_repository/repository/auth_repository_impl.dart';

SignInUseCase injectSignInUseCase(){
  return SignInUseCase(injectAuthRepository());
}
RegisterUseCase injectRegisterUseCase(){
  return RegisterUseCase(injectAuthRepository());
}
AuthRepositoryContract injectAuthRepository(){
  return AuthRepositoryImpl(remoteDataSource: injectAuthRemoteDataSource());
}
AuthRemoteDataSourceContract injectAuthRemoteDataSource( ){
  return AuthRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}
GetAllCategoriesUseCase injectGetAllCategoriesUseCase(){

  return GetAllCategoriesUseCase(homeRepository: injectHomeRepository());
}
HomeRepositoryContract injectHomeRepository(){
 return HomeRepositoryImpl(homeRemoteDataSource: injectHomeRemoteDataSource());

}
HomeRemoteDataSourceContract injectHomeRemoteDataSource(){

 return HomeRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}
GetAllBrandsUseCase injectGetAllBrandsUseCase(){
  return GetAllBrandsUseCase(homeRepository: injectHomeRepository());

}
GetAllProductsUseCase injectGetAllProductsUseCase(){

  return GetAllProductsUseCase(homeRepository: injectHomeRepository());
}
AddToCartUseCase injectAddToCartUseCase() {
  return AddToCartUseCase(repositoryContract: injectHomeRepository());
}
GetCartUseCase injectGetCartUseCase(){

  return GetCartUseCase(repositoryContract: injectCartRepositoryContract());
}
CartRepositoryContract injectCartRepositoryContract(){

  return CartRepositoryImpl(cartRemoteDataSourceContract: injectCartRemoteDataSourceContract());
}
CartRemoteDataSourceContract injectCartRemoteDataSourceContract(){
  return CartRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}
DeleteItemInCartUseCase injectDeleteItemInCartUseCase(){

  return DeleteItemInCartUseCase(cartRepositoryContract: injectCartRepositoryContract());
}
UpDateCountInCartUseCase injectUpDateCountInCart(){

  return UpDateCountInCartUseCase(cartRepositoryContract: injectCartRepositoryContract());
}