import '../../../../domain/entities/category_or_brand_response_entity/category_or_brand_entity.dart';
import '../../../../domain/entities/category_or_brand_response_entity/category_or_brand_response_entity.dart';
import 'Metadata.dart';
import 'category_or_brand_dto.dart';

class CategoryOrBrandResponseDto extends CategoryOrBrandResponseEntity {
  CategoryOrBrandResponseDto({
      super.results,
      super.data,
    this.metadata,
    this.message});

  CategoryOrBrandResponseDto.fromJson(dynamic json) {
    results = json['results'];
    message = json['message'];
    metadata = json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(CategoryOrBrandDto.fromJson(v));
      });
    }
  }
  Metadata? metadata;
  String? message;



}