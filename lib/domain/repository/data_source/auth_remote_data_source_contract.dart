import 'package:dartz/dartz.dart';
import '../../entities/auth_result_entity.dart';
import '../../entities/general_failures.dart';

abstract class AuthRemoteDataSourceContract{

  Future<Either<GeneralFailures,AuthResultEntity>> register(String email, String name, String password, String rePassword, String phone);
  Future<Either<GeneralFailures,AuthResultEntity>> signIn(String email, String password);

}
