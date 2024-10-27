import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_cart/ui/Utils/bloc_observer.dart';
import 'package:shop_cart/ui/Utils/my_theme.dart';
import 'package:shop_cart/ui/views/auth/log_in/sign_in_view.dart';
import 'package:shop_cart/ui/views/auth/sign_up/register_view.dart';
import 'package:shop_cart/ui/views/cart/cart_view.dart';
import 'package:shop_cart/ui/views/home/home_view.dart';
import 'package:shop_cart/ui/views/home/product_details/product_details.dart';
import 'package:shop_cart/ui/views/splash/splash_screen.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  runApp(  const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});



  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme:MyTheme.lightTheme ,
        initialRoute: SplashView.routeName,
        routes: {
          SplashView.routeName:(context)=>const SplashView(),
           SignInView.routeName:(context)=>const SignInView(),
          RegisterView.routeName:(context)=>const RegisterView(),
          ProductDetails.routeName:(context)=> ProductDetails(),
          HomeView.routeName:(context)=>HomeView(),
          CartView.routeName:(context)=>CartView(),
        },


      ),
    );
  }
}
