// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fridge_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FridgeItemModel _$FridgeItemModelFromJson(Map<String, dynamic> json) {
  return _FridgeItemModel.fromJson(json);
}

/// @nodoc
mixin _$FridgeItemModel {
  Product get product => throw _privateConstructorUsedError;
  DateTime get expirationDate => throw _privateConstructorUsedError;
  double get grams => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FridgeItemModelCopyWith<FridgeItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FridgeItemModelCopyWith<$Res> {
  factory $FridgeItemModelCopyWith(
          FridgeItemModel value, $Res Function(FridgeItemModel) then) =
      _$FridgeItemModelCopyWithImpl<$Res, FridgeItemModel>;
  @useResult
  $Res call({Product product, DateTime expirationDate, double grams});

  $ProductCopyWith<$Res> get product;
}

/// @nodoc
class _$FridgeItemModelCopyWithImpl<$Res, $Val extends FridgeItemModel>
    implements $FridgeItemModelCopyWith<$Res> {
  _$FridgeItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
    Object? expirationDate = null,
    Object? grams = null,
  }) {
    return _then(_value.copyWith(
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
      expirationDate: null == expirationDate
          ? _value.expirationDate
          : expirationDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      grams: null == grams
          ? _value.grams
          : grams // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductCopyWith<$Res> get product {
    return $ProductCopyWith<$Res>(_value.product, (value) {
      return _then(_value.copyWith(product: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_FridgeItemModelCopyWith<$Res>
    implements $FridgeItemModelCopyWith<$Res> {
  factory _$$_FridgeItemModelCopyWith(
          _$_FridgeItemModel value, $Res Function(_$_FridgeItemModel) then) =
      __$$_FridgeItemModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Product product, DateTime expirationDate, double grams});

  @override
  $ProductCopyWith<$Res> get product;
}

/// @nodoc
class __$$_FridgeItemModelCopyWithImpl<$Res>
    extends _$FridgeItemModelCopyWithImpl<$Res, _$_FridgeItemModel>
    implements _$$_FridgeItemModelCopyWith<$Res> {
  __$$_FridgeItemModelCopyWithImpl(
      _$_FridgeItemModel _value, $Res Function(_$_FridgeItemModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
    Object? expirationDate = null,
    Object? grams = null,
  }) {
    return _then(_$_FridgeItemModel(
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
      expirationDate: null == expirationDate
          ? _value.expirationDate
          : expirationDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      grams: null == grams
          ? _value.grams
          : grams // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FridgeItemModel implements _FridgeItemModel {
  const _$_FridgeItemModel(
      {required this.product,
      required this.expirationDate,
      required this.grams});

  factory _$_FridgeItemModel.fromJson(Map<String, dynamic> json) =>
      _$$_FridgeItemModelFromJson(json);

  @override
  final Product product;
  @override
  final DateTime expirationDate;
  @override
  final double grams;

  @override
  String toString() {
    return 'FridgeItemModel(product: $product, expirationDate: $expirationDate, grams: $grams)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FridgeItemModel &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.expirationDate, expirationDate) ||
                other.expirationDate == expirationDate) &&
            (identical(other.grams, grams) || other.grams == grams));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, product, expirationDate, grams);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FridgeItemModelCopyWith<_$_FridgeItemModel> get copyWith =>
      __$$_FridgeItemModelCopyWithImpl<_$_FridgeItemModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FridgeItemModelToJson(
      this,
    );
  }
}

abstract class _FridgeItemModel implements FridgeItemModel {
  const factory _FridgeItemModel(
      {required final Product product,
      required final DateTime expirationDate,
      required final double grams}) = _$_FridgeItemModel;

  factory _FridgeItemModel.fromJson(Map<String, dynamic> json) =
      _$_FridgeItemModel.fromJson;

  @override
  Product get product;
  @override
  DateTime get expirationDate;
  @override
  double get grams;
  @override
  @JsonKey(ignore: true)
  _$$_FridgeItemModelCopyWith<_$_FridgeItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}
