import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:projekt_aplikacje_mobilne/Models/product.dart';

part 'fridge_item_model.freezed.dart';
part 'fridge_item_model.g.dart';

@freezed
class FridgeItemModel with _$FridgeItemModel {
  const factory FridgeItemModel({
    required Product product,
    required DateTime expirationDate,
    required double grams,
  }) = _FridgeItemModel;

  factory FridgeItemModel.fromJson(Map<String, Object?> json) =>
      _$FridgeItemModelFromJson(json);
}
