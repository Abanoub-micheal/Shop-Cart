import 'package:dartz/dartz.dart';
import 'package:shop_cart/data/model/response/register_response_dto.dart';
import '../../../../domain/entities/auth_result_entity.dart';
import '../../../../domain/entities/general_failures.dart';
import '../../../../domain/repository/data_source/auth_remote_data_source_contract.dart';
import '../../../api/api_manager.dart';

class AuthRemoteDataSourceImpl extends AuthRemoteDataSourceContract{
  ApiManager apiManager;
  AuthRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<Either<GeneralFailures,AuthResultEntity>> register(String email, String name, String password, String rePassword, String phone) async{
    var either=await apiManager.register(email, name, password, rePassword, phone);
    return either.fold((l) {
      return  Left(GeneralFailures(errorMessage: l.errorMessage));
    }, (r) {
      return Right(r.toAuthResultEntity());
    },);
  }

  @override
  Future<Either<GeneralFailures, AuthResultEntity>> signIn(String email, String password) async {

   var either=await apiManager.signIn(email, password);
   return either.fold((l) {
     return Left(GeneralFailures(errorMessage: l.errorMessage));
   }, (response) {
     return Right(response.toAuthResultEntity());
   },);
  }

}

