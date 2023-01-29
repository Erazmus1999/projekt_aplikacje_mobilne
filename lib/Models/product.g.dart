// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Product _$$_ProductFromJson(Map<String, dynamic> json) => _$_Product(
      name: json['name'] as String,
      carbo: (json['carbo'] as num).toDouble(),
      fat: (json['fat'] as num).toDouble(),
      kcal: (json['kcal'] as num).toDouble(),
      protein: (json['protein'] as num).toDouble(),
      salt: (json['salt'] as num).toDouble(),
      vegan: json['vegan'] as bool,
    );

Map<String, dynamic> _$$_ProductToJson(_$_Product instance) =>
    <String, dynamic>{
      'name': instance.name,
      'carbo': instance.carbo,
      'fat': instance.fat,
      'kcal': instance.kcal,
      'protein': instance.protein,
      'salt': instance.salt,
      'vegan': instance.vegan,
    };
