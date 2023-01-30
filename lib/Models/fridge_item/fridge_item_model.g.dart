// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fridge_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FridgeItemModel _$$_FridgeItemModelFromJson(Map<String, dynamic> json) =>
    _$_FridgeItemModel(
      product: Product.fromJson(json['product'] as Map<String, dynamic>),
      expirationDate: DateTime.parse(json['expirationDate'] as String),
      grams: (json['grams'] as num).toDouble(),
    );

Map<String, dynamic> _$$_FridgeItemModelToJson(_$_FridgeItemModel instance) =>
    <String, dynamic>{
      'product': instance.product,
      'expirationDate': instance.expirationDate.toIso8601String(),
      'grams': instance.grams,
    };
