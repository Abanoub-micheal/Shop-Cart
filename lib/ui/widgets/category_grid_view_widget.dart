import 'package:flutter/material.dart';
import 'package:shop_cart/ui/widgets/category_image_and_title.dart';

import '../../domain/entities/category_or_brand_response_entity/category_or_brand_entity.dart';

class GridViewWidget extends StatelessWidget {
 const GridViewWidget({super.key,required this.list});

final List<CategoryOrBrandsEntity> list;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: GridView.builder(itemBuilder: (context, index) {
        return CategoryOrBrandImageAndTitle(categoryOrBrand: list[index],);
      },itemCount:list.length ,scrollDirection: Axis.horizontal, gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,),),
    );
  }
}
