import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_cart/domain/use_cases/register_use_case.dart';
import 'package:shop_cart/ui/views/auth/sign_up/register_states.dart';

class RegisterViewModel extends Cubit<RegisterStates> {
  RegisterViewModel({required this.registerUseCase}) : super(RegisterInitialStates());

  TextEditingController fullNameController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController emailAddressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool isObscure = true;
  bool isObscureConfirmPassword = true;
  var formKey = GlobalKey<FormState>();
  RegisterUseCase registerUseCase;

  void register() async{
    if (formKey.currentState!.validate() == true) {

      emit(RegisterLoadingStates(loadingMessage: 'Loading...'));
        var response=await registerUseCase.invoke(
                  emailAddressController.text,
                  fullNameController.text,
                  passwordController.text,
                  confirmPasswordController.text,
                  mobileNumberController.text);

        response.fold((l) {
          emit(RegisterFailureStates(errorMessage: l.errorMessage));
        }, (response) {
          emit(RegisterSuccessStates(response: response));
        },);
    }

  }
}
