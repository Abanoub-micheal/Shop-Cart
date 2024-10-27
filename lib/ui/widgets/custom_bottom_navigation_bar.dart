import 'package:flutter/material.dart';
import 'package:shop_cart/ui/Utils/my_theme.dart';
typedef OnTap=void Function(int);
class CustomBottomNavigationBar extends StatelessWidget {
   const CustomBottomNavigationBar({super.key, required this.onTapFunction, required this.selectIndex, required this.context});
final  OnTap onTapFunction;
 final int selectIndex;
final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return  ClipRRect(
      borderRadius: const BorderRadius.only(
          topRight: Radius.circular(15), topLeft: Radius.circular(15)),
      child: BottomNavigationBar(
          unselectedFontSize: 10,
          useLegacyColorScheme: false,
          unselectedLabelStyle: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
          selectedLabelStyle: TextStyle(color: MyTheme.primaryColor,fontWeight: FontWeight.bold),
          showUnselectedLabels: true,
          currentIndex: selectIndex,
          backgroundColor: const Color(0xffF9F9F9),
          onTap: onTapFunction,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/home_icon.png',height: 25,
                color:selectIndex==0? MyTheme.primaryColor:Colors.black,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/icons/category_icon.png',height: 22,
                  color: selectIndex==1? MyTheme.primaryColor:Colors.black,
                ),
                label: 'Category'),
            BottomNavigationBarItem(
                icon: Image.asset('assets/icons/heart_icon.png',height: 22,color: selectIndex==2? MyTheme.primaryColor:Colors.black,), label: 'Fav'),
            BottomNavigationBarItem(
                icon: Image.asset('assets/icons/profile_icon.png',height: 22,color: selectIndex==3? MyTheme.primaryColor:Colors.black,),
                label: 'Profile'),
          ]),
    );
  }
}
