// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'epsg_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EpsgJsonResponseImpl _$$EpsgJsonResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$EpsgJsonResponseImpl(
      bbox: BboxResp.fromJson(json['bbox'] as Map<String, dynamic>),
      coordinateSystem: json['coordinate_system'] == null
          ? null
          : CoordinateSystemResp.fromJson(
              json['coordinate_system'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$EpsgJsonResponseImplToJson(
        _$EpsgJsonResponseImpl instance) =>
    <String, dynamic>{
      'bbox': instance.bbox,
      'coordinate_system': instance.coordinateSystem,
    };

_$BboxImpl _$$BboxImplFromJson(Map<String, dynamic> json) => _$BboxImpl(
      southLatitude: (json['south_latitude'] as num).toDouble(),
      westLongitude: (json['west_longitude'] as num).toDouble(),
      northLatitude: (json['north_latitude'] as num).toDouble(),
      eastLongitude: (json['east_longitude'] as num).toDouble(),
    );

Map<String, dynamic> _$$BboxImplToJson(_$BboxImpl instance) =>
    <String, dynamic>{
      'south_latitude': instance.southLatitude,
      'west_longitude': instance.westLongitude,
      'north_latitude': instance.northLatitude,
      'east_longitude': instance.eastLongitude,
    };

_$CoordinateSystemRespImpl _$$CoordinateSystemRespImplFromJson(
        Map<String, dynamic> json) =>
    _$CoordinateSystemRespImpl(
      axis: (json['axis'] as List<dynamic>?)
          ?.map((e) => AxisResp.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CoordinateSystemRespImplToJson(
        _$CoordinateSystemRespImpl instance) =>
    <String, dynamic>{
      'axis': instance.axis,
    };

_$AxisRespImpl _$$AxisRespImplFromJson(Map<String, dynamic> json) =>
    _$AxisRespImpl(
      unit: json['unit'],
    );

Map<String, dynamic> _$$AxisRespImplToJson(_$AxisRespImpl instance) =>
    <String, dynamic>{
      'unit': instance.unit,
    };
