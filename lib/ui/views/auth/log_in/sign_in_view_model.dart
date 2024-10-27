import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_cart/domain/use_cases/sign_in_use_case.dart';
import 'package:shop_cart/ui/views/auth/log_in/sign_in_states.dart';

class SignInViewModel extends Cubit<SignInStates> {
  SignInViewModel({required this.signInUseCase}) : super(SignInInitialStates());

  TextEditingController emailAddressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isObscure = true;
  bool isObscureConfirmPassword = true;
  var formKey = GlobalKey<FormState>();
  SignInUseCase signInUseCase;

  void signIn() async{
    if (formKey.currentState!.validate() == true) {

      emit(SignInLoadingStates(loadingMessage: 'Loading...'));
        var response=await signInUseCase.invoke(emailAddressController.text,passwordController.text );

        response.fold((l) {
          emit(SignInFailureStates(errorMessage: l.errorMessage));
        }, (response) {
          emit(SignInSuccessStates(response: response));
        },);
    }

  }
}
