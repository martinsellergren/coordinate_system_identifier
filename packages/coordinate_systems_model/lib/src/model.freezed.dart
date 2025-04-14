// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CoordinateSystemsData _$CoordinateSystemsDataFromJson(
  Map<String, dynamic> json,
) {
  return _Data.fromJson(json);
}

/// @nodoc
mixin _$CoordinateSystemsData {
  List<CoordinateSystem> get items => throw _privateConstructorUsedError;

  /// Serializes this CoordinateSystemsData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CoordinateSystemsData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CoordinateSystemsDataCopyWith<CoordinateSystemsData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoordinateSystemsDataCopyWith<$Res> {
  factory $CoordinateSystemsDataCopyWith(
    CoordinateSystemsData value,
    $Res Function(CoordinateSystemsData) then,
  ) = _$CoordinateSystemsDataCopyWithImpl<$Res, CoordinateSystemsData>;
  @useResult
  $Res call({List<CoordinateSystem> items});
}

/// @nodoc
class _$CoordinateSystemsDataCopyWithImpl<
  $Res,
  $Val extends CoordinateSystemsData
>
    implements $CoordinateSystemsDataCopyWith<$Res> {
  _$CoordinateSystemsDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CoordinateSystemsData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? items = null}) {
    return _then(
      _value.copyWith(
            items:
                null == items
                    ? _value.items
                    : items // ignore: cast_nullable_to_non_nullable
                        as List<CoordinateSystem>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DataImplCopyWith<$Res>
    implements $CoordinateSystemsDataCopyWith<$Res> {
  factory _$$DataImplCopyWith(
    _$DataImpl value,
    $Res Function(_$DataImpl) then,
  ) = __$$DataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CoordinateSystem> items});
}

/// @nodoc
class __$$DataImplCopyWithImpl<$Res>
    extends _$CoordinateSystemsDataCopyWithImpl<$Res, _$DataImpl>
    implements _$$DataImplCopyWith<$Res> {
  __$$DataImplCopyWithImpl(_$DataImpl _value, $Res Function(_$DataImpl) _then)
    : super(_value, _then);

  /// Create a copy of CoordinateSystemsData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? items = null}) {
    return _then(
      _$DataImpl(
        items:
            null == items
                ? _value._items
                : items // ignore: cast_nullable_to_non_nullable
                    as List<CoordinateSystem>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DataImpl implements _Data {
  const _$DataImpl({required final List<CoordinateSystem> items})
    : _items = items;

  factory _$DataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataImplFromJson(json);

  final List<CoordinateSystem> _items;
  @override
  List<CoordinateSystem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'CoordinateSystemsData(items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataImpl &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  /// Create a copy of CoordinateSystemsData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      __$$DataImplCopyWithImpl<_$DataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DataImplToJson(this);
  }
}

abstract class _Data implements CoordinateSystemsData {
  const factory _Data({required final List<CoordinateSystem> items}) =
      _$DataImpl;

  factory _Data.fromJson(Map<String, dynamic> json) = _$DataImpl.fromJson;

  @override
  List<CoordinateSystem> get items;

  /// Create a copy of CoordinateSystemsData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DataImplCopyWith<_$DataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CoordinateSystem _$CoordinateSystemFromJson(Map<String, dynamic> json) {
  return _CoordinateSystem.fromJson(json);
}

/// @nodoc
mixin _$CoordinateSystem {
  int get epsgCode => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get proj4 => throw _privateConstructorUsedError;
  Bounds get bounds => throw _privateConstructorUsedError;
  bool get hasNadgrid => throw _privateConstructorUsedError;

  /// Serializes this CoordinateSystem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CoordinateSystem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CoordinateSystemCopyWith<CoordinateSystem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoordinateSystemCopyWith<$Res> {
  factory $CoordinateSystemCopyWith(
    CoordinateSystem value,
    $Res Function(CoordinateSystem) then,
  ) = _$CoordinateSystemCopyWithImpl<$Res, CoordinateSystem>;
  @useResult
  $Res call({
    int epsgCode,
    String name,
    String proj4,
    Bounds bounds,
    bool hasNadgrid,
  });

  $BoundsCopyWith<$Res> get bounds;
}

/// @nodoc
class _$CoordinateSystemCopyWithImpl<$Res, $Val extends CoordinateSystem>
    implements $CoordinateSystemCopyWith<$Res> {
  _$CoordinateSystemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CoordinateSystem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? epsgCode = null,
    Object? name = null,
    Object? proj4 = null,
    Object? bounds = null,
    Object? hasNadgrid = null,
  }) {
    return _then(
      _value.copyWith(
            epsgCode:
                null == epsgCode
                    ? _value.epsgCode
                    : epsgCode // ignore: cast_nullable_to_non_nullable
                        as int,
            name:
                null == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String,
            proj4:
                null == proj4
                    ? _value.proj4
                    : proj4 // ignore: cast_nullable_to_non_nullable
                        as String,
            bounds:
                null == bounds
                    ? _value.bounds
                    : bounds // ignore: cast_nullable_to_non_nullable
                        as Bounds,
            hasNadgrid:
                null == hasNadgrid
                    ? _value.hasNadgrid
                    : hasNadgrid // ignore: cast_nullable_to_non_nullable
                        as bool,
          )
          as $Val,
    );
  }

  /// Create a copy of CoordinateSystem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BoundsCopyWith<$Res> get bounds {
    return $BoundsCopyWith<$Res>(_value.bounds, (value) {
      return _then(_value.copyWith(bounds: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CoordinateSystemImplCopyWith<$Res>
    implements $CoordinateSystemCopyWith<$Res> {
  factory _$$CoordinateSystemImplCopyWith(
    _$CoordinateSystemImpl value,
    $Res Function(_$CoordinateSystemImpl) then,
  ) = __$$CoordinateSystemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int epsgCode,
    String name,
    String proj4,
    Bounds bounds,
    bool hasNadgrid,
  });

  @override
  $BoundsCopyWith<$Res> get bounds;
}

/// @nodoc
class __$$CoordinateSystemImplCopyWithImpl<$Res>
    extends _$CoordinateSystemCopyWithImpl<$Res, _$CoordinateSystemImpl>
    implements _$$CoordinateSystemImplCopyWith<$Res> {
  __$$CoordinateSystemImplCopyWithImpl(
    _$CoordinateSystemImpl _value,
    $Res Function(_$CoordinateSystemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CoordinateSystem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? epsgCode = null,
    Object? name = null,
    Object? proj4 = null,
    Object? bounds = null,
    Object? hasNadgrid = null,
  }) {
    return _then(
      _$CoordinateSystemImpl(
        epsgCode:
            null == epsgCode
                ? _value.epsgCode
                : epsgCode // ignore: cast_nullable_to_non_nullable
                    as int,
        name:
            null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String,
        proj4:
            null == proj4
                ? _value.proj4
                : proj4 // ignore: cast_nullable_to_non_nullable
                    as String,
        bounds:
            null == bounds
                ? _value.bounds
                : bounds // ignore: cast_nullable_to_non_nullable
                    as Bounds,
        hasNadgrid:
            null == hasNadgrid
                ? _value.hasNadgrid
                : hasNadgrid // ignore: cast_nullable_to_non_nullable
                    as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CoordinateSystemImpl implements _CoordinateSystem {
  const _$CoordinateSystemImpl({
    required this.epsgCode,
    required this.name,
    required this.proj4,
    required this.bounds,
    this.hasNadgrid = false,
  });

  factory _$CoordinateSystemImpl.fromJson(Map<String, dynamic> json) =>
      _$$CoordinateSystemImplFromJson(json);

  @override
  final int epsgCode;
  @override
  final String name;
  @override
  final String proj4;
  @override
  final Bounds bounds;
  @override
  @JsonKey()
  final bool hasNadgrid;

  @override
  String toString() {
    return 'CoordinateSystem(epsgCode: $epsgCode, name: $name, proj4: $proj4, bounds: $bounds, hasNadgrid: $hasNadgrid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CoordinateSystemImpl &&
            (identical(other.epsgCode, epsgCode) ||
                other.epsgCode == epsgCode) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.proj4, proj4) || other.proj4 == proj4) &&
            (identical(other.bounds, bounds) || other.bounds == bounds) &&
            (identical(other.hasNadgrid, hasNadgrid) ||
                other.hasNadgrid == hasNadgrid));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, epsgCode, name, proj4, bounds, hasNadgrid);

  /// Create a copy of CoordinateSystem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CoordinateSystemImplCopyWith<_$CoordinateSystemImpl> get copyWith =>
      __$$CoordinateSystemImplCopyWithImpl<_$CoordinateSystemImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CoordinateSystemImplToJson(this);
  }
}

abstract class _CoordinateSystem implements CoordinateSystem {
  const factory _CoordinateSystem({
    required final int epsgCode,
    required final String name,
    required final String proj4,
    required final Bounds bounds,
    final bool hasNadgrid,
  }) = _$CoordinateSystemImpl;

  factory _CoordinateSystem.fromJson(Map<String, dynamic> json) =
      _$CoordinateSystemImpl.fromJson;

  @override
  int get epsgCode;
  @override
  String get name;
  @override
  String get proj4;
  @override
  Bounds get bounds;
  @override
  bool get hasNadgrid;

  /// Create a copy of CoordinateSystem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CoordinateSystemImplCopyWith<_$CoordinateSystemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Bounds _$BoundsFromJson(Map<String, dynamic> json) {
  return _Bounds.fromJson(json);
}

/// @nodoc
mixin _$Bounds {
  LonLat get northEast => throw _privateConstructorUsedError;
  LonLat get southWest => throw _privateConstructorUsedError;

  /// Serializes this Bounds to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Bounds
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BoundsCopyWith<Bounds> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BoundsCopyWith<$Res> {
  factory $BoundsCopyWith(Bounds value, $Res Function(Bounds) then) =
      _$BoundsCopyWithImpl<$Res, Bounds>;
  @useResult
  $Res call({LonLat northEast, LonLat southWest});

  $LonLatCopyWith<$Res> get northEast;
  $LonLatCopyWith<$Res> get southWest;
}

/// @nodoc
class _$BoundsCopyWithImpl<$Res, $Val extends Bounds>
    implements $BoundsCopyWith<$Res> {
  _$BoundsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Bounds
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? northEast = null, Object? southWest = null}) {
    return _then(
      _value.copyWith(
            northEast:
                null == northEast
                    ? _value.northEast
                    : northEast // ignore: cast_nullable_to_non_nullable
                        as LonLat,
            southWest:
                null == southWest
                    ? _value.southWest
                    : southWest // ignore: cast_nullable_to_non_nullable
                        as LonLat,
          )
          as $Val,
    );
  }

  /// Create a copy of Bounds
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LonLatCopyWith<$Res> get northEast {
    return $LonLatCopyWith<$Res>(_value.northEast, (value) {
      return _then(_value.copyWith(northEast: value) as $Val);
    });
  }

  /// Create a copy of Bounds
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LonLatCopyWith<$Res> get southWest {
    return $LonLatCopyWith<$Res>(_value.southWest, (value) {
      return _then(_value.copyWith(southWest: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BoundsImplCopyWith<$Res> implements $BoundsCopyWith<$Res> {
  factory _$$BoundsImplCopyWith(
    _$BoundsImpl value,
    $Res Function(_$BoundsImpl) then,
  ) = __$$BoundsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({LonLat northEast, LonLat southWest});

  @override
  $LonLatCopyWith<$Res> get northEast;
  @override
  $LonLatCopyWith<$Res> get southWest;
}

/// @nodoc
class __$$BoundsImplCopyWithImpl<$Res>
    extends _$BoundsCopyWithImpl<$Res, _$BoundsImpl>
    implements _$$BoundsImplCopyWith<$Res> {
  __$$BoundsImplCopyWithImpl(
    _$BoundsImpl _value,
    $Res Function(_$BoundsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Bounds
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? northEast = null, Object? southWest = null}) {
    return _then(
      _$BoundsImpl(
        northEast:
            null == northEast
                ? _value.northEast
                : northEast // ignore: cast_nullable_to_non_nullable
                    as LonLat,
        southWest:
            null == southWest
                ? _value.southWest
                : southWest // ignore: cast_nullable_to_non_nullable
                    as LonLat,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BoundsImpl implements _Bounds {
  const _$BoundsImpl({required this.northEast, required this.southWest});

  factory _$BoundsImpl.fromJson(Map<String, dynamic> json) =>
      _$$BoundsImplFromJson(json);

  @override
  final LonLat northEast;
  @override
  final LonLat southWest;

  @override
  String toString() {
    return 'Bounds(northEast: $northEast, southWest: $southWest)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BoundsImpl &&
            (identical(other.northEast, northEast) ||
                other.northEast == northEast) &&
            (identical(other.southWest, southWest) ||
                other.southWest == southWest));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, northEast, southWest);

  /// Create a copy of Bounds
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BoundsImplCopyWith<_$BoundsImpl> get copyWith =>
      __$$BoundsImplCopyWithImpl<_$BoundsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BoundsImplToJson(this);
  }
}

abstract class _Bounds implements Bounds {
  const factory _Bounds({
    required final LonLat northEast,
    required final LonLat southWest,
  }) = _$BoundsImpl;

  factory _Bounds.fromJson(Map<String, dynamic> json) = _$BoundsImpl.fromJson;

  @override
  LonLat get northEast;
  @override
  LonLat get southWest;

  /// Create a copy of Bounds
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BoundsImplCopyWith<_$BoundsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LonLat _$LonLatFromJson(Map<String, dynamic> json) {
  return _LonLat.fromJson(json);
}

/// @nodoc
mixin _$LonLat {
  double get lon => throw _privateConstructorUsedError;
  double get lat => throw _privateConstructorUsedError;

  /// Serializes this LonLat to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LonLat
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LonLatCopyWith<LonLat> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LonLatCopyWith<$Res> {
  factory $LonLatCopyWith(LonLat value, $Res Function(LonLat) then) =
      _$LonLatCopyWithImpl<$Res, LonLat>;
  @useResult
  $Res call({double lon, double lat});
}

/// @nodoc
class _$LonLatCopyWithImpl<$Res, $Val extends LonLat>
    implements $LonLatCopyWith<$Res> {
  _$LonLatCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LonLat
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? lon = null, Object? lat = null}) {
    return _then(
      _value.copyWith(
            lon:
                null == lon
                    ? _value.lon
                    : lon // ignore: cast_nullable_to_non_nullable
                        as double,
            lat:
                null == lat
                    ? _value.lat
                    : lat // ignore: cast_nullable_to_non_nullable
                        as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LonLatImplCopyWith<$Res> implements $LonLatCopyWith<$Res> {
  factory _$$LonLatImplCopyWith(
    _$LonLatImpl value,
    $Res Function(_$LonLatImpl) then,
  ) = __$$LonLatImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double lon, double lat});
}

/// @nodoc
class __$$LonLatImplCopyWithImpl<$Res>
    extends _$LonLatCopyWithImpl<$Res, _$LonLatImpl>
    implements _$$LonLatImplCopyWith<$Res> {
  __$$LonLatImplCopyWithImpl(
    _$LonLatImpl _value,
    $Res Function(_$LonLatImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LonLat
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? lon = null, Object? lat = null}) {
    return _then(
      _$LonLatImpl(
        lon:
            null == lon
                ? _value.lon
                : lon // ignore: cast_nullable_to_non_nullable
                    as double,
        lat:
            null == lat
                ? _value.lat
                : lat // ignore: cast_nullable_to_non_nullable
                    as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LonLatImpl implements _LonLat {
  const _$LonLatImpl({required this.lon, required this.lat});

  factory _$LonLatImpl.fromJson(Map<String, dynamic> json) =>
      _$$LonLatImplFromJson(json);

  @override
  final double lon;
  @override
  final double lat;

  @override
  String toString() {
    return 'LonLat(lon: $lon, lat: $lat)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LonLatImpl &&
            (identical(other.lon, lon) || other.lon == lon) &&
            (identical(other.lat, lat) || other.lat == lat));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, lon, lat);

  /// Create a copy of LonLat
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LonLatImplCopyWith<_$LonLatImpl> get copyWith =>
      __$$LonLatImplCopyWithImpl<_$LonLatImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LonLatImplToJson(this);
  }
}

abstract class _LonLat implements LonLat {
  const factory _LonLat({
    required final double lon,
    required final double lat,
  }) = _$LonLatImpl;

  factory _LonLat.fromJson(Map<String, dynamic> json) = _$LonLatImpl.fromJson;

  @override
  double get lon;
  @override
  double get lat;

  /// Create a copy of LonLat
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LonLatImplCopyWith<_$LonLatImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
