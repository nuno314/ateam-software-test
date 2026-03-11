import 'package:json_annotation/json_annotation.dart';

part 'living_style.g.dart';

@JsonSerializable()
class LivingStyle {
  final String? name;
  final String? image;

  LivingStyle({this.name, this.image});

  factory LivingStyle.fromJson(Map<String, dynamic> json) =>
      _$LivingStyleFromJson(json);

  Map<String, dynamic> toJson() => _$LivingStyleToJson(this);
}
