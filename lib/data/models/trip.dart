import 'package:json_annotation/json_annotation.dart';

part 'trip.g.dart';

@JsonSerializable()
class Trip {
  final String? name;
  final String? image;
  @JsonKey(name: 'rented_props_count')
  final int? rentedPropsCount;

  Trip({this.name, this.image, this.rentedPropsCount});

  factory Trip.fromJson(Map<String, dynamic> json) => _$TripFromJson(json);

  Map<String, dynamic> toJson() => _$TripToJson(this);
}
