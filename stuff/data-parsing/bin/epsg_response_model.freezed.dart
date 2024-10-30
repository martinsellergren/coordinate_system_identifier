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
  @JsonKey(name: 'coordinate_system')
  CoordinateSystemResp? get coordinateSystem =>
      throw _privateConstructorUsedError;

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
  $Res call(
      {BboxResp bbox,
      @JsonKey(name: 'coordinate_system')
      CoordinateSystemResp? coordinateSystem});

  $BboxRespCopyWith<$Res> get bbox;
  $CoordinateSystemRespCopyWith<$Res>? get coordinateSystem;
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
    Object? coordinateSystem = freezed,
  }) {
    return _then(_value.copyWith(
      bbox: null == bbox
          ? _value.bbox
          : bbox // ignore: cast_nullable_to_non_nullable
              as BboxResp,
      coordinateSystem: freezed == coordinateSystem
          ? _value.coordinateSystem
          : coordinateSystem // ignore: cast_nullable_to_non_nullable
              as CoordinateSystemResp?,
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

  /// Create a copy of EpsgJsonResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CoordinateSystemRespCopyWith<$Res>? get coordinateSystem {
    if (_value.coordinateSystem == null) {
      return null;
    }

    return $CoordinateSystemRespCopyWith<$Res>(_value.coordinateSystem!,
        (value) {
      return _then(_value.copyWith(coordinateSystem: value) as $Val);
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
  $Res call(
      {BboxResp bbox,
      @JsonKey(name: 'coordinate_system')
      CoordinateSystemResp? coordinateSystem});

  @override
  $BboxRespCopyWith<$Res> get bbox;
  @override
  $CoordinateSystemRespCopyWith<$Res>? get coordinateSystem;
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
    Object? coordinateSystem = freezed,
  }) {
    return _then(_$EpsgJsonResponseImpl(
      bbox: null == bbox
          ? _value.bbox
          : bbox // ignore: cast_nullable_to_non_nullable
              as BboxResp,
      coordinateSystem: freezed == coordinateSystem
          ? _value.coordinateSystem
          : coordinateSystem // ignore: cast_nullable_to_non_nullable
              as CoordinateSystemResp?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EpsgJsonResponseImpl implements _EpsgJsonResponse {
  const _$EpsgJsonResponseImpl(
      {required this.bbox,
      @JsonKey(name: 'coordinate_system') this.coordinateSystem});

  factory _$EpsgJsonResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$EpsgJsonResponseImplFromJson(json);

  @override
  final BboxResp bbox;
  @override
  @JsonKey(name: 'coordinate_system')
  final CoordinateSystemResp? coordinateSystem;

  @override
  String toString() {
    return 'EpsgJsonResponse(bbox: $bbox, coordinateSystem: $coordinateSystem)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EpsgJsonResponseImpl &&
            (identical(other.bbox, bbox) || other.bbox == bbox) &&
            (identical(other.coordinateSystem, coordinateSystem) ||
                other.coordinateSystem == coordinateSystem));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, bbox, coordinateSystem);

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
  const factory _EpsgJsonResponse(
      {required final BboxResp bbox,
      @JsonKey(name: 'coordinate_system')
      final CoordinateSystemResp? coordinateSystem}) = _$EpsgJsonResponseImpl;

  factory _EpsgJsonResponse.fromJson(Map<String, dynamic> json) =
      _$EpsgJsonResponseImpl.fromJson;

  @override
  BboxResp get bbox;
  @override
  @JsonKey(name: 'coordinate_system')
  CoordinateSystemResp? get coordinateSystem;

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

CoordinateSystemResp _$CoordinateSystemRespFromJson(Map<String, dynamic> json) {
  return _CoordinateSystemResp.fromJson(json);
}

/// @nodoc
mixin _$CoordinateSystemResp {
  List<AxisResp>? get axis => throw _privateConstructorUsedError;

  /// Serializes this CoordinateSystemResp to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CoordinateSystemResp
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CoordinateSystemRespCopyWith<CoordinateSystemResp> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoordinateSystemRespCopyWith<$Res> {
  factory $CoordinateSystemRespCopyWith(CoordinateSystemResp value,
          $Res Function(CoordinateSystemResp) then) =
      _$CoordinateSystemRespCopyWithImpl<$Res, CoordinateSystemResp>;
  @useResult
  $Res call({List<AxisResp>? axis});
}

/// @nodoc
class _$CoordinateSystemRespCopyWithImpl<$Res,
        $Val extends CoordinateSystemResp>
    implements $CoordinateSystemRespCopyWith<$Res> {
  _$CoordinateSystemRespCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CoordinateSystemResp
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? axis = freezed,
  }) {
    return _then(_value.copyWith(
      axis: freezed == axis
          ? _value.axis
          : axis // ignore: cast_nullable_to_non_nullable
              as List<AxisResp>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CoordinateSystemRespImplCopyWith<$Res>
    implements $CoordinateSystemRespCopyWith<$Res> {
  factory _$$CoordinateSystemRespImplCopyWith(_$CoordinateSystemRespImpl value,
          $Res Function(_$CoordinateSystemRespImpl) then) =
      __$$CoordinateSystemRespImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<AxisResp>? axis});
}

/// @nodoc
class __$$CoordinateSystemRespImplCopyWithImpl<$Res>
    extends _$CoordinateSystemRespCopyWithImpl<$Res, _$CoordinateSystemRespImpl>
    implements _$$CoordinateSystemRespImplCopyWith<$Res> {
  __$$CoordinateSystemRespImplCopyWithImpl(_$CoordinateSystemRespImpl _value,
      $Res Function(_$CoordinateSystemRespImpl) _then)
      : super(_value, _then);

  /// Create a copy of CoordinateSystemResp
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? axis = freezed,
  }) {
    return _then(_$CoordinateSystemRespImpl(
      axis: freezed == axis
          ? _value._axis
          : axis // ignore: cast_nullable_to_non_nullable
              as List<AxisResp>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CoordinateSystemRespImpl implements _CoordinateSystemResp {
  const _$CoordinateSystemRespImpl({final List<AxisResp>? axis}) : _axis = axis;

  factory _$CoordinateSystemRespImpl.fromJson(Map<String, dynamic> json) =>
      _$$CoordinateSystemRespImplFromJson(json);

  final List<AxisResp>? _axis;
  @override
  List<AxisResp>? get axis {
    final value = _axis;
    if (value == null) return null;
    if (_axis is EqualUnmodifiableListView) return _axis;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CoordinateSystemResp(axis: $axis)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CoordinateSystemRespImpl &&
            const DeepCollectionEquality().equals(other._axis, _axis));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_axis));

  /// Create a copy of CoordinateSystemResp
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CoordinateSystemRespImplCopyWith<_$CoordinateSystemRespImpl>
      get copyWith =>
          __$$CoordinateSystemRespImplCopyWithImpl<_$CoordinateSystemRespImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CoordinateSystemRespImplToJson(
      this,
    );
  }
}

abstract class _CoordinateSystemResp implements CoordinateSystemResp {
  const factory _CoordinateSystemResp({final List<AxisResp>? axis}) =
      _$CoordinateSystemRespImpl;

  factory _CoordinateSystemResp.fromJson(Map<String, dynamic> json) =
      _$CoordinateSystemRespImpl.fromJson;

  @override
  List<AxisResp>? get axis;

  /// Create a copy of CoordinateSystemResp
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CoordinateSystemRespImplCopyWith<_$CoordinateSystemRespImpl>
      get copyWith => throw _privateConstructorUsedError;
}

AxisResp _$AxisRespFromJson(Map<String, dynamic> json) {
  return _AxisResp.fromJson(json);
}

/// @nodoc
mixin _$AxisResp {
  Object? get unit => throw _privateConstructorUsedError;

  /// Serializes this AxisResp to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AxisResp
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AxisRespCopyWith<AxisResp> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AxisRespCopyWith<$Res> {
  factory $AxisRespCopyWith(AxisResp value, $Res Function(AxisResp) then) =
      _$AxisRespCopyWithImpl<$Res, AxisResp>;
  @useResult
  $Res call({Object? unit});
}

/// @nodoc
class _$AxisRespCopyWithImpl<$Res, $Val extends AxisResp>
    implements $AxisRespCopyWith<$Res> {
  _$AxisRespCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AxisResp
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? unit = freezed,
  }) {
    return _then(_value.copyWith(
      unit: freezed == unit ? _value.unit : unit,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AxisRespImplCopyWith<$Res>
    implements $AxisRespCopyWith<$Res> {
  factory _$$AxisRespImplCopyWith(
          _$AxisRespImpl value, $Res Function(_$AxisRespImpl) then) =
      __$$AxisRespImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Object? unit});
}

/// @nodoc
class __$$AxisRespImplCopyWithImpl<$Res>
    extends _$AxisRespCopyWithImpl<$Res, _$AxisRespImpl>
    implements _$$AxisRespImplCopyWith<$Res> {
  __$$AxisRespImplCopyWithImpl(
      _$AxisRespImpl _value, $Res Function(_$AxisRespImpl) _then)
      : super(_value, _then);

  /// Create a copy of AxisResp
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? unit = freezed,
  }) {
    return _then(_$AxisRespImpl(
      unit: freezed == unit ? _value.unit : unit,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AxisRespImpl implements _AxisResp {
  const _$AxisRespImpl({this.unit});

  factory _$AxisRespImpl.fromJson(Map<String, dynamic> json) =>
      _$$AxisRespImplFromJson(json);

  @override
  final Object? unit;

  @override
  String toString() {
    return 'AxisResp(unit: $unit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AxisRespImpl &&
            const DeepCollectionEquality().equals(other.unit, unit));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(unit));

  /// Create a copy of AxisResp
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AxisRespImplCopyWith<_$AxisRespImpl> get copyWith =>
      __$$AxisRespImplCopyWithImpl<_$AxisRespImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AxisRespImplToJson(
      this,
    );
  }
}

abstract class _AxisResp implements AxisResp {
  const factory _AxisResp({final Object? unit}) = _$AxisRespImpl;

  factory _AxisResp.fromJson(Map<String, dynamic> json) =
      _$AxisRespImpl.fromJson;

  @override
  Object? get unit;

  /// Create a copy of AxisResp
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AxisRespImplCopyWith<_$AxisRespImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
