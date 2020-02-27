import 'package:json_annotation/json_annotation.dart';

part 'Post.g.dart';

@JsonSerializable()
class Post {
  final String title;
  final String body;
  final String imageUrl;
  final String date;

  Post(this.title, this.body, this.date, this.imageUrl);

  factory Post.fromJson(Map<String, dynamic> json) => 
  _$PostFromJson(json);

  Map<String, dynamic> toJson() => _$PostToJson(this);

}