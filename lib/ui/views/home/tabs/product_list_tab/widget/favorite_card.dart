import 'package:flutter/material.dart';
import 'package:shop_cart/ui/Utils/my_theme.dart';

class FavoriteCard extends StatelessWidget {
  const FavoriteCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 398,
        height:113 ,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: MyTheme.primaryColor)),
        child: Row(

          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/images/Announcement 2.png',
                width: 120,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 5,),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Text('Product name'),
                      IconButton(onPressed: () {
              
                      }, icon: Container(padding: EdgeInsets.all(2),decoration: BoxDecoration(color: Color(0xffffffff),borderRadius: BorderRadius.circular(50)),child: Icon(Icons.favorite,color: MyTheme.primaryColor)))
              
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Product name'),
                      IconButton(onPressed: () {
              
                      }, icon: Icon(Icons.favorite))
              
                    ],
                  ),
              
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
