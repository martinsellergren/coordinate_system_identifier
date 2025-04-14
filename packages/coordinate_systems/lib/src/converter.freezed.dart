// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'converter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$GeoPoint {
  double get x => throw _privateConstructorUsedError;
  double get y => throw _privateConstructorUsedError;
  int get epsgCode => throw _privateConstructorUsedError;

  /// Create a copy of GeoPoint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GeoPointCopyWith<GeoPoint> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeoPointCopyWith<$Res> {
  factory $GeoPointCopyWith(GeoPoint value, $Res Function(GeoPoint) then) =
      _$GeoPointCopyWithImpl<$Res, GeoPoint>;
  @useResult
  $Res call({double x, double y, int epsgCode});
}

/// @nodoc
class _$GeoPointCopyWithImpl<$Res, $Val extends GeoPoint>
    implements $GeoPointCopyWith<$Res> {
  _$GeoPointCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GeoPoint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? x = null, Object? y = null, Object? epsgCode = null}) {
    return _then(
      _value.copyWith(
            x:
                null == x
                    ? _value.x
                    : x // ignore: cast_nullable_to_non_nullable
                        as double,
            y:
                null == y
                    ? _value.y
                    : y // ignore: cast_nullable_to_non_nullable
                        as double,
            epsgCode:
                null == epsgCode
                    ? _value.epsgCode
                    : epsgCode // ignore: cast_nullable_to_non_nullable
                        as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GeoPointImplCopyWith<$Res>
    implements $GeoPointCopyWith<$Res> {
  factory _$$GeoPointImplCopyWith(
    _$GeoPointImpl value,
    $Res Function(_$GeoPointImpl) then,
  ) = __$$GeoPointImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double x, double y, int epsgCode});
}

/// @nodoc
class __$$GeoPointImplCopyWithImpl<$Res>
    extends _$GeoPointCopyWithImpl<$Res, _$GeoPointImpl>
    implements _$$GeoPointImplCopyWith<$Res> {
  __$$GeoPointImplCopyWithImpl(
    _$GeoPointImpl _value,
    $Res Function(_$GeoPointImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GeoPoint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? x = null, Object? y = null, Object? epsgCode = null}) {
    return _then(
      _$GeoPointImpl(
        x:
            null == x
                ? _value.x
                : x // ignore: cast_nullable_to_non_nullable
                    as double,
        y:
            null == y
                ? _value.y
                : y // ignore: cast_nullable_to_non_nullable
                    as double,
        epsgCode:
            null == epsgCode
                ? _value.epsgCode
                : epsgCode // ignore: cast_nullable_to_non_nullable
                    as int,
      ),
    );
  }
}

/// @nodoc

class _$GeoPointImpl with DiagnosticableTreeMixin implements _GeoPoint {
  const _$GeoPointImpl({
    required this.x,
    required this.y,
    required this.epsgCode,
  });

  @override
  final double x;
  @override
  final double y;
  @override
  final int epsgCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GeoPoint(x: $x, y: $y, epsgCode: $epsgCode)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GeoPoint'))
      ..add(DiagnosticsProperty('x', x))
      ..add(DiagnosticsProperty('y', y))
      ..add(DiagnosticsProperty('epsgCode', epsgCode));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeoPointImpl &&
            (identical(other.x, x) || other.x == x) &&
            (identical(other.y, y) || other.y == y) &&
            (identical(other.epsgCode, epsgCode) ||
                other.epsgCode == epsgCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, x, y, epsgCode);

  /// Create a copy of GeoPoint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GeoPointImplCopyWith<_$GeoPointImpl> get copyWith =>
      __$$GeoPointImplCopyWithImpl<_$GeoPointImpl>(this, _$identity);
}

abstract class _GeoPoint implements GeoPoint {
  const factory _GeoPoint({
    required final double x,
    required final double y,
    required final int epsgCode,
  }) = _$GeoPointImpl;

  @override
  double get x;
  @override
  double get y;
  @override
  int get epsgCode;

  /// Create a copy of GeoPoint
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GeoPointImplCopyWith<_$GeoPointImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ConvertResult {
  GeoPoint get point => throw _privateConstructorUsedError;

  /// If false, the result may be slightly inaccurate because transformations
  /// with meter-level accuracy for this coordinate system is not supported.
  /// It's because the coordinate system uses NADGRIDs.
  bool get isExact => throw _privateConstructorUsedError;

  /// Create a copy of ConvertResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConvertResultCopyWith<ConvertResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConvertResultCopyWith<$Res> {
  factory $ConvertResultCopyWith(
    ConvertResult value,
    $Res Function(ConvertResult) then,
  ) = _$ConvertResultCopyWithImpl<$Res, ConvertResult>;
  @useResult
  $Res call({GeoPoint point, bool isExact});

  $GeoPointCopyWith<$Res> get point;
}

/// @nodoc
class _$ConvertResultCopyWithImpl<$Res, $Val extends ConvertResult>
    implements $ConvertResultCopyWith<$Res> {
  _$ConvertResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConvertResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? point = null, Object? isExact = null}) {
    return _then(
      _value.copyWith(
            point:
                null == point
                    ? _value.point
                    : point // ignore: cast_nullable_to_non_nullable
                        as GeoPoint,
            isExact:
                null == isExact
                    ? _value.isExact
                    : isExact // ignore: cast_nullable_to_non_nullable
                        as bool,
          )
          as $Val,
    );
  }

  /// Create a copy of ConvertResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GeoPointCopyWith<$Res> get point {
    return $GeoPointCopyWith<$Res>(_value.point, (value) {
      return _then(_value.copyWith(point: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ConvertResultImplCopyWith<$Res>
    implements $ConvertResultCopyWith<$Res> {
  factory _$$ConvertResultImplCopyWith(
    _$ConvertResultImpl value,
    $Res Function(_$ConvertResultImpl) then,
  ) = __$$ConvertResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({GeoPoint point, bool isExact});

  @override
  $GeoPointCopyWith<$Res> get point;
}

/// @nodoc
class __$$ConvertResultImplCopyWithImpl<$Res>
    extends _$ConvertResultCopyWithImpl<$Res, _$ConvertResultImpl>
    implements _$$ConvertResultImplCopyWith<$Res> {
  __$$ConvertResultImplCopyWithImpl(
    _$ConvertResultImpl _value,
    $Res Function(_$ConvertResultImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ConvertResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? point = null, Object? isExact = null}) {
    return _then(
      _$ConvertResultImpl(
        point:
            null == point
                ? _value.point
                : point // ignore: cast_nullable_to_non_nullable
                    as GeoPoint,
        isExact:
            null == isExact
                ? _value.isExact
                : isExact // ignore: cast_nullable_to_non_nullable
                    as bool,
      ),
    );
  }
}

/// @nodoc

class _$ConvertResultImpl
    with DiagnosticableTreeMixin
    implements _ConvertResult {
  const _$ConvertResultImpl({required this.point, required this.isExact});

  @override
  final GeoPoint point;

  /// If false, the result may be slightly inaccurate because transformations
  /// with meter-level accuracy for this coordinate system is not supported.
  /// It's because the coordinate system uses NADGRIDs.
  @override
  final bool isExact;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ConvertResult(point: $point, isExact: $isExact)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ConvertResult'))
      ..add(DiagnosticsProperty('point', point))
      ..add(DiagnosticsProperty('isExact', isExact));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConvertResultImpl &&
            (identical(other.point, point) || other.point == point) &&
            (identical(other.isExact, isExact) || other.isExact == isExact));
  }

  @override
  int get hashCode => Object.hash(runtimeType, point, isExact);

  /// Create a copy of ConvertResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConvertResultImplCopyWith<_$ConvertResultImpl> get copyWith =>
      __$$ConvertResultImplCopyWithImpl<_$ConvertResultImpl>(this, _$identity);
}

abstract class _ConvertResult implements ConvertResult {
  const factory _ConvertResult({
    required final GeoPoint point,
    required final bool isExact,
  }) = _$ConvertResultImpl;

  @override
  GeoPoint get point;

  /// If false, the result may be slightly inaccurate because transformations
  /// with meter-level accuracy for this coordinate system is not supported.
  /// It's because the coordinate system uses NADGRIDs.
  @override
  bool get isExact;

  /// Create a copy of ConvertResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConvertResultImplCopyWith<_$ConvertResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
