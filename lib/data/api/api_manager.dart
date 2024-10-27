import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:shop_cart/data/model/response/get_cart_response_dto.dart';
import 'package:shop_cart/data/model/response/product_response_dto.dart';
import 'package:shop_cart/ui/Utils/api_constants.dart';
import 'package:shop_cart/data/model/request/register_request.dart';
import 'package:shop_cart/data/model/response/register_response_dto.dart';
import 'package:shop_cart/ui/Utils/shared_preference_utils.dart';
import '../../domain/entities/general_failures.dart';
import '../model/request/Sign_in_request.dart';
import '../model/response/Sign_in_response_dto.dart';
import '../model/response/add_to_cart_response_dto.dart';
import '../model/response/category_or_brand_response_dto/category_or_brand_response_dto.dart';


class ApiManager {
  ApiManager._();
  static ApiManager? _inStance;
  static getInstance(){
    _inStance ??= ApiManager._();
    return _inStance;
  }


  Future<Either<GeneralFailures,RegisterResponseDto>> register(String email, String name, String password,
      String rePassword, String phone) async {
    final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile)||connectivityResult.contains(ConnectivityResult.wifi)) {
      Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.registerApi);
      var requestBody = RegisterRequest(
          email: email,
          name: name,
          password: password,
          rePassword: rePassword,
          phone: phone);
      var response = await http.post(url, body: requestBody.toJson());
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      var registerResponse= RegisterResponseDto.fromJson(json);
      if (response.statusCode>=200&&response.statusCode<300){

        return Right(registerResponse);
      }else{
       return Left(ServerError(errorMessage: registerResponse.error!=null?registerResponse.error!.msg:registerResponse.message));
        
      }

    }else  {

      return Left(NetWorkError(errorMessage: 'check internet connection'));
    }

  }

  Future<Either<GeneralFailures,SignInResponseDto>> signIn(String email,  String password,) async {

    final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile)||connectivityResult.contains(ConnectivityResult.wifi)) {

      Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.signInApi);

      var requestBody = SignInRequest(
          email: email,
          password: password);
      var response = await http.post(url, body: requestBody.toJson());
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      var signInResponse= SignInResponseDto.fromJson(json);
      if (response.statusCode>=200&&response.statusCode<300){
        SharedPreferenceUtils.saveData(key: 'Token', value:signInResponse.token);

        return Right(signInResponse);
      }else{
        return Left(ServerError(errorMessage:signInResponse.message));

      }

    }else  {

      return Left(NetWorkError(errorMessage: 'check internet connection'));
    }

  }
  Future<Either<GeneralFailures,CategoryOrBrandResponseDto>> getAllCategories() async {

    final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile)||connectivityResult.contains(ConnectivityResult.wifi)) {

      Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.categoriesApi);

      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      var categoryResponse= CategoryOrBrandResponseDto.fromJson(json);
      if (response.statusCode>=200&&response.statusCode<300){

        return Right(categoryResponse);
      }else{
        return Left(ServerError(errorMessage:categoryResponse.message ));

      }

    }else  {

      return Left(NetWorkError(errorMessage: 'check internet connection'));
    }

  }
  Future<Either<GeneralFailures,CategoryOrBrandResponseDto>> getAllBrands() async {

    final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile)||connectivityResult.contains(ConnectivityResult.wifi)) {

      Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.brandsApi);

      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      var brandResponse= CategoryOrBrandResponseDto.fromJson(json);
      if (response.statusCode>=200&&response.statusCode<300){

        return Right(brandResponse);
      }else{
        return Left(ServerError(errorMessage:brandResponse.message ));

      }

    }else  {

      return Left(NetWorkError(errorMessage: 'check internet connection'));
    }

  }


  Future<Either<GeneralFailures,ProductResponseDto>> getAllProducts() async {

    final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile)||connectivityResult.contains(ConnectivityResult.wifi)) {

      Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.productApi);

      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      var productResponse= ProductResponseDto.fromJson(json);
      if (response.statusCode>=200&&response.statusCode<300){

        return Right(productResponse);
      }else{
        return Left(ServerError(errorMessage:productResponse.message ));

      }

    }else  {

      return Left(NetWorkError(errorMessage: 'check internet connection'));
    }

  }

  Future<Either<GeneralFailures,AddToCartResponseDto>> addToCart(String productId) async {

    final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile)||connectivityResult.contains(ConnectivityResult.wifi)) {
      var token=SharedPreferenceUtils.getData(key: 'Token');
      Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.addToCartApi);

      var response = await http.post(url,
          body: {"productId":productId},
          headers: {'token': token.toString()});
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      var addToCartResponse= AddToCartResponseDto.fromJson(json);
      if (response.statusCode>=200&&response.statusCode<300){

        return Right(addToCartResponse);
      }
      else if(response.statusCode==401){

        return Left(ServerError(errorMessage:addToCartResponse.message ));
      }
      else{
        return Left(ServerError(errorMessage:addToCartResponse.message ));

      }

    }
    else  {

      return Left(NetWorkError(errorMessage: 'check internet connection'));
    }

  }
  Future<Either<GeneralFailures, GetCartResponseDto>> getCart() async {

    final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile)||connectivityResult.contains(ConnectivityResult.wifi)) {
      var token=SharedPreferenceUtils.getData(key: 'Token');
      Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.addToCartApi);

      var response = await http.get(url,
          headers: {'token': token.toString()});
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      var getCartResponse= GetCartResponseDto.fromJson(json);
      if (response.statusCode>=200&&response.statusCode<300){

        return Right(getCartResponse);
      }
      else if(response.statusCode==401){

        return Left(ServerError(errorMessage:getCartResponse.message ));
      }
      else{
        return Left(ServerError(errorMessage:getCartResponse.message ));

      }

    }
    else  {

      return Left(NetWorkError(errorMessage: 'check internet connection'));
    }

  }
  Future<Either<GeneralFailures, GetCartResponseDto>> deleteItemInCart(String productId) async {

    final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile)||connectivityResult.contains(ConnectivityResult.wifi)) {
      var token=SharedPreferenceUtils.getData(key: 'Token');
      Uri url = Uri.https(ApiConstants.baseUrl, '${ApiConstants.addToCartApi}/$productId');

      var response = await http.delete(url,
          headers: {'token': token.toString()});
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      var deleteItemInCart= GetCartResponseDto.fromJson(json);
      if (response.statusCode>=200&&response.statusCode<300){

        return Right(deleteItemInCart);
      }
      else if(response.statusCode==401){

        return Left(ServerError(errorMessage:deleteItemInCart.message ));
      }
      else{
        return Left(ServerError(errorMessage:deleteItemInCart.message ));

      }

    }
    else  {

      return Left(NetWorkError(errorMessage: 'check internet connection'));
    }

  }
  Future<Either<GeneralFailures, GetCartResponseDto>> upDateCountInCart(String productId,String count) async {

    final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile)||connectivityResult.contains(ConnectivityResult.wifi)) {
      var token=SharedPreferenceUtils.getData(key: 'Token');
      Uri url = Uri.https(ApiConstants.baseUrl, '${ApiConstants.addToCartApi}/$productId');

      var response = await http.put(url,
          headers: {'token': token.toString()},body:{
            "count": count

          } );
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      var upDateCountInCart= GetCartResponseDto.fromJson(json);
      if (response.statusCode>=200&&response.statusCode<300){

        return Right(upDateCountInCart);
      }
      else if(response.statusCode==401){

        return Left(ServerError(errorMessage:upDateCountInCart.message ));
      }
      else{
        return Left(ServerError(errorMessage:upDateCountInCart.message ));

      }

    }
    else  {

      return Left(NetWorkError(errorMessage: 'check internet connection'));
    }

  }

}
