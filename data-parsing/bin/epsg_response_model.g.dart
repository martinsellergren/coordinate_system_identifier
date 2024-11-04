// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'epsg_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EpsgJsonResponseImpl _$$EpsgJsonResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$EpsgJsonResponseImpl(
      bbox: BboxResp.fromJson(json['bbox'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$EpsgJsonResponseImplToJson(
        _$EpsgJsonResponseImpl instance) =>
    <String, dynamic>{
      'bbox': instance.bbox,
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
