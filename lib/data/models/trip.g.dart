// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Trip _$TripFromJson(Map<String, dynamic> json) => Trip(
      name: json['name'] as String?,
      image: json['image'] as String?,
      rentedPropsCount: (json['rented_props_count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$TripToJson(Trip instance) => <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
      'rented_props_count': instance.rentedPropsCount,
    };
