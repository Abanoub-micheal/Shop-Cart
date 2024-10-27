import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shop_cart/ui/views/auth/log_in/sign_in_view.dart';
import '../../Utils/shared_preference_utils.dart';
import '../home/home_view.dart';


class SplashView extends StatelessWidget {
  static const String routeName='splash-screen';
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {

    Timer(const Duration(seconds: 3),(){
       SharedPreferenceUtils.init();
      var userToken= SharedPreferenceUtils.getData(key:'Token');
      if(userToken==null){

       Navigator.pushReplacementNamed(context, SignInView.routeName);
      }else{
        Navigator.pushReplacementNamed(context, HomeView.routeName);
      }
    });

    return Scaffold(
      body: Center(child: Image.asset('assets/images/logo splash.jpg'))


    );
  }
}
