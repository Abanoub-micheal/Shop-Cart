import 'package:shop_cart/domain/entities/auth_result_entity.dart';

abstract class SignInStates {}

class SignInInitialStates extends SignInStates {}

class SignInLoadingStates extends SignInStates {
  String? loadingMessage;
  SignInLoadingStates({this.loadingMessage});
}

class SignInFailureStates extends SignInStates {
  String? errorMessage;
  SignInFailureStates({this.errorMessage});
}

class SignInSuccessStates extends SignInStates {
  AuthResultEntity? response;
  SignInSuccessStates({required this.response});
}
