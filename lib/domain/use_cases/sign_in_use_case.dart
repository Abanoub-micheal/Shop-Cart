import 'package:dartz/dartz.dart';
import 'package:shop_cart/data/repository/auth_repository/repository/auth_repository_impl.dart';
import 'package:shop_cart/domain/repository/repository/auth_repository_contract.dart';
import '../entities/auth_result_entity.dart';
import '../entities/general_failures.dart';

class SignInUseCase {
  AuthRepositoryContract authRepository;
  SignInUseCase(this.authRepository);

  Future<Either<GeneralFailures,AuthResultEntity>> invoke(String email,  String password){

    return authRepository.signIn(email, password);

  }

}
