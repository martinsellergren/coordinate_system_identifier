// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DataImpl _$$DataImplFromJson(Map<String, dynamic> json) => _$DataImpl(
  items:
      (json['items'] as List<dynamic>)
          .map((e) => CoordinateSystem.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$$DataImplToJson(_$DataImpl instance) =>
    <String, dynamic>{'items': instance.items};

_$CoordinateSystemImpl _$$CoordinateSystemImplFromJson(
  Map<String, dynamic> json,
) => _$CoordinateSystemImpl(
  epsgCode: (json['epsgCode'] as num).toInt(),
  name: json['name'] as String,
  proj4: json['proj4'] as String,
  bounds: Bounds.fromJson(json['bounds'] as Map<String, dynamic>),
  hasNadgrid: json['hasNadgrid'] as bool? ?? false,
);

Map<String, dynamic> _$$CoordinateSystemImplToJson(
  _$CoordinateSystemImpl instance,
) => <String, dynamic>{
  'epsgCode': instance.epsgCode,
  'name': instance.name,
  'proj4': instance.proj4,
  'bounds': instance.bounds,
  'hasNadgrid': instance.hasNadgrid,
};

_$BoundsImpl _$$BoundsImplFromJson(Map<String, dynamic> json) => _$BoundsImpl(
  northEast: LonLat.fromJson(json['northEast'] as Map<String, dynamic>),
  southWest: LonLat.fromJson(json['southWest'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$BoundsImplToJson(_$BoundsImpl instance) =>
    <String, dynamic>{
      'northEast': instance.northEast,
      'southWest': instance.southWest,
    };

_$LonLatImpl _$$LonLatImplFromJson(Map<String, dynamic> json) => _$LonLatImpl(
  lon: (json['lon'] as num).toDouble(),
  lat: (json['lat'] as num).toDouble(),
);

Map<String, dynamic> _$$LonLatImplToJson(_$LonLatImpl instance) =>
    <String, dynamic>{'lon': instance.lon, 'lat': instance.lat};
