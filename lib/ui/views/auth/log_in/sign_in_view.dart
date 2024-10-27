import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_cart/domain/di.dart';
import 'package:shop_cart/ui/Utils/shared_preference_utils.dart';
import 'package:shop_cart/ui/views/auth/log_in/sign_in_view_model.dart';
import 'package:shop_cart/ui/views/home/home_view.dart';
import 'package:shop_cart/ui/widgets/custom_elevated_button.dart';
import 'package:shop_cart/ui/widgets/text_form_field_customize.dart';
import '../../../Utils/dialog_utils.dart';
import '../../../Utils/my_theme.dart';
import '../../../Utils/validation.dart';
import '../sign_up/register_states.dart';
import '../sign_up/register_view.dart';

class SignInView extends StatefulWidget {
  static const String routeName = 'log-in';
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  SignInViewModel viewModel = SignInViewModel(
      signInUseCase: injectSignInUseCase());

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
        print(state.response!.token);
      }
      Navigator.pushReplacementNamed(context, HomeView.routeName);


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
                  height: 20,
                ),
                Row(
                  children: [
                    const Text(
                      'Welcome Back To ',
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                    Text(
                      'Shop Cart',
                      style: TextStyle(
                          color: MyTheme.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text('Please sign in with your Email'),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'User Name',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                    validator: (text) {
                      if (text == null || text
                          .trim()
                          .isEmpty) {
                        return 'Please enter your Email';
                      }
                      if (!isValidEmail(text)) {
                        return 'invalid Email';
                      }
                      return null;
                    },
                    hintText: 'enter your name',
                    controller: viewModel.emailAddressController),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Password',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
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
                      setState(() {

                      });
                    },
                  ),
                  validator: (text) {
                    if (text == null || text
                        .trim()
                        .isEmpty) {
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
                  height: 20,
                ),
                InkWell(
                    onTap: () {},
                    child: const Text(
                      'Forgot Password',
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.end,
                    )),
                const SizedBox(
                  height: 20,
                ),
                CustomElevatedButton(text: 'Sign In', onPressed: () {
                  viewModel.signIn();
                },),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Don’t have an account?'),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, RegisterView.routeName);
                        },
                        child: Text(
                          ' Create Account ',
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
    ));
  }
}
