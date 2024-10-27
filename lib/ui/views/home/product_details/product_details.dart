import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:readmore/readmore.dart';
import 'package:shop_cart/domain/entities/product_response_entity.dart';
import 'package:shop_cart/ui/Utils/my_theme.dart';

class ProductDetails extends StatelessWidget {
  static const String routeName = 'product-details';
  const ProductDetails({super.key});
 final int countProduct = 1;

  @override
  Widget build(BuildContext context) {
    var arg = ModalRoute.of(context)!.settings.arguments as ProductEntity;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Product Details',
          style: TextStyle(color: MyTheme.primaryColor,fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: MyTheme.primaryColor),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: InkWell(
                onTap: () {}, child: const Icon(Icons.shopping_cart_outlined)),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left:10 ,right:10,top: 5 ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              width: 400,
              height: 300,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: ImageSlideshow(
                    indicatorRadius: 4,
                    width: double.infinity,
                    autoPlayInterval: 5000,
                    height: 200,
                    initialPage: 0,
                    indicatorColor: MyTheme.primaryColor,
                    indicatorBackgroundColor: Colors.grey,
                    isLoop: true,
                    children: arg.images!.map((path) {
                      return
                      ClipRRect(borderRadius: BorderRadius.circular(30),child: Image.network(path,fit:BoxFit.cover ,height: 300,width: double.infinity,));
                    },).toList(),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12,right: 12,top: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        arg.title ?? '',
                        style: TextStyle(color: MyTheme.primaryColor,fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      Text('EGP ${arg.price}',
                          style: TextStyle(color: MyTheme.primaryColor))
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 10,right: 10,top: 5,bottom: 5),
                        decoration: BoxDecoration(
                          border: Border.all(color: MyTheme.primaryColor),
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Text('sold : ${arg.sold}',
                            style: TextStyle(color: MyTheme.primaryColor)),
                      ),
                      const SizedBox(width: 10,),
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Text('(${arg.ratingsAverage}) (${arg.ratingsQuantity})',
                          style: TextStyle(color: MyTheme.primaryColor)),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: MyTheme.primaryColor),
                        child: Row(
                          children: [
                            InkWell(
                                onTap: () {},
                                child: Image.asset(
                                    'assets/icons/icon_subtract.png')),
                            const SizedBox(
                              width: 15,
                            ),
                            Text(
                              '$countProduct',
                              style: const TextStyle(color: Colors.white),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            InkWell(
                                onTap: () {},
                                child: Image.asset('assets/icons/icon_plus.png')),

                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Text(
                    'Description',
                    style: TextStyle(
                        color: MyTheme.primaryColor, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10,),
              ReadMoreText(
                '${arg.description}',
                trimMode: TrimMode.Line,
                trimLines: 2,
                colorClickableText: MyTheme.primaryColor,
                trimCollapsedText: ' Read More',
                trimExpandedText: '  Show less',
                moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: MyTheme.primaryColor),
                lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: MyTheme.primaryColor) ,

              ),
                  const SizedBox(height: 40,),
                  Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            'Total Price',
                            style: TextStyle(color: MyTheme.primaryColor,fontWeight: FontWeight.bold),
                          ),
                          Text('${arg.price}',
                              style: TextStyle(color: MyTheme.primaryColor))
                        ],
                      ),
                      const Spacer(),
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  WidgetStatePropertyAll(MyTheme.primaryColor)),
                          onPressed: () {},
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/icons/add-to-cart_icon.png',
                                color: Colors.white,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                'Add To Cart',
                                style:
                                    TextStyle(color: Colors.white, fontSize: 18),
                              )
                            ],
                          ))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
