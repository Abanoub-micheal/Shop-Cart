
class AddToCartResponseEntity {
  AddToCartResponseEntity({
      this.status, 
      this.message, 
      this.numOfCartItems, 
      this.cartId, 
      this.data,});

  String? status;
  String? message;
  int? numOfCartItems;
  String? cartId;
  AddDataToCartEntity? data;

}

class AddDataToCartEntity {
  AddDataToCartEntity({
      this.id, 
      this.cartOwner, 
      this.products, 
      this.createdAt, 
      this.updatedAt, 
      this.v, 
      this.totalCartPrice,});


  String? id;
  String? cartOwner;
  List<AddProductsToCartEntity>? products;
  String? createdAt;
  String? updatedAt;
  int? v;
  int? totalCartPrice;


}


class AddProductsToCartEntity {
  AddProductsToCartEntity({
      this.count, 
      this.id, 
      this.product, 
      this.price,});


  int? count;
  String? id;
  String? product;
  int? price;


}