import 'package:shop_cart/domain/entities/user_entity.dart';

class AuthResultEntity{
  UserEntity? user;
  String? token;

  AuthResultEntity({this.user,this.token});


}