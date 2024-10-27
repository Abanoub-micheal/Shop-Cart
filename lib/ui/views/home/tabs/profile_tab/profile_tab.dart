import 'package:flutter/material.dart';
import 'package:shop_cart/ui/Utils/shared_preference_utils.dart';
import 'package:shop_cart/ui/views/auth/log_in/sign_in_view.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(onPressed: () {
        SharedPreferenceUtils.deleteData(key: 'Token');
        Navigator.pushReplacementNamed(context, SignInView.routeName);

      }, icon:Icon( Icons.logout)),
    );
  }
}
