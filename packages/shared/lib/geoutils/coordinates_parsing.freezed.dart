// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coordinates_parsing.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CoordinatesParsingResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LonLat lonLat) wellDefined,
    required TResult Function(Point point) ambiguous,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(LonLat lonLat)? wellDefined,
    TResult? Function(Point point)? ambiguous,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LonLat lonLat)? wellDefined,
    TResult Function(Point point)? ambiguous,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WellDefined value) wellDefined,
    required TResult Function(Ambiguous value) ambiguous,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WellDefined value)? wellDefined,
    TResult? Function(Ambiguous value)? ambiguous,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WellDefined value)? wellDefined,
    TResult Function(Ambiguous value)? ambiguous,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoordinatesParsingResultCopyWith<$Res> {
  factory $CoordinatesParsingResultCopyWith(CoordinatesParsingResult value,
          $Res Function(CoordinatesParsingResult) then) =
      _$CoordinatesParsingResultCopyWithImpl<$Res, CoordinatesParsingResult>;
}

/// @nodoc
class _$CoordinatesParsingResultCopyWithImpl<$Res,
        $Val extends CoordinatesParsingResult>
    implements $CoordinatesParsingResultCopyWith<$Res> {
  _$CoordinatesParsingResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CoordinatesParsingResult
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$WellDefinedImplCopyWith<$Res> {
  factory _$$WellDefinedImplCopyWith(
          _$WellDefinedImpl value, $Res Function(_$WellDefinedImpl) then) =
      __$$WellDefinedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({LonLat lonLat});

  $LonLatCopyWith<$Res> get lonLat;
}

/// @nodoc
class __$$WellDefinedImplCopyWithImpl<$Res>
    extends _$CoordinatesParsingResultCopyWithImpl<$Res, _$WellDefinedImpl>
    implements _$$WellDefinedImplCopyWith<$Res> {
  __$$WellDefinedImplCopyWithImpl(
      _$WellDefinedImpl _value, $Res Function(_$WellDefinedImpl) _then)
      : super(_value, _then);

  /// Create a copy of CoordinatesParsingResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lonLat = null,
  }) {
    return _then(_$WellDefinedImpl(
      lonLat: null == lonLat
          ? _value.lonLat
          : lonLat // ignore: cast_nullable_to_non_nullable
              as LonLat,
    ));
  }

  /// Create a copy of CoordinatesParsingResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LonLatCopyWith<$Res> get lonLat {
    return $LonLatCopyWith<$Res>(_value.lonLat, (value) {
      return _then(_value.copyWith(lonLat: value));
    });
  }
}

/// @nodoc

class _$WellDefinedImpl implements WellDefined {
  const _$WellDefinedImpl({required this.lonLat});

  @override
  final LonLat lonLat;

  @override
  String toString() {
    return 'CoordinatesParsingResult.wellDefined(lonLat: $lonLat)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WellDefinedImpl &&
            (identical(other.lonLat, lonLat) || other.lonLat == lonLat));
  }

  @override
  int get hashCode => Object.hash(runtimeType, lonLat);

  /// Create a copy of CoordinatesParsingResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WellDefinedImplCopyWith<_$WellDefinedImpl> get copyWith =>
      __$$WellDefinedImplCopyWithImpl<_$WellDefinedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LonLat lonLat) wellDefined,
    required TResult Function(Point point) ambiguous,
  }) {
    return wellDefined(lonLat);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(LonLat lonLat)? wellDefined,
    TResult? Function(Point point)? ambiguous,
  }) {
    return wellDefined?.call(lonLat);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LonLat lonLat)? wellDefined,
    TResult Function(Point point)? ambiguous,
    required TResult orElse(),
  }) {
    if (wellDefined != null) {
      return wellDefined(lonLat);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WellDefined value) wellDefined,
    required TResult Function(Ambiguous value) ambiguous,
  }) {
    return wellDefined(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WellDefined value)? wellDefined,
    TResult? Function(Ambiguous value)? ambiguous,
  }) {
    return wellDefined?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WellDefined value)? wellDefined,
    TResult Function(Ambiguous value)? ambiguous,
    required TResult orElse(),
  }) {
    if (wellDefined != null) {
      return wellDefined(this);
    }
    return orElse();
  }
}

abstract class WellDefined implements CoordinatesParsingResult {
  const factory WellDefined({required final LonLat lonLat}) = _$WellDefinedImpl;

  LonLat get lonLat;

  /// Create a copy of CoordinatesParsingResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WellDefinedImplCopyWith<_$WellDefinedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AmbiguousImplCopyWith<$Res> {
  factory _$$AmbiguousImplCopyWith(
          _$AmbiguousImpl value, $Res Function(_$AmbiguousImpl) then) =
      __$$AmbiguousImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Point point});

  $PointCopyWith<$Res> get point;
}

/// @nodoc
class __$$AmbiguousImplCopyWithImpl<$Res>
    extends _$CoordinatesParsingResultCopyWithImpl<$Res, _$AmbiguousImpl>
    implements _$$AmbiguousImplCopyWith<$Res> {
  __$$AmbiguousImplCopyWithImpl(
      _$AmbiguousImpl _value, $Res Function(_$AmbiguousImpl) _then)
      : super(_value, _then);

  /// Create a copy of CoordinatesParsingResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? point = null,
  }) {
    return _then(_$AmbiguousImpl(
      point: null == point
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as Point,
    ));
  }

  /// Create a copy of CoordinatesParsingResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PointCopyWith<$Res> get point {
    return $PointCopyWith<$Res>(_value.point, (value) {
      return _then(_value.copyWith(point: value));
    });
  }
}

/// @nodoc

class _$AmbiguousImpl implements Ambiguous {
  const _$AmbiguousImpl({required this.point});

  @override
  final Point point;

  @override
  String toString() {
    return 'CoordinatesParsingResult.ambiguous(point: $point)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AmbiguousImpl &&
            (identical(other.point, point) || other.point == point));
  }

  @override
  int get hashCode => Object.hash(runtimeType, point);

  /// Create a copy of CoordinatesParsingResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AmbiguousImplCopyWith<_$AmbiguousImpl> get copyWith =>
      __$$AmbiguousImplCopyWithImpl<_$AmbiguousImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LonLat lonLat) wellDefined,
    required TResult Function(Point point) ambiguous,
  }) {
    return ambiguous(point);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(LonLat lonLat)? wellDefined,
    TResult? Function(Point point)? ambiguous,
  }) {
    return ambiguous?.call(point);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LonLat lonLat)? wellDefined,
    TResult Function(Point point)? ambiguous,
    required TResult orElse(),
  }) {
    if (ambiguous != null) {
      return ambiguous(point);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WellDefined value) wellDefined,
    required TResult Function(Ambiguous value) ambiguous,
  }) {
    return ambiguous(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WellDefined value)? wellDefined,
    TResult? Function(Ambiguous value)? ambiguous,
  }) {
    return ambiguous?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WellDefined value)? wellDefined,
    TResult Function(Ambiguous value)? ambiguous,
    required TResult orElse(),
  }) {
    if (ambiguous != null) {
      return ambiguous(this);
    }
    return orElse();
  }
}

abstract class Ambiguous implements CoordinatesParsingResult {
  const factory Ambiguous({required final Point point}) = _$AmbiguousImpl;

  Point get point;

  /// Create a copy of CoordinatesParsingResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AmbiguousImplCopyWith<_$AmbiguousImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
