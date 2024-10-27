
import 'package:shop_cart/data/model/response/product_response_dto.dart';
import 'package:shop_cart/domain/entities/get_cart_response_entity.dart';

import 'category_or_brand_response_dto/category_or_brand_dto.dart';

class GetCartResponseDto extends GetCartResponseEntity{
  GetCartResponseDto({
      super.status,
    super.numOfCartItems,
    super.cartId,
    super.data,this.message});

  GetCartResponseDto.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    numOfCartItems = json['numOfCartItems'];
    cartId = json['cartId'];
    data = json['data'] != null ? DataDto.fromJson(json['data']) : null;
  }

  String? message;

}


class DataDto extends DataEntity{
  DataDto({
    super.id,
    super.cartOwner,
    super.products,
    super.createdAt,
    super.updatedAt,
    super.v,
    super.totalCartPrice,});

  DataDto.fromJson(dynamic json) {
    id = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(GetProductsCartDto.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }



}



class GetProductsCartDto extends GetProductsCartEntity{
  GetProductsCartDto({
      super.count,
      super.id,
      super.product,
      super.price,});

  GetProductsCartDto.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product = json['product'] != null ? ProductCartDto.fromJson(json['product']) : null;
    price = json['price'];
  }




}


class ProductCartDto extends ProductCartEntity{
  ProductCartDto({
    super.subcategory,
    super.id,
    super.title,
    super.quantity,
    super.imageCover,
    super.category,
    super.brand,
    super.ratingsAverage,
    });

  ProductCartDto.fromJson(dynamic json) {
    if (json['subcategory'] != null) {
      subcategory = [];
      json['subcategory'].forEach((v) {
        subcategory?.add(SubcategoryDto.fromJson(v));
      });
    }
    id = json['_id'];
    title = json['title'];
    quantity = json['quantity'];
    imageCover = json['imageCover'];
    category = json['category'] != null ? CategoryOrBrandDto.fromJson(json['category']) : null;
    brand = json['brand'] != null ? CategoryOrBrandDto.fromJson(json['brand']) : null;
    ratingsAverage = json['ratingsAverage'];
    id = json['id'];
  }


}


