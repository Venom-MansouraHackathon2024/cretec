// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SurveyResponseModel _$SurveyResponseModelFromJson(Map<String, dynamic> json) =>
    SurveyResponseModel(
      statusCode: (json['statusCode'] as num).toInt(),
      concreteCompressiveStrength:
          json['Concrete_Compressive_Strength'] as String,
    );

Map<String, dynamic> _$SurveyResponseModelToJson(
        SurveyResponseModel instance) =>
    <String, dynamic>{
      'Concrete_Compressive_Strength': instance.concreteCompressiveStrength,
      'statusCode': instance.statusCode,
    };
