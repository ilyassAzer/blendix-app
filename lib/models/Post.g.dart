// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) {
  return Post(
    json['title'] as String,
    json['body'] as String,
    json['date'] as String,
    json['imageUrl'] as String,
  );
}

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'title': instance.title,
      'body': instance.body,
      'imageUrl': instance.imageUrl,
      'date': instance.date,
    };
