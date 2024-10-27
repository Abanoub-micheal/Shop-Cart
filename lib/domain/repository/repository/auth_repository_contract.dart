import 'package:dartz/dartz.dart';
import 'package:shop_cart/domain/entities/auth_result_entity.dart';
import 'package:shop_cart/domain/entities/general_failures.dart';

abstract class AuthRepositoryContract {

 Future<Either<GeneralFailures,AuthResultEntity>> register(String email, String name, String password, String rePassword, String phone);
 Future<Either<GeneralFailures,AuthResultEntity>> signIn(String email, String password);

}