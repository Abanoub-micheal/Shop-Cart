import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_cart/ui/views/auth/sign_up/register_states.dart';
import 'package:shop_cart/ui/views/auth/sign_up/register_view_model.dart';
import 'package:shop_cart/ui/widgets/custom_elevated_button.dart';
import 'package:shop_cart/ui/widgets/text_form_field_customize.dart';

import '../../../../domain/di.dart';
import '../../../Utils/dialog_utils.dart';
import '../../../Utils/my_theme.dart';
import '../../../Utils/validation.dart';


class RegisterView extends StatefulWidget {
  static const String routeName = 'register';
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
 RegisterViewModel viewModel =RegisterViewModel(registerUseCase: injectRegisterUseCase());

  @override
  Widget build(BuildContext context) {
    return BlocListener(listener: (context, state) {
      if(state is RegisterLoadingStates){
       DialogUtils.showLoading(context,state.loadingMessage!);
      }
      if(state is RegisterFailureStates){
        DialogUtils.hideLoading(context);
       DialogUtils.showMessage(context, state.errorMessage!, 'ok', (context){Navigator.pop(context);});
      }
      if(state is RegisterSuccessStates){
        DialogUtils.hideLoading(context);
        DialogUtils.showMessage(context, state.response?.user?.name??'', 'ok', (context){Navigator.pop(context);},title: 'Success');

      }

    },bloc: viewModel,child:Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 70, left: 15, right: 15),
        child: SingleChildScrollView(
          child: Form(
            key: viewModel.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  'assets/images/logo splash.jpg',
                  width: 100,
                  height: 100,
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  'Full Name',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                    validator: (text) {
                      if (text == null || text.trim().isEmpty) {
                        return 'Please enter your Full Name';
                      }
                      if (text.length < 4) {
                        return 'Full Name should at least 4 chars';
                      }
                      return null;
                    },
                    hintText: 'enter your Full Name',
                    controller: viewModel.fullNameController),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  'Mobile Number',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                CustomTextFormField(
                  validator: (text) {
                    if (text == null||text.trim().isEmpty) {
                      return 'Please enter your Mobile Number';
                    }
                    if (text.length < 11) {
                      return 'your Mobile Number should be 11 number ';
                    }
                    return null;
                  },
                  hintText: 'enter your Mobile Number',
                  controller: viewModel.mobileNumberController,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  'Email',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                CustomTextFormField(
                    validator: (text) {
                      if (text == null||text.trim().isEmpty) {
                        return 'Please enter your Email';
                      }
                      if (!isValidEmail(text)) {
                        return 'invalid Email';
                      }
                      return null;
                    },
                    hintText: 'enter your Email',
                    controller: viewModel.emailAddressController),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  'Password',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                CustomTextFormField(
                  obscure: viewModel.isObscure,
                  suffixIcon: InkWell(
                    child: viewModel.isObscure
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off),
                    onTap: () {
                      if (viewModel.isObscure) {
                        viewModel.isObscure = false;
                      } else {
                        viewModel.isObscure = true;
                      }
                      setState(() {});
                    },
                  ),
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return 'Please enter your Password';
                    }
                    if (text.length < 6) {
                      return 'Must be more than 6 chars';
                    }
                    return null;
                  },
                  hintText: 'enter your password',
                  controller: viewModel.passwordController,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Confirm Password',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                  obscure: viewModel.isObscureConfirmPassword,
                  suffixIcon: InkWell(
                    child: viewModel.isObscureConfirmPassword
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off),
                    onTap: () {
                      if (viewModel.isObscureConfirmPassword) {
                        viewModel.isObscureConfirmPassword = false;
                      } else {
                        viewModel.isObscureConfirmPassword = true;
                      }
                      setState(() {});
                    },
                  ),
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return 'Please enter your Confirm Password';
                    }
                    if (text.length < 6) {
                      return 'Must be more than 6 chars';
                    }
                    if (text != viewModel.passwordController.text) {
                      return "Password doesn't match";
                    }
                    return null;
                  },
                  hintText: 'enter your Confirm Password',
                  controller: viewModel.confirmPasswordController,
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomElevatedButton(
                  text: 'Sign Up',
                  onPressed: () {
                  viewModel.register();
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('already have an Account?'),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Sign in ',
                          style: TextStyle(
                              color: MyTheme.primaryColor,
                              fontWeight: FontWeight.bold),
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ) ,);

  }
}
