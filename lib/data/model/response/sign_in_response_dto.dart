import 'package:shop_cart/data/model/response/user_dto.dart';
import '../../../domain/entities/auth_result_entity.dart';


class SignInResponseDto {
  SignInResponseDto({
      this.message, 
      this.user, 
      this.token,this.statusMsg});

  SignInResponseDto.fromJson(dynamic json) {
    message = json['message'];
    statusMsg = json['statusMsg'];
    user = json['user'] != null ? UserDto.fromJson(json['user']) : null;
    token = json['token'];
  }
  String? message;
  UserDto? user;
  String? token;
  String? statusMsg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['statusMsg'] = statusMsg;
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