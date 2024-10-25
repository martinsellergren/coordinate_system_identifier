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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Point {
  double get x => throw _privateConstructorUsedError;
  double get y => throw _privateConstructorUsedError;

  /// Create a copy of Point
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PointCopyWith<Point> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PointCopyWith<$Res> {
  factory $PointCopyWith(Point value, $Res Function(Point) then) =
      _$PointCopyWithImpl<$Res, Point>;
  @useResult
  $Res call({double x, double y});
}

/// @nodoc
class _$PointCopyWithImpl<$Res, $Val extends Point>
    implements $PointCopyWith<$Res> {
  _$PointCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Point
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? x = null,
    Object? y = null,
  }) {
    return _then(_value.copyWith(
      x: null == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as double,
      y: null == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PointImplCopyWith<$Res> implements $PointCopyWith<$Res> {
  factory _$$PointImplCopyWith(
          _$PointImpl value, $Res Function(_$PointImpl) then) =
      __$$PointImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double x, double y});
}

/// @nodoc
class __$$PointImplCopyWithImpl<$Res>
    extends _$PointCopyWithImpl<$Res, _$PointImpl>
    implements _$$PointImplCopyWith<$Res> {
  __$$PointImplCopyWithImpl(
      _$PointImpl _value, $Res Function(_$PointImpl) _then)
      : super(_value, _then);

  /// Create a copy of Point
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? x = null,
    Object? y = null,
  }) {
    return _then(_$PointImpl(
      x: null == x
          ? _value.x
          : x // ignore: cast_nullable_to_non_nullable
              as double,
      y: null == y
          ? _value.y
          : y // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$PointImpl implements _Point {
  const _$PointImpl({required this.x, required this.y});

  @override
  final double x;
  @override
  final double y;

  @override
  String toString() {
    return 'Point(x: $x, y: $y)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PointImpl &&
            (identical(other.x, x) || other.x == x) &&
            (identical(other.y, y) || other.y == y));
  }

  @override
  int get hashCode => Object.hash(runtimeType, x, y);

  /// Create a copy of Point
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PointImplCopyWith<_$PointImpl> get copyWith =>
      __$$PointImplCopyWithImpl<_$PointImpl>(this, _$identity);
}

abstract class _Point implements Point {
  const factory _Point({required final double x, required final double y}) =
      _$PointImpl;

  @override
  double get x;
  @override
  double get y;

  /// Create a copy of Point
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PointImplCopyWith<_$PointImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PointDetails {
  Point get point => throw _privateConstructorUsedError;
  Map<CoordinateSystem, LonLat> get lonLats =>
      throw _privateConstructorUsedError;

  /// Create a copy of PointDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PointDetailsCopyWith<PointDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PointDetailsCopyWith<$Res> {
  factory $PointDetailsCopyWith(
          PointDetails value, $Res Function(PointDetails) then) =
      _$PointDetailsCopyWithImpl<$Res, PointDetails>;
  @useResult
  $Res call({Point point, Map<CoordinateSystem, LonLat> lonLats});

  $PointCopyWith<$Res> get point;
}

/// @nodoc
class _$PointDetailsCopyWithImpl<$Res, $Val extends PointDetails>
    implements $PointDetailsCopyWith<$Res> {
  _$PointDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PointDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? point = null,
    Object? lonLats = null,
  }) {
    return _then(_value.copyWith(
      point: null == point
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as Point,
      lonLats: null == lonLats
          ? _value.lonLats
          : lonLats // ignore: cast_nullable_to_non_nullable
              as Map<CoordinateSystem, LonLat>,
    ) as $Val);
  }

  /// Create a copy of PointDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PointCopyWith<$Res> get point {
    return $PointCopyWith<$Res>(_value.point, (value) {
      return _then(_value.copyWith(point: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PointDetailsImplCopyWith<$Res>
    implements $PointDetailsCopyWith<$Res> {
  factory _$$PointDetailsImplCopyWith(
          _$PointDetailsImpl value, $Res Function(_$PointDetailsImpl) then) =
      __$$PointDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Point point, Map<CoordinateSystem, LonLat> lonLats});

  @override
  $PointCopyWith<$Res> get point;
}

/// @nodoc
class __$$PointDetailsImplCopyWithImpl<$Res>
    extends _$PointDetailsCopyWithImpl<$Res, _$PointDetailsImpl>
    implements _$$PointDetailsImplCopyWith<$Res> {
  __$$PointDetailsImplCopyWithImpl(
      _$PointDetailsImpl _value, $Res Function(_$PointDetailsImpl) _then)
      : super(_value, _then);

  /// Create a copy of PointDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? point = null,
    Object? lonLats = null,
  }) {
    return _then(_$PointDetailsImpl(
      point: null == point
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as Point,
      lonLats: null == lonLats
          ? _value._lonLats
          : lonLats // ignore: cast_nullable_to_non_nullable
              as Map<CoordinateSystem, LonLat>,
    ));
  }
}

/// @nodoc

class _$PointDetailsImpl implements _PointDetails {
  const _$PointDetailsImpl(
      {required this.point,
      required final Map<CoordinateSystem, LonLat> lonLats})
      : _lonLats = lonLats;

  @override
  final Point point;
  final Map<CoordinateSystem, LonLat> _lonLats;
  @override
  Map<CoordinateSystem, LonLat> get lonLats {
    if (_lonLats is EqualUnmodifiableMapView) return _lonLats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_lonLats);
  }

  @override
  String toString() {
    return 'PointDetails(point: $point, lonLats: $lonLats)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PointDetailsImpl &&
            (identical(other.point, point) || other.point == point) &&
            const DeepCollectionEquality().equals(other._lonLats, _lonLats));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, point, const DeepCollectionEquality().hash(_lonLats));

  /// Create a copy of PointDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PointDetailsImplCopyWith<_$PointDetailsImpl> get copyWith =>
      __$$PointDetailsImplCopyWithImpl<_$PointDetailsImpl>(this, _$identity);
}

abstract class _PointDetails implements PointDetails {
  const factory _PointDetails(
          {required final Point point,
          required final Map<CoordinateSystem, LonLat> lonLats}) =
      _$PointDetailsImpl;

  @override
  Point get point;
  @override
  Map<CoordinateSystem, LonLat> get lonLats;

  /// Create a copy of PointDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PointDetailsImplCopyWith<_$PointDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
