
import 'package:shop_cart/domain/entities/product_response_entity.dart';

import 'category_or_brand_response_entity/category_or_brand_entity.dart';

class GetCartResponseEntity {
  GetCartResponseEntity({
      this.status, 
      this.numOfCartItems, 
      this.cartId, 
      this.data,});

  String? status;
  int? numOfCartItems;
  String? cartId;
  DataEntity? data;

}


class DataEntity {
  DataEntity({
      this.id, 
      this.cartOwner, 
      this.products, 
      this.createdAt, 
      this.updatedAt, 
      this.v, 
      this.totalCartPrice,});


  String? id;
  String? cartOwner;
  List<GetProductsCartEntity>? products;
  String? createdAt;
  String? updatedAt;
  int? v;
  int? totalCartPrice;



}


class GetProductsCartEntity {
  GetProductsCartEntity({
      this.count, 
      this.id, 
      this.product, 
      this.price,});


  int? count;
  String? id;
  ProductCartEntity? product;
  int? price;



}


class ProductCartEntity {
  ProductCartEntity({
      this.subcategory, 
      this.id, 
      this.title, 
      this.quantity, 
      this.imageCover, 
      this.category, 
      this.brand, 
      this.ratingsAverage, 
      });


  List<SubcategoryEntity>? subcategory;
  String? id;
  String? title;
  int? quantity;
  String? imageCover;
  CategoryOrBrandsEntity? category;
  CategoryOrBrandsEntity? brand;
  num? ratingsAverage;



}
