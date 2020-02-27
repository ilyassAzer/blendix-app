// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'EssentialOil.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EssentialOil _$EssentialOilFromJson(Map<String, dynamic> json) {
  return EssentialOil(
    json['name'] as String,
    json['latin_name'] as String,
    json['note'] as String,
    json['cost'] as String,
    json['description'] as String,
    (json['blends_well'] as List)?.map((e) => e as String)?.toList(),
    json['scent'] as String,
    json['safe_use'] as String,
    (json['potential_uses'] as List)?.map((e) => e as String)?.toList(),
    (json['origin'] as List)?.map((e) => e as String)?.toList(),
    json['imageUrl'] as String,
  );
}

Map<String, dynamic> _$EssentialOilToJson(EssentialOil instance) =>
    <String, dynamic>{
      'imageUrl': instance.imageUrl,
      'name': instance.name,
      'latin_name': instance.latinName,
      'note': instance.note,
      'cost': instance.cost,
      'description': instance.description,
      'blends_well': instance.blendsWith,
      'scent': instance.scent,
      'safe_use': instance.safeUse,
      'potential_uses': instance.potentialUses,
      'origin': instance.origin,
    };
