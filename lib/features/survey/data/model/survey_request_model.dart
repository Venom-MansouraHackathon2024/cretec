import 'package:json_annotation/json_annotation.dart';

part 'survey_request_model.g.dart';

@JsonSerializable()
class SurveyRequestModel {
  @JsonKey(name: 'Cement')
  final int cement;
  @JsonKey(name: 'Blast Furnace Slag')
  final int blastFurnaceSlag;
  @JsonKey(name: 'Fly Ash')
  final double flyAsh;
  @JsonKey(name: 'Water')
  final int water;
  @JsonKey(name: 'Superplasticizer')
  final int superplasticizer;
  @JsonKey(name: 'Coarse Aggregate')
  final int coarseAggregate;
  @JsonKey(name: 'Fine Aggregate')
  final int fineAggregate;
  @JsonKey(name: 'Age (day)')
  final int age;

  SurveyRequestModel({
    required this.cement,
    required this.blastFurnaceSlag,
    required this.fineAggregate,
    required this.flyAsh,
    required this.water,
    required this.coarseAggregate,
    required this.superplasticizer,
    required this.age
});

  factory SurveyRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SurveyRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$SurveyRequestModelToJson(this);
}
