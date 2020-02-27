import 'package:json_annotation/json_annotation.dart';

part 'Blend.g.dart';

@JsonSerializable()
class Blend {
  final String name;
  final String description;
  final Map<String, int> ingredients;
  final List<String> emotions;
  final String application;

  Blend(this.name, this.description, this.ingredients, this.emotions, this.application);

  factory Blend.fromJson(Map<String, dynamic> json) => 
  _$BlendFromJson(json);

  Map<String, dynamic> toJson() => _$BlendToJson(this);
}