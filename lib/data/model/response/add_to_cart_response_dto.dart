
import 'package:shop_cart/domain/entities/add_to_cart_response_entity.dart';

class AddToCartResponseDto extends AddToCartResponseEntity{
  AddToCartResponseDto({
      super.status,
    super.message,
    super.numOfCartItems,
    super.cartId,
    super.data,});

  AddToCartResponseDto.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    numOfCartItems = json['numOfCartItems'];
    cartId = json['cartId'];
    data = json['data'] != null ? AddDataToCartDto.fromJson(json['data']) : null;
  }


}

class AddDataToCartDto extends AddDataToCartEntity{
  AddDataToCartDto({
    super.id,
    super.cartOwner,
    super.products,
    super.createdAt,
    super.updatedAt,
    super.v,
    super.totalCartPrice,});

  AddDataToCartDto.fromJson(dynamic json) {
    id = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(AddProductsToCartDto.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }


}


class AddProductsToCartDto extends AddProductsToCartEntity {
  AddProductsToCartDto({
    super.count,
    super.id,
    super.product,
    super.price,});

  AddProductsToCartDto.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product = json['product'];
    price = json['price'];
  }

}