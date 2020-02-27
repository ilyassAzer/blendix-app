import 'package:json_annotation/json_annotation.dart';

part 'EssentialOil.g.dart';

@JsonSerializable()
class EssentialOil {
  final String imageUrl;
  final String name;
  @JsonKey(name: 'latin_name')
  final String latinName;
  final String note;
  final String cost;
  final String description;
  @JsonKey(name: 'blends_well')
  final List<String> blendsWith;
  final String scent;
  @JsonKey(name: 'safe_use')
  final String safeUse;
  @JsonKey(name: 'potential_uses')
  final List<String> potentialUses;
  final List<String> origin;

  EssentialOil(this.name, this.latinName, this.note, this.cost,
  this.description, this.blendsWith, this.scent, this.safeUse,
  this.potentialUses, this.origin, this.imageUrl);

  factory EssentialOil.fromJson(Map<String, dynamic> json) => 
  _$EssentialOilFromJson(json);

  Map<String, dynamic> toJson() => _$EssentialOilToJson(this);

}
