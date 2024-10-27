import 'package:flutter/material.dart';
import 'package:shop_cart/ui/Utils/my_theme.dart';

import '../../domain/entities/category_or_brand_response_entity/category_or_brand_entity.dart';

class CategoryOrBrandImageAndTitle extends StatelessWidget {
final CategoryOrBrandsEntity categoryOrBrand;
   const CategoryOrBrandImageAndTitle({super.key,required this.categoryOrBrand});



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        CircleAvatar( radius: 30,backgroundImage: NetworkImage(categoryOrBrand.image??'',)),
        SizedBox(height: 5,),
        Text(categoryOrBrand.name??'',style: TextStyle(color: MyTheme.primaryColor,fontSize: 12, ),)

      ],
    );
  }
}
