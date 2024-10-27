import 'package:shop_cart/data/model/response/register_response_dto.dart';
import 'package:shop_cart/domain/entities/auth_result_entity.dart';

abstract class RegisterStates {}

class RegisterInitialStates extends RegisterStates {}

class RegisterLoadingStates extends RegisterStates {
  String? loadingMessage;
  RegisterLoadingStates({this.loadingMessage});
}

class RegisterFailureStates extends RegisterStates {
  String? errorMessage;
  RegisterFailureStates({this.errorMessage});
}

class RegisterSuccessStates extends RegisterStates {
  AuthResultEntity? response;
  RegisterSuccessStates({required this.response});
}
