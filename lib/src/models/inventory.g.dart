// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InventoryImpl _$$InventoryImplFromJson(Map<String, dynamic> json) =>
    _$InventoryImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      image: json['image'] as String,
    );

Map<String, dynamic> _$$InventoryImplToJson(_$InventoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
    };
