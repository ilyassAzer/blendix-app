// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Blend.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Blend _$BlendFromJson(Map<String, dynamic> json) {
  return Blend(
    json['name'] as String,
    json['description'] as String,
    Map<String, int>.from(json['ingredients']),
    (json['emotions'] as List)?.map((e) => e as String)?.toList(),
    json['application'] as String,
  );
}

Map<String, dynamic> _$BlendToJson(Blend instance) => <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'ingredients': instance.ingredients,
      'emotions': instance.emotions,
      'application': instance.application,
    };
