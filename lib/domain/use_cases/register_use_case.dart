import 'package:dartz/dartz.dart';
import 'package:shop_cart/data/repository/auth_repository/repository/auth_repository_impl.dart';
import 'package:shop_cart/domain/repository/repository/auth_repository_contract.dart';
import '../../data/model/response/register_response_dto.dart';
import '../entities/auth_result_entity.dart';
import '../entities/general_failures.dart';

class RegisterUseCase {
  AuthRepositoryContract authRepository;
  RegisterUseCase(this.authRepository);

  Future<Either<GeneralFailures,AuthResultEntity>> invoke(String email, String name, String password,
      String rePassword, String phone){

   return authRepository.register(email, name, password, rePassword, phone);

  }

}
