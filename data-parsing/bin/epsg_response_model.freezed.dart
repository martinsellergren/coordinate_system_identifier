// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'epsg_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EpsgJsonResponse _$EpsgJsonResponseFromJson(Map<String, dynamic> json) {
  return _EpsgJsonResponse.fromJson(json);
}

/// @nodoc
mixin _$EpsgJsonResponse {
  BboxResp get bbox => throw _privateConstructorUsedError;

  /// Serializes this EpsgJsonResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EpsgJsonResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EpsgJsonResponseCopyWith<EpsgJsonResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EpsgJsonResponseCopyWith<$Res> {
  factory $EpsgJsonResponseCopyWith(
          EpsgJsonResponse value, $Res Function(EpsgJsonResponse) then) =
      _$EpsgJsonResponseCopyWithImpl<$Res, EpsgJsonResponse>;
  @useResult
  $Res call({BboxResp bbox});

  $BboxRespCopyWith<$Res> get bbox;
}

/// @nodoc
class _$EpsgJsonResponseCopyWithImpl<$Res, $Val extends EpsgJsonResponse>
    implements $EpsgJsonResponseCopyWith<$Res> {
  _$EpsgJsonResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EpsgJsonResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bbox = null,
  }) {
    return _then(_value.copyWith(
      bbox: null == bbox
          ? _value.bbox
          : bbox // ignore: cast_nullable_to_non_nullable
              as BboxResp,
    ) as $Val);
  }

  /// Create a copy of EpsgJsonResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BboxRespCopyWith<$Res> get bbox {
    return $BboxRespCopyWith<$Res>(_value.bbox, (value) {
      return _then(_value.copyWith(bbox: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EpsgJsonResponseImplCopyWith<$Res>
    implements $EpsgJsonResponseCopyWith<$Res> {
  factory _$$EpsgJsonResponseImplCopyWith(_$EpsgJsonResponseImpl value,
          $Res Function(_$EpsgJsonResponseImpl) then) =
      __$$EpsgJsonResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BboxResp bbox});

  @override
  $BboxRespCopyWith<$Res> get bbox;
}

/// @nodoc
class __$$EpsgJsonResponseImplCopyWithImpl<$Res>
    extends _$EpsgJsonResponseCopyWithImpl<$Res, _$EpsgJsonResponseImpl>
    implements _$$EpsgJsonResponseImplCopyWith<$Res> {
  __$$EpsgJsonResponseImplCopyWithImpl(_$EpsgJsonResponseImpl _value,
      $Res Function(_$EpsgJsonResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of EpsgJsonResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bbox = null,
  }) {
    return _then(_$EpsgJsonResponseImpl(
      bbox: null == bbox
          ? _value.bbox
          : bbox // ignore: cast_nullable_to_non_nullable
              as BboxResp,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EpsgJsonResponseImpl implements _EpsgJsonResponse {
  const _$EpsgJsonResponseImpl({required this.bbox});

  factory _$EpsgJsonResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$EpsgJsonResponseImplFromJson(json);

  @override
  final BboxResp bbox;

  @override
  String toString() {
    return 'EpsgJsonResponse(bbox: $bbox)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EpsgJsonResponseImpl &&
            (identical(other.bbox, bbox) || other.bbox == bbox));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, bbox);

  /// Create a copy of EpsgJsonResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EpsgJsonResponseImplCopyWith<_$EpsgJsonResponseImpl> get copyWith =>
      __$$EpsgJsonResponseImplCopyWithImpl<_$EpsgJsonResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EpsgJsonResponseImplToJson(
      this,
    );
  }
}

abstract class _EpsgJsonResponse implements EpsgJsonResponse {
  const factory _EpsgJsonResponse({required final BboxResp bbox}) =
      _$EpsgJsonResponseImpl;

  factory _EpsgJsonResponse.fromJson(Map<String, dynamic> json) =
      _$EpsgJsonResponseImpl.fromJson;

  @override
  BboxResp get bbox;

  /// Create a copy of EpsgJsonResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EpsgJsonResponseImplCopyWith<_$EpsgJsonResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BboxResp _$BboxRespFromJson(Map<String, dynamic> json) {
  return _Bbox.fromJson(json);
}

/// @nodoc
mixin _$BboxResp {
  double get southLatitude => throw _privateConstructorUsedError;
  double get westLongitude => throw _privateConstructorUsedError;
  double get northLatitude => throw _privateConstructorUsedError;
  double get eastLongitude => throw _privateConstructorUsedError;

  /// Serializes this BboxResp to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BboxResp
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BboxRespCopyWith<BboxResp> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BboxRespCopyWith<$Res> {
  factory $BboxRespCopyWith(BboxResp value, $Res Function(BboxResp) then) =
      _$BboxRespCopyWithImpl<$Res, BboxResp>;
  @useResult
  $Res call(
      {double southLatitude,
      double westLongitude,
      double northLatitude,
      double eastLongitude});
}

/// @nodoc
class _$BboxRespCopyWithImpl<$Res, $Val extends BboxResp>
    implements $BboxRespCopyWith<$Res> {
  _$BboxRespCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BboxResp
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? southLatitude = null,
    Object? westLongitude = null,
    Object? northLatitude = null,
    Object? eastLongitude = null,
  }) {
    return _then(_value.copyWith(
      southLatitude: null == southLatitude
          ? _value.southLatitude
          : southLatitude // ignore: cast_nullable_to_non_nullable
              as double,
      westLongitude: null == westLongitude
          ? _value.westLongitude
          : westLongitude // ignore: cast_nullable_to_non_nullable
              as double,
      northLatitude: null == northLatitude
          ? _value.northLatitude
          : northLatitude // ignore: cast_nullable_to_non_nullable
              as double,
      eastLongitude: null == eastLongitude
          ? _value.eastLongitude
          : eastLongitude // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BboxImplCopyWith<$Res> implements $BboxRespCopyWith<$Res> {
  factory _$$BboxImplCopyWith(
          _$BboxImpl value, $Res Function(_$BboxImpl) then) =
      __$$BboxImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double southLatitude,
      double westLongitude,
      double northLatitude,
      double eastLongitude});
}

/// @nodoc
class __$$BboxImplCopyWithImpl<$Res>
    extends _$BboxRespCopyWithImpl<$Res, _$BboxImpl>
    implements _$$BboxImplCopyWith<$Res> {
  __$$BboxImplCopyWithImpl(_$BboxImpl _value, $Res Function(_$BboxImpl) _then)
      : super(_value, _then);

  /// Create a copy of BboxResp
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? southLatitude = null,
    Object? westLongitude = null,
    Object? northLatitude = null,
    Object? eastLongitude = null,
  }) {
    return _then(_$BboxImpl(
      southLatitude: null == southLatitude
          ? _value.southLatitude
          : southLatitude // ignore: cast_nullable_to_non_nullable
              as double,
      westLongitude: null == westLongitude
          ? _value.westLongitude
          : westLongitude // ignore: cast_nullable_to_non_nullable
              as double,
      northLatitude: null == northLatitude
          ? _value.northLatitude
          : northLatitude // ignore: cast_nullable_to_non_nullable
              as double,
      eastLongitude: null == eastLongitude
          ? _value.eastLongitude
          : eastLongitude // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$BboxImpl implements _Bbox {
  const _$BboxImpl(
      {required this.southLatitude,
      required this.westLongitude,
      required this.northLatitude,
      required this.eastLongitude});

  factory _$BboxImpl.fromJson(Map<String, dynamic> json) =>
      _$$BboxImplFromJson(json);

  @override
  final double southLatitude;
  @override
  final double westLongitude;
  @override
  final double northLatitude;
  @override
  final double eastLongitude;

  @override
  String toString() {
    return 'BboxResp(southLatitude: $southLatitude, westLongitude: $westLongitude, northLatitude: $northLatitude, eastLongitude: $eastLongitude)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BboxImpl &&
            (identical(other.southLatitude, southLatitude) ||
                other.southLatitude == southLatitude) &&
            (identical(other.westLongitude, westLongitude) ||
                other.westLongitude == westLongitude) &&
            (identical(other.northLatitude, northLatitude) ||
                other.northLatitude == northLatitude) &&
            (identical(other.eastLongitude, eastLongitude) ||
                other.eastLongitude == eastLongitude));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, southLatitude, westLongitude, northLatitude, eastLongitude);

  /// Create a copy of BboxResp
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BboxImplCopyWith<_$BboxImpl> get copyWith =>
      __$$BboxImplCopyWithImpl<_$BboxImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BboxImplToJson(
      this,
    );
  }
}

abstract class _Bbox implements BboxResp {
  const factory _Bbox(
      {required final double southLatitude,
      required final double westLongitude,
      required final double northLatitude,
      required final double eastLongitude}) = _$BboxImpl;

  factory _Bbox.fromJson(Map<String, dynamic> json) = _$BboxImpl.fromJson;

  @override
  double get southLatitude;
  @override
  double get westLongitude;
  @override
  double get northLatitude;
  @override
  double get eastLongitude;

  /// Create a copy of BboxResp
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BboxImplCopyWith<_$BboxImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
