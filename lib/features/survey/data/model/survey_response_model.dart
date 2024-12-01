import 'package:json_annotation/json_annotation.dart';

part 'survey_response_model.g.dart';

@JsonSerializable()
class SurveyResponseModel {
  @JsonKey(name: 'Concrete_Compressive_Strength')
  final String concreteCompressiveStrength;
  final int statusCode;

  SurveyResponseModel({
    required this.statusCode,
    required this.concreteCompressiveStrength,
  });

  factory SurveyResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SurveyResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$SurveyResponseModelToJson(this);
}
