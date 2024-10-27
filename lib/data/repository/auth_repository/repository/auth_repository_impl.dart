import 'package:dartz/dartz.dart';
import 'package:shop_cart/data/model/response/register_response_dto.dart';
import 'package:shop_cart/data/repository/auth_repository/data_source/auth_remote_data_source_impl.dart';
import '../../../../domain/entities/auth_result_entity.dart';
import '../../../../domain/entities/general_failures.dart';
import '../../../../domain/repository/data_source/auth_remote_data_source_contract.dart';
import '../../../../domain/repository/repository/auth_repository_contract.dart';


class AuthRepositoryImpl implements AuthRepositoryContract{
  AuthRemoteDataSourceContract remoteDataSource;
  AuthRepositoryImpl({required this.remoteDataSource});
  @override
  Future< Either<GeneralFailures,AuthResultEntity>> register(String email, String name, String password, String rePassword, String phone) {
   return remoteDataSource.register(email, name, password, rePassword, phone);
  }

  @override
  Future<Either<GeneralFailures, AuthResultEntity>> signIn(String email, String password) {
return   remoteDataSource.signIn(email, password);

  }
}

