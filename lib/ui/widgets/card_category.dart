import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_cart/domain/entities/product_response_entity.dart';
import 'package:shop_cart/ui/views/home/tabs/product_list_tab/product_list_view_model.dart';
import '../Utils/my_theme.dart';

class CardCategory extends StatefulWidget {
  const CardCategory({super.key, required this.product});
  final ProductEntity product;

  @override
  State<CardCategory> createState() => _CardCategoryState();
}

class _CardCategoryState extends State<CardCategory> {
  bool isFavorite =false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey)),
        height: 237.h,
        width: 191.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    child: Image.network(
                      widget.product.imageCover ?? '',
                      height: 70,
                      width: 191,
                      fit: BoxFit.cover,
                    )),
                IconButton(
                    onPressed: () {
                      if (isFavorite){
                        isFavorite= false;
                      }else{
                        isFavorite=true;
                      }
                      setState(() {

                      });

                    },
                    icon: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 15,
                        child: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: MyTheme.primaryColor,
                        )))
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              widget.product.title ?? '',
              maxLines: 1,
            ),
            const SizedBox(
              height: 10,
            ),
            Text("EGP ${widget.product.price}"),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text('  Review (${widget.product.ratingsAverage})'),
                const SizedBox(
                  width: 5,
                ),
                const Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.orange),
                    child: InkWell(
                      onTap: () {
                       var bloc= BlocProvider.of<ProductListViewModel>(context);
                       bloc.addToCart(widget.product.id.toString());
                      },
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
