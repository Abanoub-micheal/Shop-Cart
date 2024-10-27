import 'package:shop_cart/data/model/response/error.dart';
import 'package:shop_cart/domain/entities/auth_result_entity.dart';

import 'user_dto.dart';

class RegisterResponseDto {
  RegisterResponseDto({
      this.message, 
      this.user, 
      this.token,this.error,this.statusMsg});

  RegisterResponseDto.fromJson(dynamic json) {
    statusMsg = json['statusMsg'];
    message = json['message'];
    user = json['user'] != null ? UserDto.fromJson(json['user']) : null;
    error = json['errors'] != null ? Error.fromJson(json['errors']) : null;
    token = json['token'];
    statusMsg = json['statusMsg'];

  }
  String? statusMsg;
  String? message;
  UserDto? user;
  String? token;
  Error? error;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['statusMsg'] = statusMsg;
    map['errors'] = error;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    return map;
  }
  AuthResultEntity toAuthResultEntity(){
    return AuthResultEntity(token:token ,user:user?.toUserEntity() );
  }

}